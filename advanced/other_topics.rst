Game start sequence
-------------------
This is an overview of the steps that happen between when the player runs
your game on their computer to when they can start playing it.

.. image:: img/game_start_sequence.png
   :alt: Game start sequence


First game room configuration
-----------------------------
An ESC script is used to tell Escoria which room to open as your game's
first "room". The script is configured in Godot's settings under "Escoria/Game
Start Script"

.. image:: img/logo_game_start_script.png
   :alt: Start script configuration location

This script needs to contain two events:

* ":init" - this event will run as soon as Escoria has been
  initialised.   Place any commands to display company logos or short opening
  cutscenes here (see :ref:`logo-label`).
  Alternatively, use ``:init`` to just display your game's main menu.

.. code-block::

   :init
   # Show main menu immediately without a company logo screen
   show_menu main

* ":newgame" - this event will run when the player selects "Start New Game"
  on your game's menu. This needs to include a ``change_scene`` call to
  open your game's first room.

.. code-block::

   :newgame
   change_scene res://game/rooms/startroom/startroom.tscn

Puzzles
-------
Puzzles can be broken down into two broad areas.

- Escoria script puzzles

Escoria script puzzles are ones that can be completely made using Escoria
script. Demo room 9 provides an example of this. Through the use of inventory
items and game variables, puzzles can be progressed and their status
determined.

An example of this is getting past a door bodyguard with a pass phrase.
In the game, when the character "looks at" a note on a computer that reads
"the password is abc123", Escoria script can be used to set a
"password_obtained" variable to true. When the character later talks to the
bodyguard, the script logic can check whether "password_obtained" is set to
true and based on that provide new dialog options, or run an animation to
move the bodyguard away from the door.

- GDscript based puzzles

In the event you wanted to include a puzzle that requires more complexity than
Escoria script can provide, you can use native GDscript to implement this.
Demo room 8 provides an example of this. The "spawn" Escoria script is used to
spawn the GDScript scene that contains your puzzle (arcade puzzle etc).
Example:

.. code-block:: gdscript

    spawn puzzle "res://game/rooms/room08/puzzle/10_buttons_puzzle.tscn"


Your Godot scene can contain anything you like - you're
only limited by Godot's limitations and your imagination. The main requirements
of your Godot scene are :

- In your ready script, you need to hide Escoria

.. code-block:: gdscript

    escoria.main.current_scene.game.hide_ui()
    escoria.main.current_scene.hide()


- As a result of what happens as the player progresses the puzzle, you can pass
  state back to Escoria via Escoria's global variables, run an
  animation to change the look of the room post-puzzle, and deactivate /
  activate objects in your room as a result of the puzzle's success/failure.

.. code-block:: gdscript

    # set a global
    escoria.globals_manager.set_global("r8_m_door_open", true)

    # Run an animation to change what the player sees in the room
    escoria.object_manager.get_object("r8_m_door").set_state("door_open")

    # Make the puzzle no longer available to use as the player completed it
    escoria.object_manager.get_object("r8_mini_puzzle_button").active = false

- When the player quits / completes / fails the puzzle, you need to return
  control back to escoria, then delete the puzzle scene using the
  "queue_free()" command.

.. code-block:: gdscript

    escoria.main.current_scene.game.show_ui()
    escoria.main.current_scene.show()
    queue_free()


States verses animations
------------------------
The features offered by the state and animation commands are rather similar.
This documentation section is to help you choose when to use a particular
command.

``anim`` is used for starting an animation and immediately returning control
to the next command in the script. This is good for animations that will run
once (like part of a cutscene), allowing you to have furher script commands
running while the animation is executing. As an example, you could start an
animation of a bird flying across the screen, then a separate one of a car
driving along - both animations would run simultaneously.

``anim_block`` is used when you want to control the pacing of your game /
cutscene, and ensure that an animation completes before further game commands
are processed. As an example, if you had separate animations of someone walking
up to a door and another showing them opening it, using ``anim_block`` to play
the person walking animation would ensure they reached the door before
it was opened.

``set_state`` is like combining a "set global" command with an "anim" command.
It retains a state which can be queried (e.g. checking if the door is in an
unlocked or a locked state) and runs an animation (if an animation with the
same name exists in this room). State is preserved between rooms, meaning that
if you set door 2's state to "dooropen" and leave the room, when you come back,
if you query the state of door 2, it will still return "dooropen".



** Comment required here about whether state will play with "immediate" or not
when you reenter a room - still under discussion

** Comment required here once ESC script supports querying the current state
of an ESCItem



.. _logo-label:

Adding a company logo or introductory cutscene
----------------------------------------------
A company logo or introductory cutscene that plays before the menu of your
game is displayed is optional for your game. To create one:

* Create an ``ESCRoom`` to display your logo or cutscene introduction.
  Depending on your requirements this may be any combination of ESC
  commands and animations driven by Godot ``AnimationPlayers``.

* Create an ESC script and attach it
  to the ``ESCRoom``. Put the commands in here to display your
  game logo / opening scene (remembering to use the "| NO_UI" flags so your
  game's user interface is not displayed over the top of it).
  As this animation will play every time someone starts your
  game it is recommended to keep this scene to a few seconds in length. An
  example script for an introductory logo scene driven entirely by an
  animation is:

.. code-block::

   # Example introductory logo script
   :setup | NO_UI
   # Play the reset animation to make sure everythings as we expect it to be
   anim_block intro_animation_player RESET

   :ready | NO_UI
   # Play the "intro" animation
   anim_block intro_animation_player intro

   show_menu main

* Ensure at the end of your logo / cutscene that you have the
  ``show_menu main`` call to pass control back to the menu.

* Identify the main script that starts your game. This can be found in Godot's
  settings under "Escoria/Game Start Script"

.. image:: img/logo_game_start_script.png
   :alt: Start script configuration location

* Modify your start script so that it runs your intro scene as part of the
  ``:init`` event. It should also have a ":newgame" event to define which
  room should be loaded when a player starts a new game.

.. code-block::

   :init
   # Play Escoria logo cutscene
   change_scene res://game/rooms/logo/logo.tscn

   # Showing main menu
   show_menu main

   :newgame
   change_scene res://game/rooms/startroom/startroom.tscn

.. _faq:

FAQ
===

How do I specify the first game room?
-------------------------------------

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

How do I implement puzzles?
---------------------------

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


What's the difference between states and animations?
----------------------------------------------------

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

How do I add a company logo or introductory cutscene?
-----------------------------------------------------

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


How do I change the characters costume?
---------------------------------------

There are two ways to change the look of a character. The first is to create
an entirely new character (i.e. a new Godot Scene with an `ESCPlayer` node,
animated sprite, collision area, etc). The second option is to change just the
animations (i.e. the sprites used) for the character.

Changing the entire player scene
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This option might be appropriate if you need to change something fundamental
about a character for a particular scene (e.g. if for a specific level you only
want the character to be able to walk in 2 directions where they normally have
8 directions defined). If you choose this option, create the character scene,
then in your game room (`ESCRoom`) set the `Player Scene` parameter to point at
the new character scene.

Changing the character animations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Changing the sprite set of a character so they look different (adding a hat,
glasses, or changing their clothes, for example) is an easy task. The process
involves creating new animations, then telling Escoria to change the character
to use the animations as its default at the appropriate time.

Create new animations
^^^^^^^^^^^^^^^^^^^^^

You should already have idle, talk, and walk animations defined for your
character. Open your character's animated sprite.

.. image:: img/character_animated_sprite_node.png
   :alt: Animated sprite node

Looking at the Animations window you should see the SpriteFrames defined.

.. image:: img/character_animations_original.png
   :alt: Defined animations

Create new animations matching your new spriteset and call them something
appropriate. In this example, the demonstration character has had some
jester clothes put on.

.. image:: img/character_animations_additional.png
   :alt: Updated animations

Go back to your character (`ESCPlayer`) node and, using the dropdown arrow on
the Animations parameter, select the menu option to create a new
**ESCAnimationResource**.

.. image:: img/character_animations_tres.png
   :alt: Updated animations

As when you created your player originally, set up the correct number of
directions for the character with the associated direction angles, as well as
the direction, idles and speak animations pointing at your newly created
animations.

.. image:: img/character_animations_tres2.png
   :alt: Updated animations

Use the dropdown again, choosing the **save** option. Give the file
an appropriate name and location in the file dialog window that appears.

Assign the new animations to the character
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Now that you have the animations defined, you need to tell Escoria when you
want to use them. If the player buys a Jester outfit, for example, you may
script the "use" option for the Jester outfit inventory item to change the
animation set. The command used is "set_animations", and you pass it the
path to your **ESCAnimationResource** file.


inventory_jester_outfit.esc::
  :use

  set_animations player res://game/characters/mark/mark_animations_jester.tres


How do I add speech to my game?
-------------------------------

* Escoria uses a configuration parameter to specify where in your file
  structure to find your game's audio files. This setting can be found in
  `Project/Project Settings/Escoria/Sound/Speech Folder`. Set this to a
  location appropriate for your game - e.g. `res://game/speech`.

* Copy your sound and music files into this folder. These can be any audio
  format that Godot supports as listed here
  https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_audio_samples.html?highlight=ogg#supported-files

* The name of the audio file will act as a key for the `say` command so it
  knows which audio file to play. The name of the file (without any extension)
  must be the same as the key. As an example, to play file `hello_cat.ogg`,
  your Escoria code would look like::

    say player hello_cat:"Good morning cat!"


How do I translate my game into other languages?
------------------------------------------------

The detail below is only a high-level overview of Internationalization support
in Godot. For more information, please see Godot's translation documentation
https://docs.godotengine.org/en/stable/tutorials/i18n/internationalizing_games.html

Creating text translations
~~~~~~~~~~~~~~~~~~~~~~~~~~

Escoria takes advantage of Godot's built-in translation functionality for
providing language support. Translation information is found in Godot's
`Project/Project Settings/Localization` menu (text in `Translations`, audio in
`Remaps`).

Text translation relies on CSV files, an example of which is::
  keys,en,es
  ROOM1_greeting,"Hello, friend!","Hola, amigo!"

Once the CSV file containing the translation text has been created, use
Godot's importer to import it (under
Project/Project Settings/Localization/Tranlations/Add).

For further details on creating and importing translations see
https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_translations.html


Using text translations in your game
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The key ("ROOM1_greeting" in the above example) is used in the "say" script
command to tell Escoria which translation to look for. Place this key with
a colon prior to the text in your script file::

  :look
  say player ROOM1_greeting:"Hello, friend!"

Creating audio translations
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create your audio files to match the ones in the game's original language.
Store these files in the same location as your original recordings.

While the files can be called whatever you like, keeping the same name as the
original file and adding a language identifier is an easy way to keep track of
your files. e.g. A file called `hello.ogg` might have matching files called
`hello_de.ogg` for the German translation, and `hello_fr.ogg` for the french.

Using audio translations in your game
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following is a high-level overview of the language remapping functionality
provided by Godot. For more in-depth documentation, please see
https://docs.godotengine.org/en/stable/tutorials/i18n/internationalizing_games.html?highlight=remaps#localizing-resources

Godot provides a mechanism to map files between the different languages you
provide for your game. The mapping function can be found under
Project/Project Settings/Localization/Remaps.

Use the `Add` button in the `Resources` part of the window, choosing the audio
file you wish to provide a translation for (e.g. `hello.ogg`). Once you've
added the file, highlight it, and use the `Add` button in the `Remaps by
Locale` section of the window. In the file browser that appears, find the
matching audio file in the new language (e.g. `hello_fr.ogg`). Next to this
file, use the `Locale` pulldown menu to tell Godot what language that file
features. Add more remaps if you are supporting additional languages.

Repeat this process for every source file, and every translated
version you have for it.

Changing the language used by your game
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

How the player chooses the language they wish to play your game in is entirely
up to you. You may provide them with flags or a pulldown menu, for example, to
choose from as part of your game menu. Once a language has been chosen, your
game menu needs to run the following commands to tell Godot to use the
selected language::

  TranslationServer.set_locale(language)
  escoria.settings["text_lang"] = language

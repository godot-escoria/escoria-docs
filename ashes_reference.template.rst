.. _ashes_language_reference:

ASHES language reference
========================

Variables
---------

Variables in the ASHES scripting language behave just like those in other 
programming languages.  They are used to store information that can change 
and also be referenced in various parts of your script.

A variable in ASHES can store a string, a number, or a boolean value.

Variables also obey scoping rules in a way very similar to GDScript and 
Python.

See also :ref:`global_flags` for information on global variables (aka. 
global flags).

Objects
-------

Global IDs
~~~~~~~~~~

All objects in the game have a global ID which is used to identify them
in commands. The ID is configured in the object's scene.

States
~~~~~~

Each object can have a "state". This state is stored in the *global state*
of the game and as part of a savegame. The object's state is set when the
scene is instanced.

States are most commonly used to execute an animation. When an animation in
the object's scene has the same name as a state being set, the animation is
run when that state is set.

An example of where you might want to use states might be:
If your game has a blank canvas and you "use" some paint on it to paint a
picture, setting the state to "painted" would play the corresponding
animation which would set the canvas graphic to the "painted" version.
When the game is saved, the "painted" state of the canvas would be stored,
so when the savegame is loaded the "painted" (rather than the blank) image 
would be shown.


For :doc:`bg_sound </api/supporting_classes/ESCSoundPlayer>` and
:doc:`bg_music </api/supporting_classes/ESCMusicPlayer>` objects, the state 
also represents the music or sound that is currently running.

Active objects
~~~~~~~~~~~~~~

Objects can be either **active** or **inactive**. Inactive objects are 
hidden and not clickable.

You can set whether an object is "active" by using the 
:doc:`set_active </api/commands/SetActiveCommand>` command or the 
:doc:`set_active_if_exists </api/commands/SetActiveIfExistsCommand>`.

To check whether an object is "active", you can can use an ``is active`` check:
If, say, you're checking whether "elaine" is active, you can check using 
script like this:

.. code-block::

  :ready
    if $elaine is active:y
      say($player, "It would appear Elaine hasn't arrived yet.")

.. hint::

  If you prefix an object's global ID with a `$`, Escoria will treat the
  global ID as a special variable, as though you were referring to the 
  object itself.

  You can also use the object's global ID surrounded by quotes, just like 
  you would any other string, if you prefer.
      
Interactive objects
~~~~~~~~~~~~~~~~~~~

If you have an object that only blocks the terrain and is something you can
move behind, you probably don't want to bother with interaction areas
and tooltip texts. In this case, just set ``is_interactive`` to
``false`` and the item will not be checked for interactions. Its mouse
events won't be connected, either. This can be set either by modifying the
object in the Godot editor, or by using the 
:doc:`set_interactive </api/commands/SetInteractiveCommand>` command in 
an ASHES script.

.. _global_flags:

Global flags
------------

Global flags (also known as global variables) define the state of the game and
can be true/false, a number, or a string. These are similar to regular
variables.

You can use flags/variables as conditions when you need to branch code, e.g. by 
using an ``if`` statement.

Global flags are, as the name implies, global, and continue to survive after
leaving the room where they are created/set. This means that a value set
early in your game is still able to be queried many rooms later.

Global flags can be created anywhere in an Escoria script as needed using the
:doc:`set_global </api/commands/SetGlobalCommand>` command or by using the 
``global`` keyword. 

.. code-block::

  set_global("number_of_keys_found", 3)

  global my_global_variable = false

.. hint::

  The use of ``set_global`` is discouraged as it is a legacy command 
  leftover from previous versions of Escoria.
  
A global flag may produce an error if you haven't declared or defined it. 

If you do define a global flag when declaring it 
(e.g. ``global some_variable = false``), it will only run this initialization 
once; that is, subsequent executions of that line will be ignored.

The code below--that configures a room--is
executed the first time the room is visited, but won't be run again should
the player return to the room.

.. code-block::

  :ready

    global room1_visited = false

    if !room1_visited:
      # Set room1_visited variable so this code runs only once
      room1_visited  = true # or: set_global($room1_visited, true)

      # Play the window's sunrise animation
      anim("window", "play_sunrise_effect")

Inventory
~~~~~~~~~

To check whether a particular object is in your inventory, you can use an
``in inventory`` check with the object's global ID as part of an ``if`` 
statement. Example:

.. code-block::

  # Waits for 5 seconds if the player has the key in its inventory

  if $key in inventory:
    wait(5)

Events
------

All ASHES scripts are divided into a series of events which in turn run
commands and dialogs.

To use an event in your script, specify the name of the event preceded by a
colon. All commands following the event identifier are considered part of that
event until another event is defined in the same script file.

.. note:: 

  Similar to languages like GDScript and Python, all commands and scripts must 
  be properly indented. This means that an event definition must appear at
  the very start of its own line with **no tabs or whitespace** before it. 
  Any code appearing as part of the event must begin with a single indent, 
  or the appropriate level of indentation based on what kind of code block 
  is being used.

.. code-block::

  :push
    say($player, "I pushed the door.")
    say($player, "It didn't do anything.")

  # A new ("pull") event starts here
  :pull
    if $key in inventory:
      # Note the two indents here.
      say($player, "The door is now unlocked and open".)

Built-in events
~~~~~~~~~~~~~~~

Some events are hard-coded into Escoria. The ones that are
"internal engine use only" are

-  ``:print``
-  ``:load``
-  ``:room_selector``
-  ``:transition_in``
-  ``:transition_out``


Events that are considered "for game developer use" are:

.. _ready-label:

- ``:init`` : Run first as part of your primary Escoria game startup script. 
  This is where  you would place the commands for a company logo cutscene.
- ``:exit_scene`` : Will be called when "Is Exit" is enabled on an ``ESCItem`` 
  and the player "uses" that item. You might play a closing door sound here, for
  example.
- ``:newgame`` : This is what is called when "Start Game" is chosen from your menu.
  The main use would be to have a :doc:`change_scene </api/commands/ChangeSceneCommand>` 
  command here to load your first game room.
- ``:setup`` : This runs first as part of loading a room. Anything coded here will
  happen before the room is visible (i.e. before the "transition in").
- ``:ready`` : These are commands that will run when a room loads, but only after 
  it becomes visible (i.e. once ``:setup`` completes and after the "transition in").


An example of how you might initialize a room is:

.. code-block::

  :setup
    if ESC_LAST_SCENE == "scene1":
      teleport($player, $door1)
    elif ESC_LAST_SCENE == "scene2":
      teleport($player, "door2")

This example will teleport the player to the appropriate point in the scene
(the ``ESCLocation`` "door1" or "door2") depending on the last visited scene.
The last visited scene is stored in the special global state
``ESC_LAST_SCENE``.


Plugin Events
~~~~~~~~~~~~~

Any plugins you use may define their own events that you can script
actions for. The sample user interfaces, for example, include events for
``look`` and ``use``. If you are using the 9-verb interface and click the ``look``
button followed by an object, then any code inside the ``:look`` event in that
object's script will be run.

User-created events
~~~~~~~~~~~~~~~~~~~

You can create an event with any name you like (though avoiding event names
Escoria already uses, e.g. ``init``, is suggested in order to avoid bugs and/or
confusion.)

Most of the time you'll define events as part of creating your UI (e.g. you
might create a nose icon and attach it to a "sniff" event). See
:ref:`here <verbs>` for further details.

Event flags
~~~~~~~~~~~

Events understand a series of flags. The flags that are currently
implemented include the following:

-  ``TK`` stands for "telekinetic": The player **won't** walk over
   to an item before saying a line of dialog.
-  ``NO_TT`` stands for "No tooltip": The tooltip is hidden for the
   duration of the event.
-  ``NO_UI`` stands for "No User Interface": The UI is hidden for the duration
   of the event. Useful for when you want something to look like a cutscene
   but don't want to disable input for skipping dialog.
-  ``NO_SAVE`` disables saving: Use this in cutscenes and anywhere a
   badly-timed autosave would leave your game in a messed-up state.

Specify a flag using the event name, a pipe character, and then the flag itself.
For example:

.. code-block::

  :look | TK
    say($current_player, "I don't see anything unusual about it.")


Commands
--------

Commands consist of a single word followed by some parameters. Parameters can
be a string, number, or boolean.

.. code-block::

  # one parameter "player" (or, equivalently, $player), another parameter "hello world"
  say($player, "hello world")

.. note::

  Recall that if you can prefix an object's global ID with a `$` and Escoria 
  will treat the global ID as a special variable, as though you were referring to the 
  object itself.

.. _conditions:
   
Conditions
~~~~~~~~~~

In order to run a command depending on the value of a flag or variable, you can 
make use of an ``if``-statement, just like you would in a language like GDScript or 
Python.

.. hint::
  Placing the character ``!`` before a flag or variable can be used to negate that flag.

Example:

.. code-block::

  # runs the command only if the door_open flag is true
  if door_open:
    say($player, "The door is open")

.. code-block::

  # runs the group (block) only if door_open is false and "key" is in the player's inventory
  if (!door_open and key in inventory):
    say($player, "The door is closed. Maybe I can try this key in my inventory...")

Additionally, there is a set of comparison operators for use with numbers: 
``==``, ``>``, ``>=``, ``<``, and ``<=``, all of which can be negated.

Example:

.. code-block::

  # runs the command only if the value of the variable pieces_of_eight is greater than 5
  if pieces_of_eight > 5:
    set_state(inv_pieces_of_eight, "money_bag")

Blocks
~~~~~~

Blocks are groups of commands (and other script) that are run after a set of conditions is met 
or are part of a particular "scope", e.g. an event, or a dialog. Each new block has its own level 
of indentation, with blocks being able to be nested inside of other blocks which require additional 
indentation. 

(In technical terms, each "block" has its own "scope".)

Example:

.. code-block::

  # Note how the lines below the event declaration are indented to the same level.
  :ready
    global door_open = true
    anim($player, "pick_up")

Here's an example of a block as part of an ``if``-statement:

.. code-block::

  # Present the key if the player already has it
  if "key" in inventory:
    say($player, "I got the key!")
    anim($player, "show_key")
       

Blocking
~~~~~~~~

Some commands will block execution of the event they're in until they finish;
others won't. See the command reference for details on which commands
block.

List of commands
~~~~~~~~~~~~~~~~

.. ESCCOMMANDS
.. /ESCCOMMANDS

Dialogs
-------

Dialogs are specified by writing ``?!`` with optional arguments,
followed by a list of dialog options starting with ``-``.

Dialog options can be optionally given a predicate at the end of the line that 
determines whether the dialog option should be presented, e.g.

.. code::

  ?!
    - "This option will only be shown if 'my_variable' is true." [my_variable]

Any predicate can be used, including negation, comparison, and other boolean 
operators.

Like ``if``-statements and event blocks, dialogs have their own scope and so 
all options and related script must be appropriately indented.

The following parameters are available:

-  ``avatar``: The path to a scene displaying an avatar to be used in the UI.
   Defaults to no avatar. To set only the parameters below, set this
   parameter's value to ``-``.
-  ``timeout``: Time allowed to select an option. Default value 0. After the
   specified time has elapsed, ``timeout_option`` will be selected
   automatically.
   If the value is 0, there is no timeout (i.e. no time limit to select an
   option).
-  ``timeout_option``: Index of option selected when timeout is reached.
   Default value of 0. Index begins at 1.

The keyword ``break`` allows you to end the current nested dialog and moves 
control up to the dialog that contained the nested  dialog. This is similar 
to "breaking" out of an inner, nested loop. Unlike breaking out of a loop, 
however, it is possible to specify an optional parameter to ``break`` in order 
to specify just how many inner dialogs you want to break out of, e.g. if you're
currently in a dialog that's nested 4 levels deep, using ``break 2`` will move 
you back up to the dialog 2 levels higher.

Use the keyword ``done`` in order to terminate the entire dialog, including any 
that are at higher levels, e.g. if you use ``done`` in a dialog that is nested 
4 levels deep, **ALL** 4 levels of dialog will be terminated and execution of 
any remaining script in the current event will resume.
 
Options support translation keys by prepending and separating them with
a ``:`` from the rest of the text.

Example:

.. code-block::

  # character's "talk" event
  :talk
    global player_has_map = false
    
    # After 5 seconds default to the second option
    ?! "res://avatar" 5 2
      - MAP:"I'd like to buy a map." [!player_has_map]
        say($player, "I'd like to buy a map!")
        say($map_vendor, "Do you know the secret code?")
        ?!
          - UNCLE_SVEN:"Uncle Sven sends regards."
            say($player, "Uncle Sven sends regards.")

            if player_has_money:
              say($map_vendor, "Here you go.")
              say($player, "Thanks!")
              inventory_add("map")
              player_has_map = true
            else:
              say($map_vendor, "You can't afford it.")
              say($player, "I'll be back.")

          - "Nevermind"
            say($player, "Nevermind.")
            done
            
      - "Nevermind"
        say($player, "Nevermind.")

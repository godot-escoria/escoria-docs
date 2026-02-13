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

``accept_input([type: String])`` `API-Doc </api/commands/AcceptInputCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets how much input the game is to accept. This allows for cut scenes in which dialogue can be skipped (if [type] is set to SKIP), and ones where it can't (if [type] is set to NONE).

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - type
     - ``String``
     - Type of inputs to accept (ALL) `ALL`: Accept all types of user input `SKIP`: Accept skipping dialogues but nothing else ``NONE``\ : Deny all inputs (including opening menus) Warning The type of user input accepted will persist even after the current event has ended. Remember to reset the input type at the end of cut-scenes!
     - no



``anim_block(object: String, name: String[, reverse: Boolean])`` `API-Doc </api/commands/AnimBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Executes the animation specified in "name" on "object" while blocking other events from starting. The next command in the event will be executed when the animation is finished playing.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object with the animation
     - yes
   * - name
     - ``String``
     - Name of the animation to play before continuing.
     - yes
   * - reverse
     - ``Boolean``
     - Plays the animation in reverse when true
     - no



``anim(object: String, name: String[, reverse: Boolean])`` `API-Doc </api/commands/AnimCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Executes the animation specified in "name" on "object" without blocking. The next command in the event will be executed immediately after the animation is started.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object with the animation
     - yes
   * - name
     - ``String``
     - Name of the animation to start on the object.
     - yes
   * - reverse
     - ``Boolean``
     - Plays the animation in reverse when true
     - no



``block_say()`` `API-Doc </api/commands/BlockSayCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


``say`` commands called subsequent to using the ``block_say`` command will reuse the dialog box type of the previous ``say`` command if both dialog box types between the two ``say`` commands match. Different dialog box types can be used across multiple ``say`` commands, with the latest one used being preserved for reuse by the next ``say`` command should the dialog box type specified by both ``say`` commands match. This reuse will continue until a call to ``end_block_say`` is made. Using ``block_say`` more than once prior to calling ``end_block_say`` is idempotent and has the following behaviour: - If no ``say`` command has yet been encountered since the first use of ``block_say``\ , the result of using this command will be as described above. - If a ``say`` command has been encountered since the previous use of ``block_say``\ , the dialog box used with that ``say`` command will continue to be reused for subsequent ``say`` commands should the dialog box type requested match. Note that the dialog box used with the next ``say`` command may be different than the one currently being reused. Example: ``block say`` ``say player "Picture's looking good."`` ``say player "And so am I."`` ``end_block_say`` This example will reuse the same dialog box type since they are the same between both ``say`` calls.

Parameters
~~~~~~~~~~

None.


``camera_push_block(target: String[, time: Number[, type: String]])`` `API-Doc </api/commands/CameraPushBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Pushes (moves) the camera so it points at a specific ``target``. If the camera was following a target (like the player) previously, it will no longer follow this target. Blocks until the command completes.

Make sure the target is reachable if camera limits have been configured.

**Parameters**


* *target*\ : Global ID of the ``ESCItem`` to push the camera to. ``ESCItem``\ s have a "camera_node" property that can be set to point to a node (usually an ``ESCLocation`` node). If the "camera_node" property is empty, ``camera_push_block`` will point the camera at the ``ESCItem``\ s location. If however, the ``ESCItem`` has its "camera_node" property set, the command will instead point the camera at the node referenced by the ``ESCItem``\ s "camera_node" property.
* *time*\ : Number of seconds the transition should take (default: ``1``\ )
* *type*\ : Transition type to use (default: ``QUAD``\ )

Supported transitions include the names of the values used in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix).

See https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

For more details see: https://docs.escoria-framework.org/camera


``camera_push(target: String[, time: Number[, type: String]])`` `API-Doc </api/commands/CameraPushCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Pushes (moves) the camera so it points at a specific ``target``. If the camera was following a target (like the player) previously, it will no longer follow this target.

Make sure the target is reachable if camera limits have been configured.

**Parameters**


* *target*\ : Global ID of the ``ESCItem`` to push the camera to. ``ESCItem``\ s have a "camera_node" property that can be set to point to a node (usually an ``ESCLocation`` node). If the "camera_node" property is empty, ``camera_push`` will point the camera at the ``ESCItem``\ s location. If however, the ``ESCItem`` has its "camera_node" property set, the command will instead point the camera at the node referenced by the ``ESCItem``\ s "camera_node" property.
* *time*\ : Number of seconds the transition should take (default: ``1``\ )
* *type*\ : Transition type to use (default: ``QUAD``\ )

Supported transitions include the names of the values used in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix):

See https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

For more details see: https://docs.escoria-framework.org/camera


``camera_set_limits(camlimits_id: Integer)`` `API-Doc </api/commands/CameraSetLimitsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Limits the current camera's movement to a limit defined in the ``ESCRoom``\ 's definition. A limit is defined as an upper-left (x, y) coordinate, a width and a height that the camera must stay within. Multiple limits can be defined for a room, allowing for new areas to be seen once they have been 'unlocked'.

**Parameters**


* *camlimits_id*\ : Index of the camera limit defined in the ``camera limits`` list of the current ``ESCRoom``

For more details see: https://docs.escoria-framework.org/camera


``camera_set_pos_block(time: Number, x: Integer, y: Integer)`` `API-Doc </api/commands/CameraSetPosBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the camera to the given absolute position over a time period. Blocks until the command completes.

Make sure the coordinates are reachable if camera limits have been configured.

**Parameters**


* *time*\ : Number of seconds the transition should take
* *x*\ : Target X coordinate
* *y*\ : Target Y coordinate

For more details see: https://docs.escoria-framework.org/camera


``camera_set_pos(time: Number, x: Integer, y: Integer)`` `API-Doc </api/commands/CameraSetPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the camera to the given absolute position over a time period.

**Parameters**


* *time*\ : Number of seconds the transition should take
* *x*\ : Target X coordinate
* *y*\ : Target Y coordinate

For more details see: https://docs.escoria-framework.org/camera


``camera_set_target_block(time: Number, object: String)`` `API-Doc </api/commands/CameraSetTargetBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Configures the camera to follow the specified target ``object`` (ESCItem) as it moves around the current room. The transition to focus on the ``object`` will happen over a time period. Blocks until the command completes.

The camera will move as close as it can if camera limits have been configured and the ``object`` is at coordinates that are not reachable.

**Parameters**


* *time*\ : Number of seconds the transition should take to move the camera to follow ``object``
* *object*\ : Global ID of the target object

For more details see: https://docs.escoria-framework.org/camera


``camera_set_target(time: Number, object: String)`` `API-Doc </api/commands/CameraSetTargetCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Configures the camera to follow the supplied Escoria object, easing into the new target over the requested duration.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - time
     - ``Number``
     - Duration in seconds for the camera to transition to the target.
     - yes
   * - object
     - ``String``
     - Global ID of the object the camera should follow.
     - yes


For more details see: https://docs.escoria-framework.org/camera


``camera_set_zoom_block(magnitude: Number[, time: Number])`` `API-Doc </api/commands/CameraSetZoomBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Zooms the camera in/out to the desired ``magnitude``. Values larger than '1' zoom the camera out while smaller values zoom in. These values are relative to the default zoom value of '1', not the current value. As such, while using a value of '0.5' would double the size of the graphics, running the same command again would result in no change. The zoom will happen over the given time period. Blocks until the command completes.

Zoom operations might not be as smooth as desired if the requested zoom level results in an edge of the camera meeting any defined camera limits.

**Parameters**


* *magnitude*\ : Magnitude of zoom
* *time*\ : Number of seconds the transition should take, with a value of ``0`` meaning the zoom should happen instantly (default: ``0``\ )

For more details see: https://docs.escoria-framework.org/camera


``camera_set_zoom(magnitude: Number[, time: Number])`` `API-Doc </api/commands/CameraSetZoomCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Zooms the camera in/out to the desired ``magnitude``. Values larger than '1' zoom the camera out while smaller values zoom in. These values are relative to the default zoom value of '1', not the current value. As such, while using a value of '0.5' would double the size of the graphics, running the same command again would result in no change. The zoom will happen over the given time period.

**Parameters**


* *magnitude*\ : Magnitude of zoom
* *time*\ : Number of seconds the transition should take, with a value of ``0`` meaning the zoom should happen instantly (default: ``0``\ )

For more details see: https://docs.escoria-framework.org/camera


``camera_set_zoom_height_block(pixels: Integer[, time: Number])`` `API-Doc </api/commands/CameraSetZoomHeightBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Zooms the camera in/out so it occupies the given height in pixels. Blocks until the command completes.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - pixels
     - ``Integer``
     - Target height in pixels (integer values only)
     - yes
   * - time
     - ``Number``
     - Number of seconds the transition should take, with a value of ``0`` meaning the zoom should happen instantly (default: ``0``\ ) For more details see: https://docs.escoria-framework.org/camera
     - no



``camera_set_zoom_height(pixels: Integer[, time: Number])`` `API-Doc </api/commands/CameraSetZoomHeightCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Zooms the camera in/out so it occupies the given height in pixels.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - pixels
     - ``Integer``
     - Target height in pixels
     - yes
   * - time
     - ``Number``
     - Number of seconds the transition should take, with a value of ``0`` meaning the zoom should happen instantly (default: ``0``\ ) For more details see: https://docs.escoria-framework.org/camera
     - no



``camera_shift_block(x: Number, y: Number[, time: Number[, type: String]])`` `API-Doc </api/commands/CameraShiftBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Shifts the camera by the given horizontal and vertical amounts relative to the current location. Blocks until the command completes.

Make sure the destination coordinates are reachable if camera limits have been configured.

**Parameters**


* *x*\ : Shift by x pixels along the x-axis
* *y*\ : Shift by y pixels along the y-axis
* *time*\ : Number of seconds the transition should take, with a value of ``0`` meaning the transition should happen instantly (default: ``1``\ )
* *type*\ : Transition type to use (default: ``QUAD``\ )

Supported transitions include the names of the values used in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix).

See https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

For more details see: https://docs.escoria-framework.org/camera


``camera_shift(x: Number, y: Number[, time: Number[, type: String]])`` `API-Doc </api/commands/CameraShiftCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Shifts the camera by the given horizontal and vertical amounts relative to the current location.

**Parameters**


* *x*\ : Shift by x pixels along the x-axis
* *y*\ : Shift by y pixels along the y-axis
* *time*\ : Number of seconds the transition should take, with a value of ``0`` meaning the zoom should happen instantly (default: ``1``\ )
* *type*\ : Transition type to use (default: ``QUAD``\ )

Supported transitions include the names of the values used in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix):

https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

For more details see: https://docs.escoria-framework.org/camera


``change_scene(path: String[, enable_automatic_transition: Boolean[, run_events: Boolean]])`` `API-Doc </api/commands/ChangeSceneCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Switches the game from the current scene to another scene. Use this to move the player to a new room when they walk through an unlocked door, for example.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - path
     - ``String``
     - Path of the new scene
     - yes
   * - enable_automatic_transition
     - ``Boolean``
     - Automatically transition to the new scene (default: ``true``\ )
     - no
   * - run_events
     - ``Boolean``
     - Run the standard ESC events of the new scene (default: ``true``\ )
     - no



``custom(object: String, node: String, func_name: String[, params...])`` `API-Doc </api/commands/CustomCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Executes the specified Godot function. This function must be in a script attached to a child node of a registered ``ESCItem``.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the target ``ESCItem``
     - yes
   * - node
     - ``String``
     - Name of the child node of the target ``ESCItem``
     - yes
   * - func_name
     - ``String``
     - Name of the function to be called
     - yes
   * - params...
     - ``Variant``
     - Optional arguments passed to the target function (arrays and objects are not supported). Additional positional parameters can be listed after the required ones, e.g. ``custom("the_object", "the_node", "the_function", arg1, arg2)``.
     - no



``dec_global(name: String, value: Float)`` `API-Doc </api/commands/DecGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Subtract the given value from the specified global.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - name
     - ``String``
     - Name of the global variable to decrement.
     - yes
   * - value
     - ``Float``
     - Value to be subtracted (default: 1)
     - yes



``enable_terrain(node_name: String)`` `API-Doc </api/commands/EnableTerrainCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables the ``ESCTerrain``\ 's ``NavigationPolygonInstance`` specified by the given node name. It will also disable the previously-activated ``NavigationPolygonInstance``. Use this to change where the player can walk, allowing them to walk into the next room once a door has been opened, for example.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - node_name
     - ``String``
     - Name of the ``NavigationPolygonInstance`` node to activate
     - yes



``end_block_say()`` `API-Doc </api/commands/EndBlockSayCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


``say`` commands used subsequent to using the ``end_block_say`` command will no longer reuse the dialog box type used by the previous ``say`` command(s) encountered. Using ``end_block_say`` more than once is safe and idempotent. Example: ``block say`` ``say player "Picture's looking good."`` ``say player "And so am I."`` ``end_block_say`` This example will reuse the same dialog box type since they are the same between both ``say`` calls.

Parameters
~~~~~~~~~~

None.


``hide_menu(menu_type: String)`` `API-Doc </api/commands/HideMenuCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Hides either the main menu or the pause menu. Transitions from the menu using the default transition type (set in the Escoria project settings).

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - menu_type
     - ``String``
     - Which menu to hide. Can be either ``main`` or ``pause`` (default: ``main``\ )
     - yes



``inc_global(name: String[, value: Float])`` `API-Doc </api/commands/IncGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Adds the given value to the specified global.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - name
     - ``String``
     - Name of the global variable to increment.
     - yes
   * - value
     - ``Float``
     - Value to be added (default: 1)
     - no



``inventory_add(item: String)`` `API-Doc </api/commands/InventoryAddCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Adds an item to the inventory. If the player is picking up an object, you may want to use this command in conjunction with the ``set_active`` command so that the object 'disappears' from the scene as it's added to the inventory.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - item
     - ``String``
     - Global ID of the ``ESCItem`` to add to the inventory
     - yes



``inventory_remove(item: String)`` `API-Doc </api/commands/InventoryRemoveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Removes an item from the inventory. You may wish to use this command in conjuction with the ``set_active`` command to show an item in the scene, simulating placing the item somewhere, for example.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - item
     - ``String``
     - Global ID of the ``ESCItem`` to remove from the inventory
     - yes



``play_snd(file: String[, player: String[, start_position_seconds: Number]])`` `API-Doc </api/commands/PlaySndCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Plays the specified sound without blocking the currently running event.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - file
     - ``String``
     - Sound file to play
     - yes
   * - player
     - ``String``
     - Sound player to use. Can either be ``_sound``\ , which is used to play non- looping sound effects; ``_music``\ , which plays looping music; ``_ambient``\ , which plays looping ambient sounds; or ``_speech``\ , which plays non-looping voice files (default: ``_sound``\ )
     - no
   * - start_position_seconds
     - ``Number``
     - The position in seconds from which to start playing the sound file (default: ``0.0``\ )
     - no



``print(string: String)`` `API-Doc </api/commands/PrintCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


INTERNAL USE ONLY Prints a message to the Godot debug window. Use this for debugging game state.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - string
     - ``String``
     - The string to log
     - yes



``queue_event(object: String, event: String[, channel: String[, block: Boolean]])`` `API-Doc </api/commands/QueueEventCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Queue an event to run. If you queue multiple events on a channel and none of them are blocking events, all events will effectively run at the same time. As the events are placed on the channel's queue, if one event contains a blocking command, the next event on that channel's queue won't be processed until the blocking command finishes.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Object that holds the ESC script with the event
     - yes
   * - event
     - ``String``
     - Name of the event to queue
     - yes
   * - channel
     - ``String``
     - Channel to run the event on (default: ``_front``\ ). Using a previously unused channel name will create a new channel.
     - no
   * - block
     - ``Boolean``
     - Whether to wait for the queue to finish. This is only possible, if the queued event is not to be run on the same event as this command (default: ``false``\ )
     - no



``queue_resource(path: String[, front_of_queue: Boolean])`` `API-Doc </api/commands/QueueResourceCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Queues the loading of the given resource into the resource cache.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - path
     - ``String``
     - Path of the resource to cache
     - yes
   * - front_of_queue
     - ``Boolean``
     - Whether to put the resource at the front of the queue in order to load it as soon as possible (default: ``false``\ )
     - no



``rand_global(name: String, max_value: Integer)`` `API-Doc </api/commands/RandGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the given global to a random integer between 0 and ``max_value`` (inclusive). e.g. Setting ``max_value`` to 2 could result in '0', '1' or '2' being returned.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - name
     - ``String``
     - Name of the global variable that will receive the random value.
     - yes
   * - max_value
     - ``Integer``
     - Maximum possible integer value (inclusive) (default: 1)
     - yes



``repeat()`` `API-Doc </api/commands/RepeatCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Makes the current script loop back to the start. Currently the only way to exit the loop is via the ``stop`` command which will stop the script completely.

Parameters
~~~~~~~~~~

None.


``save_game(slot_id: Integer, savegame_description: String)`` `API-Doc </api/commands/SaveGameCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Saves the game in the [slot_id] slot, and sets the [savegame_description] in the savegame name/title. Example: ``save_game 1 "description of save game"``

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - slot_id
     - ``Integer``
     - Numeric slot index to store the save data in.
     - yes
   * - savegame_description
     - ``String``
     - Text shown to players when listing this save slot.
     - yes



``say(player: String, text: String[, key: String[, type: String]])`` `API-Doc </api/commands/SayCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Displays the specified string as dialog spoken by the player. This command blocks further event execution until the dialog has finished being 'said' (either as displayed text or as audible speech from a file). Global variables can be substituted into the text by wrapping the global name in braces, e.g. say player "I have {coin_count} coins remaining".

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - player
     - ``String``
     - Global ID of the ``ESCPlayer`` or ``ESCItem`` object that is active. You can specify ``current_player`` in order to refer to the currently active player, e.g. in cases where multiple players are playable such as in games like Maniac Mansion or Day of the Tentacle.
     - yes
   * - text
     - ``String``
     - Text to display.
     - yes
   * - key
     - ``String``
     - Translation key (default: nil)
     - no
   * - type
     - ``String``
     - Dialog type to use. One of ``floating`` or ``avatar``. (default: the value set in the setting "Escoria/UI/Default Dialog Type") The text supports translation keys by prepending the key followed by a colon (`:`) to the text. For more details see: https://docs.escoria-framework.org/en/devel/getting_started/dialogs.html#translations Playing an audio file while the text is being displayed is also supported by this mechanism. For more details see: https://docs.escoria-framework.org/en/devel/getting_started/dialogs.html#recorded_speech Example: `say(player, "Picture's looking good.", "ROOM1_PICTURE")`
     - no



``sched_event(time: Number, object: String, event: String)`` `API-Doc </api/commands/SchedEventCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Schedules an event to run at a later time. If another event is already running when the scheduled event is supposed to start, execution of the scheduled event begins when the already-running event ends.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - time
     - ``Number``
     - Time in seconds until the scheduled event starts
     - yes
   * - object
     - ``String``
     - Global ID of the ESCItem that holds the ESC script
     - yes
   * - event
     - ``String``
     - Name of the event to schedule
     - yes



``set_active(object: String, active: Boolean)`` `API-Doc </api/commands/SetActiveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the "active" state of the object. Inactive objects are invisible in the room.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object whose active state should change.
     - yes
   * - active
     - ``Boolean``
     - Whether the object should be marked as active (\ ``true``\ ) or inactive (\ ``false``\ ). object\ * Global ID of the object active* Whether ``object`` should be active. ``active`` can be ``true`` or ``false``.
     - yes



`*** FOR INTERNAL USE ONLY *** `set_active_if_exists(object: String, active: Boolean)`` `API-Doc </api/commands/SetActiveIfExistsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the "active" state of the object in the current room if it currently exists in the object manager. If it doesn't, then, unlike set_active, we don't fail and we just carry on. Inactive objects are invisible in the room.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object whose active state should change if it is registered.
     - yes
   * - active
     - ``Boolean``
     - Whether the object should be marked as active (\ ``true``\ ) or inactive (\ ``false``\ ).
     - yes



``set_angle(object: String, target_degrees: Number[, wait: Number])`` `API-Doc </api/commands/SetAngleCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Turns a movable ``ESCItem`` or ``ESCPlayer`` to face a given target direction. Angles 0 and 360 are the same and correspond to UP/NORTH, 90 is RIGHT/EAST, 180 is DOWN/SOUTH, 270 is LEFT/WEST etc. The rotation direction will be determined by the shortest path - e.g. rotating from facing up (0 degrees) to left (270) will be a 90 degree turn anti-clockwise rather than a 270 degree clockwise turn. The final animation used is determined by the directions which have been configured for the object. If the item has a direction configured which has been drawn to show it facing to the right, and this direction has been defined to cover the angle from 45 to 135 degrees, setting the target angle to 120 degrees will result in the right-facing animation being used. The number of intermediate animations shown while turning the item will depend on the directions specified in the item's definition. A 16 direction character will turn through 8 different directions to turn 180 degrees, a 4 direction character only 2. The wait time will determine how long the idle animation for each direction is played before using the next direction's animation. As such, if wait was set to 1 second, a 16 direction character would take 8 seconds to turn 180 degrees, a 4 direction character would take 2 seconds.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object to turn
     - yes
   * - target_degrees
     - ``Number``
     - Number of degrees by which ``object`` is to be turned
     - yes
   * - wait
     - ``Number``
     - Number of seconds to wait for while playing each animation occurring between the current angle of ``object`` and the target angle. A value of ``0`` will complete the turn immediately (default: ``0``\ )
     - no



``set_animations(object: String, animations: String)`` `API-Doc </api/commands/SetAnimationsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the animation resource for the given ``ESCPlayer`` or movable ``ESCItem``.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object whose animation resource is to be updated
     - yes
   * - animations
     - ``String``
     - The path of the animation resource to use
     - yes



``set_direction(object: String, direction_id: Integer[, wait: Number])`` `API-Doc </api/commands/SetDirectionCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Turns a movable ``ESCItem`` or ``ESCPlayer`` to face a given target direction id (between 0 and 3 for a 4-directional character, or between 0 and 7 for an 8-directional character). 4-directional : 0 : UP / NORTH 1 : RIGHT / EAST 2 : DOWN / SOUTH 3 : LEFT / WEST 8-directional : 0 : UP / NORTH 1 : UP-RIGHT / NORTH-EAST 2 : RIGHT / EAST 3 : DOWN-RIGHT / SOUTH-EAST 4 : DOWN / SOUTH 5 : DOWN-LEFT / SOUTH-WEST 6 : LEFT / WEST 7 : TOP-LEFT / NORTH-WEST

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object to turn
     - yes
   * - direction_id
     - ``Integer``
     - Target direction index from the animation resource.
     - yes
   * - wait
     - ``Number``
     - Seconds to spend on each intermediate step when rotating toward the target direction (0 means immediate).
     - no



``set_global(name: String, value: String|Integer|Boolean[, force: Boolean=false])`` `API-Doc </api/commands/SetGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the value of a global.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - name
     - ``String``
     - Name of the global variable to set.
     - yes
   * - value
     - ``String`` or ``Integer`` or ``Boolean``
     - Value to set the global to (can be of type string, boolean, integer.)
     - yes
   * - force
     - ``Boolean``
     - if false, setting a global whose name is reserved will trigger an error. Defaults to false. Reserved globals are: ESC_LAST_SCENE, FORCE_LAST_SCENE_NULL, ANIMATION_RESOURCES, ESC_CURRENT_SCENE
     - no



``set_globals(pattern: String, value: String|Integer|Boolean)`` `API-Doc </api/commands/SetGlobalsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the value of multiple globals using a wildcard pattern, where ``*`` matches zero or more arbitrary characters and ``?`` matches any single character except a period (".").

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - pattern
     - ``String``
     - Pattern to use to match the names of the globals to change
     - yes
   * - value
     - ``String`` or ``Integer`` or ``Boolean``
     - Value to set (can be of type string, boolean, integer or float)
     - yes



``set_gui_visible(visible: Boolean)`` `API-Doc </api/commands/SetGuiVisibleCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Show or hide the GUI.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - visible
     - ``Boolean``
     - Whether the GUI should be visible (\ ``true`` or ``false``\ )
     - yes



``set_interactive(object: String, interactive: Boolean)`` `API-Doc </api/commands/SetInteractiveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets whether an object is interactive.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object to change
     - yes
   * - interactive
     - ``Boolean``
     - Whether the object should be interactive
     - yes



`*** FOR INTERNAL USE ONLY *** `set_item_custom_data(item: String, custom_data: Dictionary)`` `API-Doc </api/commands/SetItemCustomDataCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the "custom_data" of the item if it currently exists in the object manager.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - item
     - ``String``
     - Global ID of the item whose ``custom_data`` should be updated.
     - yes
   * - custom_data
     - ``Dictionary``
     - Dictionary assigned to the item's ``custom_data`` property (an empty dictionary is used when ``null``\ ).
     - yes



``set_speed(object: String, speed: Integer)`` `API-Doc </api/commands/SetSpeedCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the speed of a ``ESCPlayer`` or movable ``ESCItem``.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the ``ESCPlayer`` or movable ``ESCItem``
     - yes
   * - speed
     - ``Integer``
     - Speed value for ``object`` in pixels per second.
     - yes



``set_state(object: String, state: String[, immediate: Boolean])`` `API-Doc </api/commands/SetStateCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the state of ``object`` to the one specified. This command is primarily used to play animations. If the specified object's associated animation player has an animation with the same name, that animation is also played. When the "state" of the object is set - for example, a door may be set to a "closed" state - this plays the matching "close" animation if one exists (to show the door closing in the game). When you re-enter the room (via a different entry), or restore a saved game, the state of the door object will be restored - showing the door as a closed door.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object whose state is to be changed
     - yes
   * - state
     - ``String``
     - Name of the state to be set
     - yes
   * - immediate
     - ``Boolean``
     - If an animation for the state exists, specifies whether it is to skip to the last frame. Can be ``true`` or ``false``.
     - no



``show_menu(menu_type: String)`` `API-Doc </api/commands/ShowMenuCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Shows either the main menu or the pause menu. Transitions to the menu using the default transition type (set in the Escoria project settings).

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - menu_type
     - ``String``
     - Which menu to show. Can be either ``main`` or ``pause`` (default: ``main``\ )
     - yes



``slide_block(object: String, target: String[, speed: Integer])`` `API-Doc </api/commands/SlideBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves ``object`` towards the position of ``target``. This command is blocking.


* *object*\ : Global ID of the object to move
* *target*\ : Global ID of the target object
* *speed*\ : The speed at which to slide in pixels per second (will default to the speed configured on the ``object``\ )

**Warning** This command does not respect the room's navigation polygons, so ``object`` can be moved even when outside walkable areas.


``slide(object: String, target: String[, speed: Integer])`` `API-Doc </api/commands/SlideCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves ``object`` towards the position of ``target``. This command is non-blocking.

**Warning** This command does not respect the room's navigation polygons, so ``object`` can be moved even when outside walkable areas!

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object that should slide.
     - yes
   * - target
     - ``String``
     - Global ID of the object whose position is used as the destination.
     - yes
   * - speed
     - ``Integer``
     - Optional slide speed in pixels per second (defaults to the object's configured speed when negative).
     - no



``spawn(identifier: String, path: String[, is_active: Boolean[, position_target: String]])`` `API-Doc </api/commands/SpawnCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Programmatically adds a new item to the scene.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - identifier
     - ``String``
     - Global ID to use for the new object
     - yes
   * - path
     - ``String``
     - Path to the scene file of the object
     - yes
   * - is_active
     - ``Boolean``
     - Whether the new object should be set to active (default: ``true``\ )
     - no
   * - position_target
     - ``String``
     - Global ID of another object that will be used to position the new object (when omitted, the new object's position is not specified)
     - no



``stop()`` `API-Doc </api/commands/StopCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Stops the current event's execution. Note that this will stop the current script entirely - if you're within a conditional block, the code after the conditional block will not be executed.

Parameters
~~~~~~~~~~

None.


``stop_snd([audio_bus: String])`` `API-Doc </api/commands/StopSndCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Stops the given audio bus's stream. By default there are 4 audio buses set up by Escoria : ``_sound``\ , which is used to play non-looping sound effects; ``_music``\ , which plays looping music; ``_ambient``\ , which plays looping background sounds; and ``_speech``\ , which plays non-looping voice files (default: ``_music``\ ). Each simultaneous sound (e.g. multiple game sound effects) will require its own bus. To create additional buses, see the Godot sound documentation : `Audio buses <https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html#doc-audio-buses>`_

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - audio_bus
     - ``String``
     - Bus to stop ("_sound", "_music", "_speech", "_ambient", or a custom audio bus you have created.)
     - no



``teleport(object: String, target: String)`` `API-Doc </api/commands/TeleportCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Instantly moves an object to a new position.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object to move
     - yes
   * - target
     - ``String``
     - Global ID of the object to use as the destination coordinates for ``object``
     - yes



``teleport_pos(object: String, x: Integer, y: Integer)`` `API-Doc </api/commands/TeleportPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Instantly moves an object to the specified (absolute) coordinates.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object to move
     - yes
   * - x
     - ``Integer``
     - X-coordinate of destination position
     - yes
   * - y
     - ``Integer``
     - Y-coordinate of destination position
     - yes



``transition(transition_name: String, mode: String[, delay: Number])`` `API-Doc </api/commands/TransitionCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Runs a transition effect - generally used when entering or leaving a room. Transitions are implemented as Godot shaders. Custom transitions can be made by creating a shader in the ``game/scenes/transitions/shaders/`` folder within the escoria-core plugin folder.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - transition_name
     - ``String``
     - Name of the transition shader from one of the transition directories
     - yes
   * - mode
     - ``String``
     - Set to ``in`` to transition into or ``out`` to transition out of the room
     - yes
   * - delay
     - ``Number``
     - Delay in seconds before starting the transition (default: ``1.0``\ )
     - no



``turn_to(object: String, object_to_face: String[, wait: Number])`` `API-Doc </api/commands/TurnToCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Turns ``object`` to face another object. Unlike movement commands, ``turn_to`` will not automatically reference an ``ESCLocation`` that is a child of an ``ESCItem.`` To turn towards an ``ESCLocation`` that is a child of an ``ESCItem``\ , give the ``ESCLocation`` a ``Global ID`` and use this value as the ``object_to_face`` parameter. While turning, the number of directions the item faces will depend on the number of ``directions`` defined for the object. A 16 direction character for example will display 8 directions of animation while turning to face an object that is 180 degrees away, a 4 direction character would only face 2 directions to make the same turn. As the idle animation will be played for ``wait`` seconds for each direction the object faces, a 16 direction character would take 8 seconds to rotate 180 degrees with a 1 second ``wait`` time, whereas a 4 direction character would only take 2 seconds to make the same rotation.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object to be turned
     - yes
   * - object_to_face
     - ``String``
     - Global ID of the object to turn towards
     - yes
   * - wait
     - ``Number``
     - Length of time to wait in seconds for each intermediate angle. If set to 0, the turnaround is immediate (default: ``0``\ )
     - no



``wait(seconds: Number)`` `API-Doc </api/commands/WaitCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Blocks execution of the current event.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - seconds
     - ``Number``
     - Number of seconds to block
     - yes



``walk_block(object: String, target: String[, walk_fast: Boolean])`` `API-Doc </api/commands/WalkBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to the ``target`` ESCItem's location while playing ``object``\ 's walking animation. This command is blocking. This command will use the normal walk speed by default. If the ``target`` ESCItem has a child ESCLocation node, the walk destination will be the position of the ESCLocation.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object to move
     - yes
   * - target
     - ``String``
     - Global ID of the target object
     - yes
   * - walk_fast
     - ``Boolean``
     - Whether to walk fast (\ ``true``\ ) or normal speed (\ ``false``\ ). (default: false)
     - no



``walk(object: String, target: String[, walk_fast: Boolean])`` `API-Doc </api/commands/WalkCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to the ``target`` ESCItem's location while playing ``object``\ 's walking animation. This command is non-blocking. This command will use the normal walk speed by default. If the ``target`` ``ESCItem`` has a child ``ESCLocation`` node, the walk destination will be the position of the ``ESCLocation``.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object to move
     - yes
   * - target
     - ``String``
     - Global ID of the target object
     - yes
   * - walk_fast
     - ``Boolean``
     - Whether to walk fast (\ ``true``\ ) or normal speed (\ ``false``\ ) (default: false)
     - no



``walk_to_pos_block(object: String, x: Integer, y: Integer[, walk_fast: Boolean])`` `API-Doc </api/commands/WalkToPosBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to the absolute coordinates provided while playing the ``object``\ 's walking animation. This command is blocking. This command will use the normal walk speed by default.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object to move
     - yes
   * - x
     - ``Integer``
     - X-coordinate of target position
     - yes
   * - y
     - ``Integer``
     - Y-coordinate of target position
     - yes
   * - walk_fast
     - ``Boolean``
     - Whether to walk fast (\ ``true``\ ) or normal speed (\ ``false``\ ). (default: false)
     - no



``walk_to_pos(object: String, x: Integer, y: Integer[, walk_fast: Boolean])`` `API-Doc </api/commands/WalkToPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to the absolute coordinates provided while playing the ``object``\ 's walking animation. This command is non-blocking. This command will use the normal walk speed by default.

Parameters
~~~~~~~~~~

.. list-table::
   :header-rows: 1

   * - Name
     - Type
     - Description
     - Required?
   * - object
     - ``String``
     - Global ID of the object to move
     - yes
   * - x
     - ``Integer``
     - X-coordinate of target position
     - yes
   * - y
     - ``Integer``
     - Y-coordinate of target position
     - yes
   * - walk_fast
     - ``Boolean``
     - Whether to walk fast (\ ``true``\ ) or normal speed (\ ``false``\ ). (default: false)
     - no





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

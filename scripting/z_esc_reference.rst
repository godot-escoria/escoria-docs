.. _esc_language_reference:

ESC language reference
======================

Variables
---------

See :ref:`global_flags`.

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

Animations in the object's scene can have the same name as a state.
In this case, the animation is run when the state is set.

For :doc:`bg_sound <../api/EscSoundPlayer>` and
:doc:`bg_music <../api/EscMusicPlayer>` objects, the state also represents
the music or sound that is currently running.

Active objects
~~~~~~~~~~~~~~

Objects can be either active or inactive. Inactive objects are hidden and not
clickable.

Item activity is also handled as a special case of global flags. If the
check starts with ``a/``, like ``a/elaine``, you're checking if "elaine" is
active.

.. code-block::

   :ready
   > [!a/elaine]
      say player player_no_elaine_yet:"It would appear Elaine hasn't arrived yet."

Interactive objects
~~~~~~~~~~~~~~~~~~~

If you have an object that only blocks the terrain and is something you can
move behind, you probably don't want to bother with interaction areas
and tooltip texts. In this case, just set ``is_interactive`` to
``false`` and the item will not be checked for interactions. Its mouse
events won't be connected, either.

.. _global_flags:

Global flags
------------

Global flags (also known as game variables) define the state of the game and
can be true/false, a number, or a string. All commands and groups can be
conditionally set based on the value of a global flag.

Global flags are, as the name implies, global, and continue to survive after
leaving the room where they are created/set. This means that a value set
early in your game is still able to be queried many rooms later.

Global flags can be created anywhere in an Escoria script as needed using the
`set_global` command. They don't need to be declared in advance.

.. code-block::

   set_global <global name> <global value>

   e.g. set_global number_of_keys_found 3

By default a flag will return false if you haven't declared or defined it. This
feature allows for code like the below--that configures a room--to be
executed the first time the room is visited, but won't be run again should
the player return to the room.

.. code-block::

   :ready

   > [!room1_visited]
      # Set room1_visited variable so this code runs only once
      set_global room1_visited true

      # Play the window's sunrise animation
      anim window play_sunrise_effect

Inventory
~~~~~~~~~

The inventory is handled as a special case of global flags. All flags
with a name starting with ``i/`` are considered to be an inventory object with
the inventory object's global ID following. Example:

.. code-block::

   # Waits for 5 seconds if the player has the key in its inventory
   wait 5 [i/key]

Events
------

All ESC scripts are divided into a series of events which in turn run
commands or dialogs.

To use an event in your script, specify the name of the event preceded by a
colon. All commands following the event identifier are considered part of that
event until another event is defined in the same script file.

.. code-block::

   :push
   say player "I pushed the door."
   say player "It didn't do anything."

   # A new ("pull") event starts here
   :pull
   say player "The door is now open"

Built-in events
~~~~~~~~~~~~~~~

Some events are hard-coded into Escoria. The ones that are
"internal engine use only" are
* print
* load
* room_selector
* transition_in
* transition_out


Events that are considered "for game developer use" are
* init : Run first as part of your primary Escoria game script. This is where
you would place the commands for a company logo cutscene.
* exit_scene : Will be called when "Is Exit" is enabled on an `ESCItem` and the
player "uses" that item. You might play a closing door sound here for
example.
* newgame : This is what is called when "Start Game" is chosen from your menu.
The main use would be to have a `change_scene` command here to load your
first game room.
* setup : This runs first as part of loading a room. Anything coded here will
happen before the room is visible (i.e. before the "transition in").
.. _ready-label:
* ready : These are commands that will run when a room loads, after it becomes
visible (i.e. once ":setup" completes and after the "transition in").

Plugin Events
~~~~~~~~~~~~~

Any plugins you use may define their own events that you can script
actions for. The sample user interfaces, for example, include events for
`look` and `use`. If you are using the 9-verb interface and click the `look`
button followed by an object, then any code inside the `:look` event in that
object's script will be run.

User-created events
~~~~~~~~~~~~~~~~~~~

You can create an event with any name you like (though avoiding event names
Escoria already uses, e.g. `init`, is suggested to avoid bugs and/or
confusion.)

Most of the time you'll define events as part of creating your UI (e.g. you
might create a nose icon and attach it to a "sniff" event). See
:doc:`https://docs.escoria-framework.org/en/devel/advanced/create_ui.html#verbs`
for further details.

This will teleport the player to the appropriate point in the scene
depending on the last visited scene. The last visited scene is stored in the
special global state ``ESC_LAST_SCENE``.

Events understand a series of flags. The flags that are currently
implemented include the following:

-  ``TK`` stands for "telekinetic": The player won't walk over
   to an item before saying a line of dialog
-  ``NO_TT`` stands for "No tooltip": The tooltip is hidden for the
   duration of the event
-  ``NO_UI`` stands for "No User Interface": The UI is hidden for the duration
   of the event. Useful for when you want something to look like a cutscene
   but don't want to disable input for skipping dialog.
-  ``NO_SAVE`` disables saving: Use this in cutscenes and anywhere a
   badly-timed autosave would leave your game in a messed-up state.

Commands
--------

Commands consist of a single word followed by some parameters. Parameters can
be a single word or a string in quotes.

.. code-block::

   # one parameter "player", another parameter "hello world"
   say player "hello world"

Conditions
~~~~~~~~~~

In order to run a command depending on the value of a flag, use ``[]`` with a
list of comma-separated conditions. All conditions in this list must be true.
Placing the character ``!`` before a flag can be used to negate that flag.

Example:

.. code-block::

   # runs the command only if the door_open flag is true
   say player "The door is open" [door_open]

.. code-block::

   # runs the group only if door_open is false and i/key is true
   > [!door_open,i/key]
       say player "The door is close, maybe I can try this key in my inventory"

Additionally, there is a set of comparison operators for use with global
integers: ``eq``, ``gt`` and ``lt``, all of which can be negated.
Example:

.. code-block::

   # runs the command only if the value of pieces_of_eight is greater than 5
   set_state inv_pieces_of_eight money_bag [gt pieces_of_eight 5]

Groups
~~~~~~

Commands can be grouped using the character `>` to start a group and
incrementing the indentation of the commands that belong to the group.
Example:

.. code-block::

   >
       set_global door_open true
       anim player pick_up
   # end of group

Groups can also use conditions:

.. code-block::

   # Present the key if the player already has it
   > [i/key]
       say player "I got the key!"
       anim player show_key

Blocking
~~~~~~~~

Some commands will block execution of the event until they finish;
others won't. See the command reference for details on which commands
block.

List of commands
~~~~~~~~~~~~~~~~

.. ESCCOMMANDS

``accept_input [type]`` `API-Doc </api/AcceptInputCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets how much input the game is to accept. This allows for cut scenes
in which dialogue can be skipped (if [type] is set to SKIP), and ones where
it can't (if [type] is set to NONE).

**Parameters**


* *type*\ : Type of inputs to accept (ALL)
  ``ALL``\ : Accept all types of user input
  ``SKIP``\ : Accept skipping dialogues but nothing else
  ``NONE``\ : Deny all inputs (including opening menus)

**Warning**\ : ``SKIP`` and ``NONE`` also disable autosaves.

**Warning**\ : The type of user input accepted will persist even after the
current event has ended. Remember to reset the input type at the end of
cut-scenes!


``anim_block object name [reverse]`` `API-Doc </api/AnimBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Executes the animation specified in "name" on "object" while blocking other
events from starting.
The next command in the event will be executed when the animation is
finished playing.

**Parameters**


* *object*\ : Global ID of the object with the animation
* *name*\ : Name of the animation to play
* *reverse*\ : Plays the animation in reverse when true


``anim object name [reverse]`` `API-Doc </api/AnimCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Executes the animation specified in "name" on "object" without blocking.
The next command in the event will be executed immediately after the
animation is started.

**Parameters**


* *object*\ : Global ID of the object with the animation
* *name*\ : Name of the animation to play
* *reverse*\ : Plays the animation in reverse when true


``camera_push target [time] [type]`` `API-Doc </api/CameraPushCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Pushes (moves) the camera so it points at a specific ``target``. If the camera
was following a target (like the player) previously, it will no longer follow
this target.

Make sure the target is reachable if camera limits have been configured.

**Parameters**


* *target*\ : Global ID of the ``ESCItem`` to push the camera to. ``ESCItem``\ s have
  a "camera_node" property that can be set to point to a node (usually an
  ``ESCLocation`` node). If the "camera_node" property is empty, ``camera_push``
  will point the camera at the ``ESCItem``\ s location. If however, the ``ESCItem``
  has its "camera_node" property set, the command will instead point the
  camera at the node referenced by the ``ESCItem``\ s "camera_node" property.
* *time*\ : Number of seconds the transition should take (default: ``1``\ )
* *type*\ : Transition type to use (default: ``QUAD``\ )

Supported transitions include the names of the values used
in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix):

See https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

For more details see: https://docs.escoria-framework.org/camera


``camera_set_limits camlimits_id`` `API-Doc </api/CameraSetLimitsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Limits the current camera's movement to a limit defined in the ``ESCRoom``\ 's
definition. A limit is defined as an upper-left (x, y) coordinate, a width
and a height that the camera must stay within. Multiple limits can be
defined for a room, allowing for new areas to be seen once they have
been 'unlocked'.

**Parameters**


* *camlimits_id*\ : Index of the camera limit defined in the ``camera limits``
  list of the current ``ESCRoom``

For more details see: https://docs.escoria-framework.org/camera


``camera_set_pos time x y`` `API-Doc </api/CameraSetPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the camera to the given absolute position over a time period.

**Parameters**


* *time*\ : Number of seconds the transition should take
* *x*\ : Target X coordinate
* "y*: Target Y coordinate

For more details see: https://docs.escoria-framework.org/camera


``camera_set_target time object`` `API-Doc </api/CameraSetTargetCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Configures the camera to follow the specified target ``object`` as it moves
around the current room. The transition to focus on the ``object`` will happen
over a time period.

**Parameters**


* *time*\ : Number of seconds the transition should take to move the camera
  to follow ``object``
* *object*\ : Global ID of the target object

For more details see: https://docs.escoria-framework.org/camera


``camera_set_zoom magnitude [time]`` `API-Doc </api/CameraSetZoomCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Zooms the camera in/out to the desired ``magnitude``. Values larger than '1' zoom
the camera out while smaller values zoom in. These values are relative to the
default zoom value of '1', not the current value. As such, while using a value
of '0.5' would double the size of the graphics, running the same command again
would result in no change. The zoom will happen over the given time period.

**Parameters**


* *magnitude*\ : Magnitude of zoom
* *time*\ : Number of seconds the transition should take, with a value of ``0``
  meaning the zoom should happen instantly (default: ``0``\ )

For more details see: https://docs.escoria-framework.org/camera


``camera_set_zoom_height pixels [time]`` `API-Doc </api/CameraSetZoomHeightCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Zooms the camera in/out so it occupies the given height in pixels.

**Parameters**


* *pixels*\ : Target height in pixels
* *time*\ : Number of seconds the transition should take, with a value of ``0``
  meaning the zoom should happen instantly (default: ``0``\ )

For more details see: https://docs.escoria-framework.org/camera


``camera_shift x y [time] [type]`` `API-Doc </api/CameraShiftCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Shifts the camera by the given horizontal and vertical amounts relative to the
current location.

**Parameters**


* *x*\ : Shift by x pixels along the x-axis
* *y*\ : Shift by y pixels along the y-axis
* *time*\ : Number of seconds the transition should take, with a value of ``0``
  meaning the zoom should happen instantly (default: ``1``\ )
* *type*\ : Transition type to use (default: ``QUAD``\ )

Supported transitions include the names of the values used
in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix):

https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

For more details see: https://docs.escoria-framework.org/camera


``change_scene path [enable_automatic_transition] [run_events]`` `API-Doc </api/ChangeSceneCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Switches the game from the current scene to another scene. Use this to move
the player to a new room when they walk through an unlocked door, for
example.

**Parameters**


* *path*\ : Path of the new scene
* *enable_automatic_transition*\ : Automatically transition to the new scene
  (default: ``true``\ )
* *run_events*\ : Run the standard ESC events of the new scene (default: ``true``\ )


``custom object node func_name [params]`` `API-Doc </api/CustomCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Executes the specified Godot function. This function must be in a script
attached to a child node of a registered ``ESCitem``.

**Parameters**


* *object*\ : Global ID of the target ``ESCItem``
* *node*\ : Name of the child node of the target ``ESCItem``
* *func_name*\ : Name of the function to be called
* params: Any arguments to be passed to the function (array and object parameters are not supported). Multiple
  parameters can be passed by using comma-separated values inside a string


``dec_global name value`` `API-Doc </api/DecGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Subtract the given value from the specified global.

**Parameters**


* *name*\ : Name of the global to be changed
* *value*\ : Value to be subtracted (default: 1)


``enable_terrain node_name`` `API-Doc </api/EnableTerrainCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables the ``ESCTerrain``\ 's ``NavigationPolygonInstance`` specified by the given
node name. It will also disable the previously-activated
``NavigationPolygonInstance``.
Use this to change where the player can walk, allowing them to walk into the
next room once a door has been opened, for example.

**Parameters**


* *node_name*\ : Name of the ``NavigationPolygonInstance`` node to activate


``hide_menu menu_type [enable_automatic_transition]`` `API-Doc </api/HideMenuCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Hides either the main menu or the pause menu. The enable_automatic_transition
parameter can be used to specify if Escoria manages the graphical transition
for you or not.
Setting ``enable_automatic_transition`` to false allows you to manage the
transition effect for your room as it transitions in and out. Place a
``transition`` command in the room's ``setup`` event to manage the look of the
transition in, and in the room's ``exit_scene`` event to manage the look of the
transition out.

**Parameters**


* *menu_type*\ : Which menu to hide. Can be either ``main`` or ``pause`` (default: ``main``\ )
* *enable_automatic_transition*\ : Whether to automatically transition from the menu (default: ``false``\ )


``inc_global name value`` `API-Doc </api/IncGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Adds the given value to the specified global.

**Parameters**


* *name*\ : Name of the global to be changed
* *value*\ : Value to be added (default: 1)


``inventory_add item`` `API-Doc </api/InventoryAddCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Adds an item to the inventory. If the player is picking up an object, you may
want to use this command in conjunction with the ``set_active`` command so that
the object 'disappears' from the scene as it's added to the inventory.

**Parameters**


* *item*\ : Global ID of the ``ESCItem`` to add to the inventory


``inventory_remove item`` `API-Doc </api/InventoryRemoveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Removes an item from the inventory. You may wish to use this command in
conjuction with the ``set_active`` command to show an item in the scene,
simulating placing the item somewhere, for example.

**Parameters**


* *item*\ : Global ID of the ``ESCItem`` to remove from the inventory


``play_snd file [player]`` `API-Doc </api/PlaySndCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Plays the specified sound without blocking the currently running event.

**Parameters**


* *file*\ : Sound file to play
* *player*\ : Sound player to use. Can either be ``_sound``\ , which is used to play non-
  looping sound effects; ``_music``\ , which plays looping music; or ``_speech``\ , which
  plays non-looping voice files (default: ``_sound``\ )


``print string`` `API-Doc </api/PrintCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Prints a message to the Godot debug window.
Use this for debugging game state.

**Parameters**


* *string*\ : The string to log


``queue_event object event [channel] [block]`` `API-Doc </api/QueueEventCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Queue an event to run.

**Parameters**


* object: Object that holds the ESC script with the event
* event: Name of the event to queue
* channel: Channel to run the event on (default: ``_front``\ )
* block: Whether to wait for the queue to finish. This is only possible, if
  the queued event is not to be run on the same event as this command
  (default: ``false``\ )


``queue_resource path [front_of_queue]`` `API-Doc </api/QueueResourceCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Queues the loading of the given resource into the resource cache.

**Parameters**


* *path*\ : Path of the resource to cache
* *front_of_queue*\ : Whether to put the resource at the front of the
  queue in order to load it as soon as possible (default: ``false``\ )


``rand_global name max_value`` `API-Doc </api/RandGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the given global to a random integer between 0 and ``max_value``
(inclusive). e.g. Setting ``max_value`` to 2 could result in '0', '1' or '2'
being returned.

**Parameters**


* *name*\ : Name of the global to set
* *max_value*\ : Maximum possible integer value (inclusive) (default: 1)


``repeat`` `API-Doc </api/RepeatCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Restarts the execution of the current scope at the start. A scope can be a
group or an event.


``say player text [type]`` `API-Doc </api/SayCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Displays the specified string as dialog spoken by the player. This command
blocks further event execution until the dialog has finished being 'said'
(either as displayed text or as audible speech from a file).

Global variables can be substituted into the text by wrapping the global
name in braces.
e.g. say player "I have {coin_count} coins remaining".

**Parameters**


* *player*\ : Global ID of the ``ESCPlayer`` or ``ESCItem`` object that is active
* *text*\ : Text to display
* *type*\ : Dialog type to use. One of ``floating`` or ``avatar``
  (default: the value set in the setting "Escoria/UI/Default Dialog Type")

The text supports translation keys by prepending the key followed by
a colon (\ ``:``\ ) to the text.
For more details see: https://docs.escoria-framework.org/en/devel/getting_started/dialogs.html#translations

Playing an audio file while the text is being
displayed is also supported by this mechanism.
For more details see: https://docs.escoria-framework.org/en/devel/getting_started/dialogs.html#recorded_speech

Example: ``say player ROOM1_PICTURE:"Picture's looking good."``


``sched_event time object event`` `API-Doc </api/SchedEventCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Schedules an event to run at a later time.

If another event is already running when the scheduled
event is supposed to start, execution of the scheduled event
begins when the already-running event ends.

**Parameters**


* *time*\ : Time in seconds until the scheduled event starts
* *object*\ : Global ID of the ESCItem that holds the ESC script
* *event*\ : Name of the event to schedule


``set_active object active`` `API-Doc </api/SetActiveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the "active" state of the object.
Inactive objects are invisible in the room.

**Parameters**


* *object* Global ID of the object
* *active* Whether ``object`` should be active. ``active`` can be ``true`` or ``false``.


``set_active_if_exists object active`` `API-Doc </api/SetActiveIfExistsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


**\ * FOR INTERNAL USE ONLY *\ **

Changes the "active" state of the object in the current room if it currently
exists in the object manager. If it doesn't, then, unlike set_active, we don't
fail and we just carry on.

Inactive objects are invisible in the room.

**Parameters**


* *object* Global ID of the object
* *active* Whether ``object`` should be active. ``active`` can be ``true`` or ``false``.


``set_animations object animations`` `API-Doc </api/SetAnimationsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the animation resource for the given ``ESCPlayer`` or movable ``ESCItem``.

**Parameters**


* *object*\ : Global ID of the object whose animation resource is to be updated
* *animations*\ : The path of the animation resource to use


``set_global name value [force=false]`` `API-Doc </api/SetGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the value of a global.

**Parameters**


* *name*\ : Name of the global
* *value*\ : Value to set the global to (can be of type string, boolean, integer
  or float)
* *force*\ : if false, setting a global whose name is reserved will
  trigger an error. Defaults to false. Reserved globals are: ESC_LAST_SCENE,
  FORCE_LAST_SCENE_NULL, ANIMATION_RESOURCES, ESC_CURRENT_SCENE


``set_globals pattern value`` `API-Doc </api/SetGlobalsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the value of multiple globals using a wildcard pattern, where ``*``
matches zero or more arbitrary characters and ``?`` matches any single
character except a period (".").

**Parameters**


* *pattern*\ : Pattern to use to match the names of the globals to change
* *value*\ : Value to set (can be of type string, boolean, integer or float)


``set_gui_visible visible`` `API-Doc </api/SetGuiVisibleCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Show or hide the GUI.

**Parameters**


* *visible*\ : Whether the GUI should be visible (\ ``true`` or ``false``\ )


``set_interactive object interactive`` `API-Doc </api/SetInteractiveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets whether an object is interactive.

**Parameters**


* *object*\ : Global ID of the object to change
* *interactive*\ : Whether the object should be interactive


``set_speed object speed`` `API-Doc </api/SetSpeedCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the speed of a ``ESCPlayer`` or movable ``ESCItem``.

**Parameters**


* *object*\ : Global ID of the ``ESCPlayer`` or movable ``ESCItem``
* *speed*\ : Speed value for ``object`` in pixels per second.


``set_state object state [immediate]`` `API-Doc </api/SetStateCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the state of ``object`` to the one specified.

If the specified object's associated animation player has an animation
with the same name, that that animation is also played.

Can be used to change the appearance of an item or player
character. See https://docs.escoria-framework.org/states for details.

**Parameters**


* *object*\ : Global ID of the object whose state is to be changed
* *immediate*\ : If an animation for the state exists, specifies
  whether it is to skip to the last frame. Can be ``true`` or ``false``.


``show_menu menu_type [enable_automatic_transition]`` `API-Doc </api/ShowMenuCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Shows either the main menu or the pause menu. The enable_automatic_transition
parameter can be used to specify if Escoria manages the graphical transition to
the menu or not. If set to false, you can manage the transition yourself
instead (if you want to change the transition type from the default for
example) using the ``transition`` command.

**Parameters**


* *menu_type*\ : Which menu to show. Can be either ``main`` or ``pause`` (default: ``main``\ )
* *enable_automatic_transition*\ : Whether to automatically transition to the menu (default: ``false``\ )


``slide_block object target [speed]`` `API-Doc </api/SlideBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves ``object`` towards the position of ``target``. This command is
blocking.


* *object*\ : Global ID of the object to move
* *target*\ : Global ID of the target object
* *speed*\ : The speed at which to slide in pixels per second (will default to
  the speed configured on the ``object``\ )

**Warning** This command does not respect the room's navigation polygons, so
``object`` can be moved even when outside walkable areas.


``slide object target [speed]`` `API-Doc </api/SlideCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves ``object`` towards the position of ``target``. This command is
non-blocking.


* *object*\ : Global ID of the object to move
* *target*\ : Global ID of the target object
* *speed*\ : The speed at which to slide in pixels per second (will default to
  the speed configured on the ``object``\ )

**Warning** This command does not respect the room's navigation polygons, so
``object`` can be moved even when outside walkable areas.


``spawn identifier path [is_active] [position_target]`` `API-Doc </api/SpawnCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Programmatically adds a new item to the scene.

**Parameters**


* *identifier*\ : Global ID to use for the new object
* *path*\ : Path to the scene file of the object
* *is_active*\ : Whether the new object should be set to active (default: ``true``\ )
* *position_target*\ : Global ID of another object that will be used to
  position the new object (when omitted, the new object's position is not specified)


``stop`` `API-Doc </api/StopCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Stops the current event's execution.


``stop_snd [player]`` `API-Doc </api/StopSndCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Stops the given sound player's stream.

**Parameters**


* *player*\ : Sound player to use. Either ``_sound``\ , which is used to play non-
  looping sound effects; ``_music``\ , which plays looping music; or ``_speech``\ , which
  plays non-looping voice files (default: ``_music``\ )


``teleport object target`` `API-Doc </api/TeleportCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Instantly moves an object to a new position.

**Parameters**


* *object*\ : Global ID of the object to move
* *target*\ : Global ID of the object to use as the destination coordinates
  for ``object``


``teleport_pos object x y`` `API-Doc </api/TeleportPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Instantly moves an object to the specified (absolute) coordinates.

**Parameters**


* *object*\ : Global ID of the object to move
* *x*\ : X-coordinate of destination position
* *y*\ : Y-coordinate of destination position


``transition transition_name mode [delay]`` `API-Doc </api/TransitionCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Performs a transition into or out of a room programmatically.

**Parameters**


* *transition_name*\ : Name of the transition shader from one of the transition
  directories
* *mode*\ : Set to ``in`` to transition into or ``out`` to transition out of the room
* *delay*\ : Delay in seconds before starting the transition (default: ``1.0``\ )


``turn_to object object_to_face [wait]`` `API-Doc </api/TurnToCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Turns ``object`` to face another object.

Unlike movement commands, ``turn_to`` will not automatically reference an
``ESCLocation`` that is a child of an ``ESCItem.``
To turn towards an ``ESCLocation`` that is a child of an ``ESCItem``\ , give the
``ESCLocation`` a ``Global ID`` and use this value as the ``object_to_face``
parameter.

**Parameters**


* *object*\ : Global ID of the object to be turned
* *object_to_face*\ : Global ID of the object to turn towards
* *wait*\ : Length of time to wait in seconds for each intermediate angle.
  If set to 0, the turnaround is immediate (default: ``0``\ )


``wait seconds`` `API-Doc </api/WaitCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Blocks execution of the current event.

**Parameters**


* *seconds*\ : Number of seconds to block


``walk_block object target [walk_fast]`` `API-Doc </api/WalkBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to ``target``
while playing ``object``\ 's walking animation. This command is blocking.
This command will use the normal walk speed by default.

**Parameters**


* *object*\ : Global ID of the object to move
* *target*\ : Global ID of the target object
* *walk_fast*\ : Whether to walk fast (\ ``true``\ ) or normal speed (\ ``false``\ ).
  (default: false)


``walk object target [walk_fast]`` `API-Doc </api/WalkCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to ``target``
while playing ``object``\ 's walking animation. This command is non-blocking.
This command will use the normal walk speed by default.

**Parameters**


* *object*\ : Global ID of the object to move
* *target*\ : Global ID of the target object
* *walk_fast*\ : Whether to walk fast (\ ``true``\ ) or normal speed (\ ``false``\ )
  (default: false)


``walk_to_pos_block object x y [walk_fast]`` `API-Doc </api/WalkToPosBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to the absolute
coordinates provided while playing the ``object``\ 's walking animation.
This command is blocking.
This command will use the normal walk speed by default.

**Parameters**


* *object*\ : Global ID of the object to move
* *x*\ : X-coordinate of target position
* *y*\ : Y-coordinate of target position
* *walk_fast*\ : Whether to walk fast (\ ``true``\ ) or normal speed (\ ``false``\ ).
  (default: false)


``walk_to_pos object x y [walk_fast]`` `API-Doc </api/WalkToPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to the absolute
coordinates provided while playing the ``object``\ 's walking animation.
This command is non-blocking.
This command will use the normal walk speed by default.

**Parameters**


* *object*\ : Global ID of the object to move
* *x*\ : X-coordinate of target position
* *y*\ : Y-coordinate of target position
* *walk_fast*\ : Whether to walk fast (\ ``true``\ ) or normal speed (\ ``false``\ ).
  (default: false)




.. /ESCCOMMANDS

Dialogs
-------

Dialogs are specified by writing ``?`` with optional parameters,
followed by a list of dialog options starting with ``-``. Use ``!`` to
end the dialog.

The following parameters are available:

-  avatar: The path to a scene displaying an avatar to be used in the UI.
   Defaults to no avatar. To set only the parameters below, set this
   parameter's value to ``-``
-  timeout: Time allowed to select an option. Default value 0. After the
   specified time has elapsed, ``timeout_option`` will be selected
   automatically.
   If the value is 0, there is no timeout (i.e. no time limit to select an
   option).
-  timeout_option: Index of option selected when timeout is reached.
   Default value of 0. Index begins at 1.

Options support translation keys by prepending and separating them with
a ``:`` from the rest of the text.

Example:

.. code-block::

   # character's "talk" event
   :talk
   ? avatar timeout timeout_option
       - MAP:"I'd like to buy a map." [!player_has_map]
           say player "I'd like to buy a map"
           say map_vendor "Do you know the secret code?"
           ?
               - UNCLE_SVEN:"Uncle Sven sends regards."
                   say player "Uncle Sven sends regards."

                   >   [player_has_money]
                       say map_vendor "Here you go."
                       say player "Thanks!"
                       inventory_add map
                       set_global player_has_map true
                       stop

                   >   [!player_has_money]
                       say map_vendor "You can't afford it"
                       say player "I'll be back"
             !
                       stop

               - "Nevermind"
                   say player "Nevermind"
           !
                   stop
       - "Nevermind"
           say player "Nevermind"
       !
           stop
   repeat

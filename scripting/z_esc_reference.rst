.. _esc_language_reference:

ESC language reference
======================

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

Global flags
------------

Global flags define the state of the game and can be true/false, a number,
or a string. All commands and groups can be condtionally set based on the
value of a global flag.

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

An event has a name and the prefix ``:``, like this:

``:ready``

While you can use arbitrary event names (for example, to schedule them
with the ``sched_event``\ command), there are some special events that
are called by Escoria in certain situations:

-  ``:setup`` (on an ``ESCScene`` object): Called *before* a transition is
   performed
-  ``:ready``\ (on an ``ESCScene`` object): Called *after* a transition is
   performed
-  ``:use <global id>``\ (on an ``ESCItem`` object): Called when the
   inventory item ``<global id>``\ is used with the item running this script
-  ``:<verb>``\ (on an ESCItem object): Called when a special verb is
   used on the item running this script (e.g.``:look``)

To initialize a room properly, you may want to use ``:setup`` like this:

.. code-block::

   :setup
   teleport player door1 [eq ESC_LAST_SCENE scene1]
   teleport player door2 [eq ESC_LAST_SCENE scene2]

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


Sets how much input the game is to accept, allowing for cut scenes
in which dialog can be skipped (if [type] is set to SKIP).
Also allows for cut scenes that can be completely locked down.

**Parameters**


* *type*\ : Type of inputs to accept (ALL)
  ``ALL``\ : Accept all types of input
  ``SKIP``\ : Accept skipping dialogs but nothing else
  ``NONE``\ : Deny all inputs (including opening menus)

**Warning**\ : ``SKIP`` and ``NONE`` also disable autosaves.

**Warning**\ : The type of input accepted will persist even after the current
event has ended.


``anim_block object name [reverse]`` `API-Doc </api/AnimBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Executes the animation specified in "name" on "object",
while blocking. The next command in the event will be executed when the animation
is finished playing.

**Parameters**


* *object*\ : Global ID of the object with the animation
* *name*\ : Name of the animation to play
* *reverse*\ : Plays the animation in reverse when true


``anim object name [reverse]`` `API-Doc </api/AnimCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Executes the animation specified in "name" on "object",
without blocking. The next command in the event will be executed immediately
after.

**Parameters**


* *object*\ : Global ID of the object with the animation
* *name*\ : Name of the animation to play
* *reverse*\ : Plays the animation in reverse when true


``camera_push target [time] [type]`` `API-Doc </api/CameraPushCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Pushes the camera to point at a specific ``target``.

**Parameters**


* *target*\ : Global ID of the ``ESCItem`` to push the camera to. If the target
  has a child node called ``camera_node``\ , its location will be used. If not,
  the location of the target will be used
* *time*\ : Number of seconds the transition should take (default: ``1``\ )
* *type*\ : Transition type to use (default: ``QUAD``\ )

Supported transitions include the names of the values used
in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix):

https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

For more details see: https://docs.escoria-framework.org/camera


``camera_set_limits camlimits_id`` `API-Doc </api/CameraSetLimitsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Activates the current camera's limits

**Parameters**


* *camlimits_id*\ : Index of the camera limit in the ``camera limits``
  list of the current ``ESCRoom``

For more details see: https://docs.escoria-framework.org/camera


``camera_set_pos time x y`` `API-Doc </api/CameraSetPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the camera to the given position.

**Parameters**


* *time*\ : Number of seconds the transition should take
* *x*\ : Target X coordinate
* "y*: Target Y coordinate

For more details see: https://docs.escoria-framework.org/camera


``camera_set_target time object`` `API-Doc </api/CameraSetTargetCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Configures the camera to follow the specified target ``object``

**Parameters**


* *time*\ : Number of seconds the transition should take
* *object*\ : Global ID of the target object

For more details see: https://docs.escoria-framework.org/camera


``camera_set_zoom magnitude [time]`` `API-Doc </api/CameraSetZoomCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Zooms the camera in/out to the desired ``magnitude``. Values larger than 1 zoom
the camera out while smaller values zoom in, relative to the default value
of 1.

**Parameters**


* *magnitude*\ : Magnitude of zoom
* *time*\ : Number of seconds the transition should take, with a value of ``0``
  meaning the zoom should happen instantly (default: ``0``\ )

For more details see: https://docs.escoria-framework.org/camera


``camera_set_zoom_height pixels [time]`` `API-Doc </api/CameraSetZoomHeightCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Zooms the camera in/out so it occupies the given height in pixels

**Parameters**


* *pixels*\ : Target height in pixels
* *time*\ : Number of seconds the transition should take, with a value of ``0``
  meaning the zoom should happen instantly (default: ``0``\ )

For more details see: https://docs.escoria-framework.org/camera


``camera_shift x y [time] [type]`` `API-Doc </api/CameraShiftCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Shifts the camera by the given horizontal and vertical amounts.

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


Switches the current scene to another scene

**Parameters**


* *path*\ : Path of the new scene
* *enable_automatic_transition*\ : Automatically transition to the new scene
  (default: ``true``\ )
* *run_events*\ : Run the standard ESC events of the new scene (default: ``true``\ )


``custom object node func_name [params]`` `API-Doc </api/CustomCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Calls the given Godot function on a (child) node of a registered ``ESCitem``.

**Parameters**


* *object*\ : Global ID of the target ``ESCItem``
* *node*\ : Name of the child node of the target ``ESCItem``
* *func_name*\ : Name of the function to be called
* *params*\ : Any primitive, non-array arguments for the function. Multiple
  parameters can be passed by using comma-separated values inside a string


``debug string [string2 ...]`` `API-Doc </api/DebugCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Prints a DEBUG-level message to the log.

**Parameters**


* *string*\ : One or more strings to log


``dec_global name value`` `API-Doc </api/DecGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Subtract the given value from the specified global.

**Parameters**


* *name*\ : Name of the global to be changed
* *value*\ : Value to be subtracted


``enable_terrain node_name`` `API-Doc </api/EnableTerrainCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enables the ``ESCTerrain``\ 's ``NavigationPolygonInstance`` defined by the given node name.
Disables previously-activated ``NavigationPolygonInstance``.

**Parameters**


* *node_name*\ : Name of the ``NavigationPolygonInstance`` node to activate


``hide_menu menu_type [enable_automatic_transition]`` `API-Doc </api/HideMenuCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Hides either the main menu or the pause menu.

**Parameters**


* *menu_type*\ : Type of menu to hide. Can be either ``main`` or ``pause`` (default: ``main``\ )
* *enable_automatic_transition*\ : Whether to automatically transition from the menu (default: ``false``\ )


``inc_global name value`` `API-Doc </api/IncGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Adds the given value to the specified global.

**Parameters**


* *name*\ : Name of the global to be changed
* *value*\ : Value to be added


``inventory_add item`` `API-Doc </api/InventoryAddCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Adds an item to the inventory.

**Parameters**


* *item*\ : Global ID of the ``ESCItem`` to add to the inventory


``inventory_remove item`` `API-Doc </api/InventoryRemoveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Removes an item from the inventory

**Parameters**


* *item*\ : Global ID of the ``ESCItem`` to remove from the inventory


``play_snd file [player]`` `API-Doc </api/PlaySndCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Plays the specified sound without blocking the event.

**Parameters**


* *file*\ : Sound file to play
* *player*\ : Sound player to use. Can either be ``_sound``\ , which is used to play non-
  looping sound effects; ``_music``\ , which plays looping music; or ``_speech``\ , which
  plays non-looping voice files (default: ``_sound``\ )


``queue_event object event [channel] [block]`` `API-Doc </api/QueueEventCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Queue another event to run

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


Sets the given global to a random integer between 0 and ``max_value`` (inclusive).

**Parameters**


* *name*\ : Name of the global to set
* *max_value*\ : Maximum possible integer value (exclusive)


``repeat`` `API-Doc </api/RepeatCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Restarts the execution of the current scope at the start. A scope can be a
group or an event.


``say player text [type]`` `API-Doc </api/SayCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Displays the specified string as dialog spoken by the player. Blocks execution
until the dialog has finished playing.

**Parameters**


* *player*\ : Global ID of the ``ESCPlayer`` or ``ESCItem`` object that is active
* *text*\ : Text to display
* *type*\ : Dialog type to use. One of ``floating`` or ``avatar``
  (default: the value set in the setting "Escoria/UI/Default Dialog Type")

The text supports translation keys by prepending the key followed by
a colon (\ ``:``\ ) to the text.

Example: ``say player ROOM1_PICTURE:"Picture's looking good."``


``sched_event time object event`` `API-Doc </api/SchedEventCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Schedules the execution to run at a later time.

If another event is already running when the scheduled
event is to start, execution of the scheduled event
begins when the already-running event ends.

**Parameters**


* *time*\ : Time in seconds until the scheduled event starts
* *object*\ : Global ID of the ESCItem that holds the ESC script
* *event*\ : Name of the event to schedule


``set_active object active`` `API-Doc </api/SetActiveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the "active" state of the object. ``active`` can be ``true`` or ``false``.
Inactive objects are invisible in the room.

**Parameters**


* *object* Global ID of the object
* *active* Whether ``object`` should be active.


``set_angle object degrees [wait]`` `API-Doc </api/SetAngleCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Turns a movable ``ESCItem`` or ``ESCPlayer``.

**Parameters**


* *object*\ : Global ID of the object to turn
* *degrees*\ : Number of degrees by which ``object`` is to be turned
* *wait*\ : Number of seconds to wait for each animation occurring between the
  current angle of ``object`` and the angle specified. A value of ``0`` will
  complete the turn immediately (default: ``0``\ )


``set_animations object animations`` `API-Doc </api/SetAnimationsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the animation resource for the given ``ESCPlayer`` or movable ``ESCItem``.

**Parameters**


* *object*\ : Global ID of the object whose animation resource is to be updated
* *animations*\ : The path of the animation resource to use


``set_global name value`` `API-Doc </api/SetGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the value of a global.

**Parameters**


* *name*\ : Name of the global
* *value*\ : Value to set (can be of type string, boolean, integer or float)


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


Shows or hide the GUI.

**Parameters**


* *visible*\ : Whether the GUI should be visible


``set_interactive object interactive`` `API-Doc </api/SetInteractiveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets whether an object should be interactive.

**Parameters**


* *object*\ : Global ID of the object to change
* *interactive*\ : Whether the object should be interactive


``set_speed object speed`` `API-Doc </api/SetSpeedCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the speed of a ``ESCPlayer`` or movable ``ESCItem``.

**Parameters**


* *object*\ : Global ID of the ``ESCPlayer`` or movable ``ESCItem``
* *speed*\ : Speed value for ``object``


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


Shows either the main menu or the pause menu.

**Parameters**


* *menu_type*\ : Type of menu to hide. Can be either ``main`` or ``pause`` (default: ``main``\ )
* *enable_automatic_transition*\ : Whether to automatically transition to the menu (default: ``false``\ )


``slide_block object target [speed]`` `API-Doc </api/SlideBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves ``object`` towards the position of ``target``. This command is
blocking.


* *object*\ : Global ID of the object to move
* *target*\ : Global ID of the target object
* *speed*\ : Movement speed (default: the default speed of ``object``\ )

**Warning** This command does not respect the room's navigation polygons, so
``object`` can be moved even when outside walkable areas.


``slide object target [speed]`` `API-Doc </api/SlideCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves ``object`` towards the position of ``target``. This command is
non-blocking.


* *object*\ : Global ID of the object to move
* *target*\ : Global ID of the target object
* *speed*\ : Movement speed (default: the default speed of ``object``\ )

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
  position the new object (when omitted, the new objet's position is not specified)


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


Instantly moves an object to a new position

**Parameters**


* *object*\ : Global ID of the object to move
* *target*\ : Global ID of the target object to use as the destination


``teleport_pos object x y`` `API-Doc </api/TeleportPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Instantly moves an object to the specified position

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
* *delay*\ : Delay in seconds before starting the transition (default: ``1``\ )


``turn_to object object_to_face [wait]`` `API-Doc </api/TurnToCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Turns ``object`` to face another object.

**Parameters**


* *object*\ : Global ID of the object to be turned
* *object_to_face*\ : Global ID of the object to turn towards
* *wait*\ : Length of time to wait in seconds for each intermediate angle.
  If set to 0, the turnaround is immediate (default: ``0``\ )
  #


``wait seconds`` `API-Doc </api/WaitCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Blocks execution of the current event.

**Parameters**


* *seconds*\ : Number of seconds to block


``walk_block object target [speed]`` `API-Doc </api/WalkBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to ``target``
while playing ``object``\ 's walking animation. This command is blocking.

**Parameters**


* *object*\ : Global ID of the object to move
* *target*\ : Global ID of the target object
* *speed*\ : Walking speed to use (default: ``object``\ 's default speed)


``walk object target [speed]`` `API-Doc </api/WalkCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to ``target`` w
hile playing ``object``\ 's walking animation. This command is non-blocking.

**Parameters**


* *object*\ : Global ID of the object to move
* *target*\ : Global ID of the target object
* *speed*\ : Walking speed to use (default: ``object``\ 's default speed)


``walk_to_pos_block object x y`` `API-Doc </api/WalkToPosBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to the target
position while playing ``object``\ 's walking animation.
This command is blocking.

**Parameters**


* *object*\ : Global ID of the object to move
* *x*\ : X-coordinate of target position
* *y*\ : Y-coordinate of target position


``walk_to_pos object x y`` `API-Doc </api/WalkToPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the specified ``ESCPlayer`` or movable ``ESCItem`` to the target
position while playing ``object``\ 's walking animation.
This command is non-blocking.

**Parameters**


* *object*\ : Global ID of the object to move
* *x*\ : X-coordinate of target position
* *y*\ : Y-coordinate of target position




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

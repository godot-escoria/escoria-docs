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

``accept_input [ALL|NONE|SKIP]`` `API-Doc </api/AcceptInputCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


What type of input does the game accept. ALL is the default, SKIP allows
skipping of dialog but nothing else, NONE denies all input. Including opening
the menu etc. SKIP and NONE also disable autosaves.

*Note* that SKIP gets reset to ALL when the event is done, but NONE persists.
This allows you to create cut scenes with SKIP where the dialog can be
skipped, but also initiate locked#### down cutscenes with accept_input
NONE in :setup and accept_input ALL later in :ready.


``anim object name [reverse]`` `API-Doc </api/AnimCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Executes the animation specificed with the "name" parameter on the object,
without blocking. The next command in the event will be executed immediately
after. Optional parameters:


* reverse: plays the animation in reverse when true


``camera_push target [time] [type]`` `API-Doc </api/CameraPushCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Push camera to ``target``. Target must have camera_pos set. If it's of type
Camera2D, its zoom will be used as well as position. ``type`` is any of the
Tween.TransitionType values without the prefix, eg. LINEAR, QUART or CIRC;
defaults to QUART. A ``time`` value of 0 will set the camera immediately.


``camera_set_limits camlimits_id`` `API-Doc </api/CameraSetLimitsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the camera limits to the one defined under ``camlimits_id`` in ESCRoom's
camera_limits array.


* camlimits_id: int: id of the camera limits to apply (defined in ESCRoom's
  camera_limits array)


``camera_set_pos speed x y`` `API-Doc </api/CameraSetPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves the camera to a position defined by "x" and "y", at the speed defined
by "speed" in pixels per second. If speed is 0, camera is teleported to the
position.


``camera_set_target speed object`` `API-Doc </api/CameraSetTargetCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Configures the camera to set the target to the given ``object``\ using ``speed``
as speed limit.
This is the default behavior (default follow object is "player").


``camera_set_zoom magnitude [time]`` `API-Doc </api/CameraSetZoomCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Zooms the camera in/out to the desired ``magnitude``. Values larger than 1 zooms
the camera out, and smaller values zooms in, relative to the default value
of 1. An optional ``time`` in seconds controls how long it takes for the camera
to zoom into position.


``camera_set_zoom_height pixels [time]`` `API-Doc </api/CameraSetZoomHeightCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Zooms the camera in/out to the desired ``pixels`` height.
An optional ``time`` in seconds controls how long it takes for the camera
to zoom into position.


``camera_shift x y [time] [type]`` `API-Doc </api/CameraShiftCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Shift camera by ``x`` and ``y`` pixels over ``time`` seconds. ``type`` is any of the
Tween.TransitionType values without the prefix, eg. LINEAR, QUART or CIRC;
defaults to QUART.


``change_scene path [enable_automatic_transition=true] [run_events=true]`` `API-Doc </api/ChangeSceneCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Loads a new scene, specified by "path".
 The ``enable_automatic_transition`` is a boolean (default true) can be set
to false to disable automatic transitions between scenes, to allow you
to control your transitions manually using the ``transition`` command.
The ``run_events`` variable is a boolean (default true) which you never want
to set manually! It's there only to benefit save games, so they don't
conflict with the scene's events.


``custom object node func_name [params]`` `API-Doc </api/CustomCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Calls the function ``func_name`` of the node ``node`` of object ``object`` with
the optional ``params``. This is a blocking function


``cut_scene object name [reverse]`` `API-Doc </api/CutSceneCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Executes the animation specificed with the "name" parameter on the object,
blocking. The next command in the event will be executed when the animation
is finished playing. Optional parameters:


* reverse plays the animation in reverse when true


``debug string [string2 ...]`` `API-Doc </api/DebugCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Takes 1 or more strings, prints them to the console.


``dec_global name value`` `API-Doc </api/DecGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Subtracts the value from global with given "name". Value and global must
both be integers.


``enable_terrain node_name`` `API-Doc </api/EnableTerrainCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Enable the ESCTerrain's NavigationPolygonInstance defined by given node name.
Disables previously activated NavigationPolygonInstance.


``hide_menu main|pause=main [enable_automatic_transition: true|false=false]`` `API-Doc </api/HideMenuCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Hides the main or pause menu.
 The ``enable_automatic_transition`` is a boolean (default false) can be set
to false to disable automatic transitions between scenes, to allow you
to control your transitions manually using the ``transition`` command.


``inc_global name value`` `API-Doc </api/IncGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Adds the value to global with given "name". Value and global must both be
integers.


``inventory_add item`` `API-Doc </api/InventoryAddCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Add an item to the inventory


``inventory_remove item`` `API-Doc </api/InventoryRemoveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Remove an item from the inventory.


``play_snd file [player]`` `API-Doc </api/PlaySndCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Plays the sound specificed with the "file" parameter on the sound player
``player``\ , without blocking. (player defaults to _sound)


``queue_resource path [front_of_queue]`` `API-Doc </api/QueueResourceCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Queues the load of a resource in a background thread. The ``path`` must be a
full path inside your game, for example "res://scenes/next_scene.tscn". The
"front_of_queue" parameter is optional (default value false), to put the
resource in the front of the queue. Queued resources are cleared when a
change scene happens (but after the scene is loaded, meaning you can queue
resources that belong to the next scene).


``rand_global name max_value`` `API-Doc </api/RandGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Fills the "name" global with a random value between 0 and max-value-1.


``repeat`` `API-Doc </api/RepeatCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Restarts the execution of the current scope at the start. A scope can be a
group or an event.


``say player text [type]`` `API-Doc </api/SayCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Runs the specified string as a dialog said by the player. Blocks execution
until the dialog finishes playing.

The text supports translation keys by prepending the key and separating
it with a ``:`` from the text.

Example: ``say player ROOM1_PICTURE:"Picture's looking good."``

Optional parameters:


* "type" determines the type of dialog UI to use. Default value is "default"


``sched_event time object event`` `API-Doc </api/SchedEventCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Schedules the execution of an "event" found in "object" in a time in seconds.
If another event is running at the time, execution starts when the running
event ends.


``set_active object value`` `API-Doc </api/SetActiveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the "active" state of the object, value can be true or false.
Inactive objects are hidden in the scene.


``set_angle object degrees [wait]`` `API-Doc </api/SetAngleCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Turns object to a degrees angle without animations. 0 sets object facing
forward, 90 sets it 90 degrees clockwise ("east") etc. When turning to the
destination angle, animations are played if they're defined in animations.

object must be player or interactive. degrees must be between [0, 360] or an
error is reported.

The wait parameter sets how long to wait for each intermediate angle. It
defaults to 0, meaning the turnaround is immediate.


``set_animations object animations`` `API-Doc </api/SetAnimationsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Set the animation resource for the given ESCPlayer


``set_global name value`` `API-Doc </api/SetGlobalCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the value of the global "name" with the value. Value can be "true",
"false" or an integer.


``set_globals pattern value`` `API-Doc </api/SetGlobalsCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the value of multiple globals using a wildcard pattern, where "*"
matches zero or more arbitrary characters and "?" matches any single
character except a period (".").


``set_hud_visible visible`` `API-Doc </api/SetHudVisibleCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


If you have a cutscene like sequence where the player doesn't have control,
and you also have HUD elements visible, use this to hide the HUD. You want
to do that because it explicitly signals the player that there is no control
over the game at the moment. "visible" is true or false.


``set_interactive object value`` `API-Doc </api/SetInteractiveCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets whether or not an object should be interactive.


``set_sound_state player sound loop`` `API-Doc </api/SetSoundStateCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Change the sound playing on ``player`` to ``sound`` with optional looping if
``loop`` is true.
Valid players are "_music" and "_sound".
Aside from paths to sound or music files, the values *off* and *default*.
*default* is the default value.
are also valid for ``sound``


``set_speed object speed`` `API-Doc </api/SetSpeedCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets how fast object moves. Speed is an integer.


``set_state object state [immediate]`` `API-Doc </api/SetStateCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Changes the state of an object, and executes the state animation if present.
The command can be used to change the appearance of an item or a player
character.
If ``immediate`` is set to true, the animation is run directly


``show_menu main|pause=main [enable_automatic_transition: true|false=false]`` `API-Doc </api/ShowMenuCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Shows the main or pause menu.
 The ``enable_automatic_transition`` is a boolean (default false) can be set
to false to disable automatic transitions between scenes, to allow you
to control your transitions manually using the ``transition`` command.


``slide_block object1 object2 [speed]`` `API-Doc </api/SlideBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves object1 towards the position of object2, at the speed determined by
object1's "speed" property, unless overridden. This command is blocking.
It does not respect the room's navigation polygons, so you can move items
where the player can't walk.


``slide object1 object2 [speed]`` `API-Doc </api/SlideCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Moves object1 towards the position of object2, at the speed determined by
object1's "speed" property, unless overridden. This command is non-blocking.
It does not respect the room's navigation polygons, so you can move items
where the player can't walk.


``spawn identifier path [is_active=true] [object2] `` `API-Doc </api/SpawnCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Instances a scene determined by "path", and places in the position of
object2 (object2 is optional)


``stop`` `API-Doc </api/StopCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Stops the event's execution.


``teleport object1 object2`` `API-Doc </api/TeleportCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the position of object1 to the position of object2.


``teleport_pos object1 x y`` `API-Doc </api/TeleportPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Sets the position of object1 to the position (x,y).


``transition transition_name in|out [delay]`` `API-Doc </api/TransitionCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Performs a transition in our out manually.

Parameters:


* transition_name: Name of the transition shader from one of the transition
  directories
* in|out: Wether to play the transition in IN- or OUT-mode
* delay: Delay for the transition to take. Defaults to 1 second


``turn_to object object_to_face [wait]`` `API-Doc </api/TurnToCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Turns object to face another object.

The wait parameter sets how long to wait for each intermediate angle. It
defaults to 0, meaning the turnaround is immediate.


``wait seconds`` `API-Doc </api/WaitCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Blocks execution of the current script for a number of seconds specified by
 the "seconds" parameter.


* seconds can be either and integer or a floating value


``walk_block object1 object2 [speed]`` `API-Doc </api/WalkBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Walks, using the walk animation, object1 towards the position of object2,
at the speed determined by object1's "speed" property,
unless overridden. This command is blocking.


``walk object1 object2 [speed]`` `API-Doc </api/WalkCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Walks, using the walk animation, object1 towards the position of object2,
at the speed determined by object1's "speed" property,
unless overridden. This command is non-blocking.


``walk_to_pos_block player x y`` `API-Doc </api/WalkToPosBlockCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Makes the ``player`` walk to the position ``x``\ /\ ``y``. This is a blocking command.


``walk_to_pos player x y`` `API-Doc </api/WalkToPosCommand.html>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Makes the ``player`` walk to the position ``x``\ /\ ``y``.




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

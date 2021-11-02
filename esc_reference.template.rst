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
-  ``NO_HUD`` stands for "No HUD": The HUD is hidden for the duration of
   the event. Useful for when you want something to look like a cutscene
   but don't want to disable input for skipping dialog.
-  ``NO_SAVE`` disables saving: Use this in cutscenes and anywhere a
   badly-timed autosave would leave your game in a messed-up state.

Commands
--------

Commands consist of a single word followed by some parameters. Parameters can be
a single word or a string in quotes.

.. code-block::

   # one parameter "player", another parameter "hello world"
   say player "hello world"

Conditions
~~~~~~~~~~

In order to run a command depending on the value of a flag, use ``[]`` with a list 
of comma-separated conditions. All conditions in this list must be true. Placing  
the character ``!`` before a flag can be used to negate that flag.

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
   specified time has elapsed, ``timeout_option`` will be selected automatically.
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

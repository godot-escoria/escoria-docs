.. _architecture_of_escoria:

Architecture of Escoria
=======================

The plugin script, autoload and classes
---------------------------------------

Following the `concept of Godot plugins`_,
Escoria initializes itself in the plugin script
:doc:`addons/escoria-core/plugin.gd </api/supporting_classes/addons--escoria-core--plugin.gd>`. This script is
mostly used to initialize the :ref:`Escoria configuration items
<escoria_settings>` and initialize (and later remove) the autoload scene
:doc:`escoria </api/supporting_classes/escoria>`.

This scene binds together all required objects and interfaces in a central
place.

In addition to this, various classes are defined in their respective class
files which build up the various resources used in Escoria. See the
:doc:`API-docs section </api/supporting_classes/addons--escoria-core--game--main.gd>` for details.

Nodes and objects of the Escoria autoload scene
-----------------------------------------------

The :doc:`Escoria autoload scene </api/supporting_classes/escoria>` holds
various nodes that provide vital parts of the engine:

Logger
~~~~~~

The :doc:`ESC logging framework </api/supporting_classes/addons--escoria-core--tools--logging--esc_logger.gd.ESCLoggerBase>` is
responsible for logging various game events throughout the engine.

Utils
~~~~~

Some smaller :doc:`utilities </api/supporting_classes/ESCUtils>` used in
various places in the engine.

Inventory manager
~~~~~~~~~~~~~~~~~

The :doc:`inventory manager </api/managers/ESCInventoryManager>` is responsible for
storing inventory items the player carries around.

Action Manager
~~~~~~~~~~~~~~

The :doc:`action manager </api/managers/ESCActionManager>` is used when the player
triggers a verb or uses items.

ESC Compiler
~~~~~~~~~~~~

The :doc:`ASHES compiler </api/supporting_classes/ESCCompiler>` compiles files in
the :doc:`ASHES language </scripting/z_ashes_reference>` into a list of
events that can be run by the :doc:`ASHES event manager </api/managers/ESCEventManager>`
using the :doc:`ASHES interpreter </api/supporting_classes/ESCInterpreter>`.

Event manager
~~~~~~~~~~~~~

The :doc:`ASHES event manager </api/managers/ESCEventManager>` is used for queueing
and scheduling events and handles event execution.

Globals manager
~~~~~~~~~~~~~~~

The :doc:`globals manager </api/managers/ESCGlobalsManager>` stores and handles
global flags as described in the :ref:`ASHES reference <global_flags>`.

Object manager
~~~~~~~~~~~~~~

The :doc:`object manager </api/managers/ESCObjectManager>` handles the state of the
objects used in the game (active/interactive/states). All objects that should
be handled by the engine - especially by ASBES scripts - are required to register
with the object manager and have a unique global ID.

Command registry
~~~~~~~~~~~~~~~~

The :doc:`command registry </api/supporting_classes/ESCCommandRegistry>` stores
references to available ASHES commands. By adding additional command directories
via the settings, developers can enrich the ASHES language for their specific needs.

Resource cache
~~~~~~~~~~~~~~

To optimize performance on platforms that support a larger memory footprint,
resources can be cached in the :doc:`resource cache
</api/supporting_classes/ESCResourceCache>` using the :ref:`queue_resource
</scripting/z_ashes_language_reference#queue_resource>` ASHES command.

Dialog player
~~~~~~~~~~~~~

The :doc:`dialog player </api/supporting_classes/ESCDialogPlayer>` is used for
handling dialogs and the :ref:`say </scripting/z_ashes_language_reference#say>` command.

Main
~~~~

:doc:`escoria.main </api/supporting_classes/addons--escoria-core--game--main.gd>` is the main scene manager used in
Escoria that allows for switching scenes with transitions.

Inputs Manager
~~~~~~~~~~~~~~

The :doc:`inputs manager </api/managers/ESCInputsManager>` is the central
component in Escoria to receive, handle, and deliver input events.

Save manager
~~~~~~~~~~~~

The :doc:`save manager </api/managers/ESCSaveManager>` is responsible for
storing and loading savegames as well as the game settings.

The Godot main scene of Escoria
-------------------------------

The scene that Godot loads when starting a game (the `main scene`_)
is set to :doc:`addons/escoria-core/game/main_scene.tscn
</api/supporting_classes/addons--escoria-core--game--main.gd>` which basically instantiates the configured
main menu scene and starts it.

The interactivity workflow of Escoria
-------------------------------------

When the player clicks on an :doc:`ESCItem </api/supporting_classes/ESCItem>`, the input
manager is used to check and distribute the click to the currently running game
interface. The game interface is then responsible for taking the respective
action based on its workflow. This way, different user interfaces can be
implemented. For a coin interface, for example, a right click could open the
coin and let the player select the respective verb.

The game interface will ultimately call ``escoria.do``, a plumbing method that handles
core functions like walking, clicking on items, and visiting areas. This method
will then take care of the various actions; for example, moving the player to
an object (or its ``interact_position``) and then running the appropriate
event. The event is based on the ``current_action`` set in the
:doc:`actions manager </api/managers/ESCActionManager>` (the verb) and the
``current_tool`` (the selected item). If the current verb is ``use`` and the
ASHES script has an event ``:use``, the
:doc:`event manager </api/managers/ESCEventManager>` will run that specific event.

.. _`concept of Godot plugins`: https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_plugins.html
.. _`main scene`: https://docs.godotengine.org/en/stable/getting_started/first_2d_game/05.the_main_game_scene.html

Game start sequence
-------------------

This is an overview of the steps that happen between when the player runs
your game on their computer to when they can start playing it.

.. image:: img/game_start_process.png
   :alt: Game start sequence

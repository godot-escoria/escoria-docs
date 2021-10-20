.. _architecture_of_escoria:

Architecture of Escoria
=======================

The plugin script, autoload and classes
---------------------------------------

According to the `concept of Godot plugins
<https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_plugins.html>`_,
Escoria initializes itself in the plugin script `addons/escoria-core/plugin.gd
<../api/plugin.gd.html>`_. This script is mostly used to initialize the
:ref:`Escoria configuration items <escoria_settings>` and
initialize (and later remove) the autoload scene `escoria
<../api/escoria.gd.html>`_.

This scene binds together all required objects and interfaces in a central
place.

In addition to this, various classes are defined in the respective class files
and build up the various resources used in Escoria. See the `API-docs section
<../api/main.gd.html>`_ for details.

Nodes and objects of the Escoria autoload scene
-----------------------------------------------

The `Escoria autoload scene <../api/escoria.gd.html>`_ holds various nodes
that provide vital parts of the engine.

Logger
~~~~~~

The `ESC logging framework <../api/ESCLogger.html>`_ is responsible to log
various game events throughout the engine.

Utils
~~~~~

Some smaller `utilities <../api/ESCUtils.html>`_ used on various places in
the engine.

Inventory manager
~~~~~~~~~~~~~~~~~

The `inventory manager <../api/ESCInventoryManager.html>`_ is responsible for
storing inventory items the player carries around.

Action Manager
~~~~~~~~~~~~~~

The `action manager <../api/ESCActionManager.html>`_ is used when the player
triggers a verb or uses items.

ESC Compiler
~~~~~~~~~~~~

The `ESC compiler <../api/ESCCompiler.html>`_ compiles files in the ̀ ESC
language <scripting/escoria_scripting_language>`_ into a list of events that can
be run by the `ESC event manager <../api/ESCEventManager.html>`_.

Event manager
~~~~~~~~~~~~~

The `ESC event manager <../api/ESCEventManager.html>`_ is used for queuing
and scheduling events and handles the event execution.

Globals manager
~~~~~~~~~~~~~~~

The `globals manager <../api/ESCGlobalsManager.html>`_ stores and handles
global flags as described in the `ESC reference
<scripting/escoria_scripting_language#global_flags>`_.

Object manager
~~~~~~~~~~~~~~

The `object manager <../api/ESCObjectManager.html>`_ handles the state of the
objects used in the game (active/interactive/states). All objects, that should
be handled by the engine and especially by ESC scripts are required to register
to the object manager and have a unique global id.

Command registry
~~~~~~~~~~~~~~~~

The `command registry <../api/ESCCommandRegistry.html>`_ stores references to
available ESC commands. By adding additional command directories via the
settings, developers can enrich the ESC language just for their games.

Resource cache
~~~~~~~~~~~~~~

To optimize performance on platforms that support a larger memory footprint,
resource can be cached in the `resource cache
<../api/ESCResourceCache.html>`_ using the `queue_resource
<scripting/escoria_scripting_language#queue_resource>`_ ESC command.

Dialog player
~~~~~~~~~~~~~

The `dialog player <../api/ESCDialogsPlayer.html>`_ is used for handling
dialogs and the `say <scripting/escoria_scripting_language#say>`_ command.

Main
~~~~

`escoria.main <../api/main.gd.html>`_ is the main scene manager used in
Escoria that allows for switching scenes with transitions

Inputs Manager
~~~~~~~~~~~~~~

The `inputs manager <../api/ESCInputsManager.gd.html>`_ is the central
component in Escoria to receive, handle and deliver input events.

Save manager
~~~~~~~~~~~~

The `save manager <../api/ESCSaveManager.gd.html>`_ is responsible for
storing and loading savegames and the game settings.

The Godot main scene of Escoria
-------------------------------

The scene, that Godot loads when starting a game (the **`main scene
<https://docs.godotengine.org/en/stable/getting_started/step_by_step/exporting.html#setting-a-main-scene>`_**)
is set to `addons/escoria-core/game/main_scene.tscn
<../api/main_scene.gd.html>`_ and basically instantiates the configured main
menu scene and starts it.

The interactivity workflow of Escoria
-------------------------------------

When the player clicks on an `ESCItem <../api/ESCItem.html>`_, the input
manager is used to check and distribute the click to the currently running game
interface. The game interface is then responsible for taking the respective
action based on its workflow. This way, different user interfaces can be
implemented. For a coin interface, for example, a right click would open the
coin and let the player select the respective verb.

The game interface will ultimatively call ``escoria.do``, which is a plumbing
method, that handles core functions like walking, clicking on items or visiting
areas. This method will then take care of the different actions, for example
moving the player to the object (or its ``interact_position``) and then running
the appropriate event. The event is based on the ``current_action`` set in the
`actions manager <../api/ESCActionManager.html>`_ (the verb) and the
``current_tool`` (the selected item). If the current verb is ``use`` and the
event has an event ``:use``, the `event manager
<../api/ESCEventManager.html>`_ will run that specific event.
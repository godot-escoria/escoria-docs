Create your own dialog manager
==============================

A dialog manager plugin is responsible for displaying text triggered by the
``say`` command and by selecting dialog choices when Escoria runs an
:doc:`ESCDialog </api/ESCDialog>`.

In both cases, Escoria supports a "type" which results in different views.

In the current stock dialog addon, for example, there's a *floating* type 
and an *avatar* type. The *floating* type displays text floating over the 
character's sprite. The *avatar* type displays a dialog box with an avatar 
and the spoken text.

.. note::

    Dialog choosers also support a type; however, this isn't currently 
    supported in the dialog statements of the ESC language.

Initialization
--------------

The dialog plugin needs to register classes that extend the
:doc:`ESCDialogManager </api/ESCDialogManager>`. This is done by adding the
path to the .gd files of the classes to the Escoria project setting
``escoria/ui/dialog_managers``.

This can be done in the following way:

.. code-block:: python

    tool
    extends EditorPlugin


    const MANAGER_CLASS="res://addons/my_plugin/my_manager.gd"


    # Register ourselves after setup
    func _enter_tree() -> void:
        call_deferred("_register") # 1
        

    # Unregister ourselves
    func _exit_tree() -> void:
        _unregister() # 2


    # Add ourselves to the list of dialog managers
    func _register():
        _unregister() # 3
        var dialog_managers: Array = ProjectSettings.get_setting(
            "escoria/ui/dialog_managers"
        )
        dialog_managers.push_back(MANAGER_CLASS)
        ProjectSettings.set_setting(
            "escoria/ui/dialog_managers",
            dialog_managers
        )


    # Remove ourselves from the list of dialog managers
    func _unregister():
        var dialog_managers = ProjectSettings.get_setting(
            "escoria/ui/dialog_managers"
        )
        
        dialog_managers.erase(MANAGER_CLASS)
        
        ProjectSettings.set_setting(
            "escoria/ui/dialog_managers",
            dialog_managers
        )
        

    # Register a new project setting if it hasn't been defined already
    #
    # #### Parameters
    #
    # - name: Name of the project setting
    # - default: Default value
    # - info: Property info for the setting
    func _register_setting(name: String, default, info: Dictionary):
        if not ProjectSettings.has_setting(name):
            ProjectSettings.set_setting(
                name,
                default
            )
            info.name = name
            ProjectSettings.add_property_info(info)


This script, which can be used as the main plugin file, does the following:

* 1: When the plugin enters the tree (is enabled), it calls the register
  function when the engine is idle. This is done to allow Escoria to start
  first so the plugin can be sure that the project setting has been
  initialized.
* 2: When the plugin exits the tree (is disabled), it unregisters the
  dialog manager to clean up after itself
* 3: For safety reasons, the plugin unregisters the dialog manager 
  (if it exists) before registering it by adding it to the list found in
  the project setting ``escoria/ui/dialog_managers``

The dialog manager class
------------------------

The dialog manager needs to extend
:doc:`ESCDialogManager </api/ESCDialogManager>`, which defines the basic
functions required for the dialog manager to work.

First, the dialog manager should return which types it supports:

* ``has_type``: Return whether the provided type is supported for displaying
  dialogs
* ``has_chooser_type``: Return whether the provided type is supported for
  displaying the dialog chooser

The dialog manager will be called by
:doc:`ESCDialogPlayer </api/ESCDialogPlayer>` to either display a dialog
line or to let the player choose a dialog option.

In the case where a line of dialog is to be displayed, the ``say`` method is 
called in the dialog manager. The following parameters are provided:

* ``dialog_player``: The dialog player node that the UI should use to display 
  the text. The node is added as a child to the scene. This ensures a 
  consistent look based on the user interface
* ``global_id``: The global ID of the item that the text should be displayed for
* ``text``: The text to display
* ``type``: The chosen type for the ``say`` command

The method must emit the ``say_finished`` signal when the text has finished 
being displayed.

In the case where the player chooses a dialog option, the ``choose`` method 
is called in the dialog manager. These parameters are provided:

* ``dialog_player``: The dialog player node that the UI should use to display 
  the text. The node is added as a child to the scene. This ensures a 
  consistent look based on the user interface
* ``dialog``: An :doc:`ESCDialog </api/ESCDialog>` object with details about
  the dialog and the dialog options to display

The method must emit the ``option_chosen`` signal when the player has chosen 
an option. The selected option (a :doc:`ESCDialogOption </api/ESCDialogOption>`
) should be provided as an argument to the signal.

Additionally, these functions need to be implemented:

* ``speedup``: Handles the player triggering the speeding up of the dialog, so 
  the text being rendered should be displayed faster
* ``interrupt``: The event has been interrupted and the dialog should be 
  interrupted immediately

Recommendations
---------------

The developer is completely free to implement the user interface for dialogs 
and the dialog chooser. The dialog UIs will be added to the game's user
interface, so theming the dialog UI is up to the game's UI and is not 
required for the dialog addon.

The ``say`` and ``choose`` methods should take care of adding the UI to the
supplied ``dialog_player`` node, as well as removing it again, so the scene
tree is clean.

The player object can be retrieved from the
:doc:`ESCObjectManager </api/ESCObjectManager>` to get additional information
about it, e.g. its position in the room.

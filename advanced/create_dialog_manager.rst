Create your own dialog manager
==============================

A dialog manager plugin is responsible for displaying text triggered by the
``say`` command and for selecting dialog choices when Escoria runs an
:doc:`ESCDialog </api/supporting_classes/ESCDialog>`.

In both cases, Escoria supports a "type" which results in the dialog 
manager presenting different views.

In the current stock dialog addon, for example, there's a ``floating`` type
and an ``avatar`` type. The ``floating`` type displays text "floating" over 
the character's sprite. The ``avatar`` type displays a dialog box with an 
avatar and the spoken text inside.

.. note::

    Dialog choosers also support a type; however, this isn't currently
    supported by dialog statements in the ASHES language.

Initialization
--------------

The dialog manager plugin needs to register a class that extend 
:doc:`ESCDialogManager </api/managers/ESCDialogManager>`. This is 
done by adding the path to the corresponding .gd file of that class to the 
Escoria project setting ``escoria/ui/dialog_managers``.

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

* ``1``: When the plugin enters the tree (i.e. is enabled), it calls the 
  ``_register`` function when the engine is idle. This is done in order to 
  allow Escoria to start first so the plugin can be sure that the project 
  setting has been initialized.
* ``2``: When the plugin exits the tree (i.e. is disabled), it unregisters 
  the dialog manager to clean up after itself.
* ``3``: For safety reasons, the plugin unregisters the dialog manager
  (when it exists) before registering it by adding it to the list found in
  the project setting ``escoria/ui/dialog_managers``.

The dialog manager class
------------------------

The dialog manager needs to extend
:doc:`ESCDialogManager </api/managers/ESCDialogManager>`, which 
defines the basic functions required for the dialog manager to work.

First, the dialog manager should return which types it supports by 
implementing these methods:

* ``has_type(type: String) -> bool``: Return whether the provided type is 
  supported for displaying dialogs.
* ``has_chooser_type(type: String) -> bool``: Return whether the provided 
  type is supported for displaying the dialog chooser.

The dialog manager will be called by
:doc:`ESCDialogPlayer </api/supporting_classes/ESCDialogPlayer>` to either 
display a line of dialog or to let the player choose a dialog option.

In the case where a line of dialog is to be displayed, the ``say`` method is
called in the dialog manager. The following parameters are provided:

* ``dialog_player``: The dialog player node that the UI should use to display
  the text. The node is added as a child to the scene. This ensures a
  consistent look based on the user interface.
* ``global_id``: The global ID of the item that the text should be displayed
  for (i.e. the "item" that is speaking)..
* ``text``: The text to display.
* ``type``: The chosen type of dialog box to use.
* ``key``: The translation key to use.

The method must emit the ``say_finished`` signal when the text has finished
being displayed.

In the case where the player chooses a dialog option, the ``choose`` method
is called in the dialog manager. These parameters are provided:

* ``dialog_player``: The dialog player node that the UI should use to display
  the text. The node is added as a child to the scene. This ensures a
  consistent look based on the user interface.
* ``dialog``: An :doc:`ESCDialog </api/supporting_classes/ESCDialog>` object 
  with details about the dialog and the dialog options to display.
* ``type``: The dialog chooser type to use.

The method must emit the ``option_chosen`` signal when the dialog manager has
finished processing the choice. The selected option (a :doc:`ESCDialogOption </api/supporting_classes/ESCDialogOption>`
) should be provided as an argument to the signal.

Additionally, these methods also need to be implemented:

* ``speedup``: Handles the player triggering the speed-up of dialog text 
  on-screen, so the text being rendered should be displayed faster.
* ``interrupt``: The event has been interrupted and the dialog should be
  concluded immediately.

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
:doc:`ESCObjectManager </api/managers/ESCObjectManager>` to get 
additional information about it, e.g. the player's  position in the room.

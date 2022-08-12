<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# EscoriaPlugin

## Method Descriptions

### register\_ui <small>(static)</small>

```gdscript
func register_ui(plugin: EditorPlugin, game_scene: String) -> bool
```

Register a user interface. This should be called in a deferred way
from the addon's _enter_tree.

#### Parameters
- plugin: the plugin that registers
- game_scene: Path to the game scene extending ESCGame

*Returns* a boolean indicating whether the ui could be successfully registered

### deregister\_ui <small>(static)</small>

```gdscript
func deregister_ui(game_scene: String)
```

Deregister a user interface

#### Parameters
- game_scene: Path to the game scene extending ESCGame

### register\_dialog\_manager <small>(static)</small>

```gdscript
func register_dialog_manager(plugin: EditorPlugin, manager_class: String) -> bool
```

Register a dialog manager addon. This should be called in a deferred way
from the addon's _enter_tree.

#### Parameters
- plugin: the plugin that registers
- manager_class: Path to the manager class script

*Returns* a boolean value indicating whether the dialog manager was registered

### deregister\_dialog\_manager <small>(static)</small>

```gdscript
func deregister_dialog_manager(manager_class: String)
```

Deregister a dialog manager addon

#### Parameters
- manager_class: Path to the manager class script
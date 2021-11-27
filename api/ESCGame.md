<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCGame

**Extends:** [Node2D](../Node2D)

## Description

A base class for ESC game scenes
An extending class can be used in the project settings and is responsible
for managing very basic game features and controls

## Enumerations

### EDITOR\_GAME\_DEBUG\_DISPLAY

```gdscript
const EDITOR_GAME_DEBUG_DISPLAY: Dictionary = {"MOUSE_TOOLTIP_LIMITS":1,"NONE":0}
```

Editor debug modes
NONE - No debugging
MOUSE_TOOLTIP_LIMITS - Visualize the tooltip limits

## Property Descriptions

### main\_menu

```gdscript
export var main_menu = ""
```

The main menu node

### pause\_menu

```gdscript
export var pause_menu = ""
```

The main menu node

### mouse\_tooltip\_margin

```gdscript
export var mouse_tooltip_margin = 50
```

The safe margin around tooltips

### editor\_debug\_mode

```gdscript
export var editor_debug_mode = 0
```

Which (if any) debug mode for the editor is used

### tooltip\_node

```gdscript
var tooltip_node: Object
```

A reference to the node handling tooltips

## Method Descriptions

### left\_click\_on\_bg

```gdscript
func left_click_on_bg(position: Vector2) -> void
```

Called when the player left clicks on the background
(Needs to be overridden, if supported)

#### Parameters

- position: Position clicked

### right\_click\_on\_bg

```gdscript
func right_click_on_bg(position: Vector2) -> void
```

Called when the player right clicks on the background
(Needs to be overridden, if supported)

#### Parameters

- position: Position clicked

### left\_double\_click\_on\_bg

```gdscript
func left_double_click_on_bg(position: Vector2) -> void
```

Called when the player double clicks on the background
(Needs to be overridden, if supported)

#### Parameters

- position: Position clicked

### element\_focused

```gdscript
func element_focused(element_id: String) -> void
```

Called when an element in the scene was focused
(Needs to be overridden, if supported)

#### Parameters

- element_id: Global id of the element focused

### element\_unfocused

```gdscript
func element_unfocused() -> void
```

Called when no element is focused anymore
(Needs to be overridden, if supported)

### left\_click\_on\_item

```gdscript
func left_click_on_item(item_global_id: String, event: InputEvent) -> void
```

Called when an item was left clicked
(Needs to be overridden, if supported)

#### Parameters

- item_global_id: Global id of the item that was clicked
- event: The received input event

### right\_click\_on\_item

```gdscript
func right_click_on_item(item_global_id: String, event: InputEvent) -> void
```

Called when an item was right clicked
(Needs to be overridden, if supported)

#### Parameters

- item_global_id: Global id of the item that was clicked
- event: The received input event

### left\_double\_click\_on\_item

```gdscript
func left_double_click_on_item(item_global_id: String, event: InputEvent) -> void
```

### left\_click\_on\_inventory\_item

```gdscript
func left_click_on_inventory_item(inventory_item_global_id: String, event: InputEvent) -> void
```

### right\_click\_on\_inventory\_item

```gdscript
func right_click_on_inventory_item(inventory_item_global_id: String, event: InputEvent) -> void
```

### left\_double\_click\_on\_inventory\_item

```gdscript
func left_double_click_on_inventory_item(inventory_item_global_id: String, event: InputEvent) -> void
```

### inventory\_item\_focused

```gdscript
func inventory_item_focused(inventory_item_global_id: String) -> void
```

Called when an inventory item was focused
(Needs to be overridden, if supported)

#### Parameters

- inventory_item_global_id: Global id of the inventory item that was focused

### inventory\_item\_unfocused

```gdscript
func inventory_item_unfocused() -> void
```

Called when no inventory item is focused anymore
(Needs to be overridden, if supported)

### open\_inventory

```gdscript
func open_inventory()
```

Called when the inventory was opened
(Needs to be overridden, if supported)

### close\_inventory

```gdscript
func close_inventory()
```

Called when the inventory was closed
(Needs to be overridden, if supported)

### mousewheel\_action

```gdscript
func mousewheel_action(direction: int)
```

Called when the mousewheel was used
(Needs to be overridden, if supported)

#### Parameter

- direction: The direction in which the mouse wheel was rotated

### hide\_ui

```gdscript
func hide_ui()
```

Called when the UI should be hidden
(Needs to be overridden, if supported)

### show\_ui

```gdscript
func show_ui()
```

Called when the UI should be shown
(Needs to be overridden, if supported)

### pause\_game

```gdscript
func pause_game()
```

Pauses the game. Reimplement to eventually show a specific UI.

### unpause\_game

```gdscript
func unpause_game()
```

Unpause the game. Reimplement to eventually hide a specific UI.

### show\_main\_menu

```gdscript
func show_main_menu()
```

 Shows the main menu. Reimplement to show a specific UI.

### hide\_main\_menu

```gdscript
func hide_main_menu()
```

Hides the main menu. Reimplement to hide a specific UI.

### show\_crash\_popup

```gdscript
func show_crash_popup(files: Array) -> var
```

Shows the crash popup when a crash occurs

#### Parameters

- files: Array of strings containing the paths to the files generated on crash

## Signals

- signal crash_popup_confirmed(): Emitted when the user has confirmed the crash popup

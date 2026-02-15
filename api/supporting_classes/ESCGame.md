
  (ESCGame)=
# ESCGame

**Extends:** {ref}`Node2D <Node2D>`
        
## Description

Base class for ESC game scenes An extending class can be used in the project settings and is responsible for managing very basic game features and controls



## Constants

### NONE
```gdscript
const NONE = 0 # enum "EDITOR\_GAME\_DEBUG\_DISPLAY"

```

### MOUSE\_TOOLTIP\_LIMITS
```gdscript
const MOUSE_TOOLTIP_LIMITS = 1 # enum "EDITOR\_GAME\_DEBUG\_DISPLAY"

```

## Members
    
### main\_menu

```gdscript
var main_menu: NodePath
```

Main menu node
    
### pause\_menu

```gdscript
var pause_menu: NodePath
```

Pause menu node
    
### mouse\_tooltip\_margin

```gdscript
var mouse_tooltip_margin: float
```

The safe margin around tooltips
    
### editor\_debug\_mode

```gdscript
var editor_debug_mode: int
```

Debug mode for the editor (None, Mouse Tooltips Limit)
    
### ui\_parent\_control\_node

```gdscript
var ui_parent_control_node: NodePath
```

The Control node underneath which all UI must be placed. This should be a Control node and NOT a CanvasLayer (or any other type of) node.
    
### tooltip\_node

```gdscript
var tooltip_node: Object
```

Reference to the node handling tooltips
    
### room\_ready\_for\_inputs

```gdscript
var room_ready_for_inputs: bool
```

Boolean indicating whether the game scene is ready to accept inputs from the player. This enables using escoria.is_ready_for_inputs() in _input() function of game.gd script.
    
### hover\_stack\_displayer

```gdscript
var hover_stack_displayer: Node
```

Displayer node for hover stack debugging

## Signals

### crash\_popup\_confirmed

```gdscript
signal crash_popup_confirmed()
```

Signal emitted when the user has confirmed the crash popup

#### Parameters

None. 


### request\_pause\_menu

```gdscript
signal request_pause_menu()
```

Signal emitted when pause menu has to be displayed

#### Parameters

None. 


## Methods
    
% ...
---
### initialize\_esc\_game

```gdscript
func initialize_esc_game() -> void
```

Method initializing the Escoria game: connects some signals from managers, setups some UI nodes.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### clear\_tooltip

```gdscript
func clear_tooltip() -> void
```

Clears the tooltip content (if an ESCTooltip node exists in UI)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### do\_walk

```gdscript
func do_walk(destination: Variant, params: Array, can_interrupt: bool) -> void
```

Sets up and performs default walking action.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|destination|`Variant`|Destination to walk to|yes|
|params|`Array`|Parameters for the action|no|
|can_interrupt|`bool`|if true, this command will interrupt any ongoing event|no|

#### Returns

Returns nothing.
    
% ...
---
### hovered\_bg

```gdscript
func hovered_bg() -> void
```

Called when a mouse motion happens on the background.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### left\_click\_on\_bg

```gdscript
func left_click_on_bg(position: Vector2) -> void
```

Called when the player left clicks on the background. (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|position|`Vector2`|clicked position|yes|

#### Returns

Returns nothing.
    
% ...
---
### right\_click\_on\_bg

```gdscript
func right_click_on_bg(position: Vector2) -> void
```

Called when the player right clicks on the background. (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|position|`Vector2`|clicked position|yes|

#### Returns

Returns nothing.
    
% ...
---
### left\_double\_click\_on\_bg

```gdscript
func left_double_click_on_bg(position: Vector2) -> void
```

Called when the player double clicks on the background. (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|position|`Vector2`|clicked position|yes|

#### Returns

Returns nothing.
    
% ...
---
### element\_focused

```gdscript
func element_focused(element_id: String) -> void
```

Called when an element in the scene was focused. (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|element_id|`String`|Global id of the focused element|yes|

#### Returns

Returns nothing.
    
% ...
---
### element\_unfocused

```gdscript
func element_unfocused() -> void
```

Called when no element is focused anymore (Needs to be overridden, if supported)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### left\_click\_on\_item

```gdscript
func left_click_on_item(item_global_id: String, event: InputEvent) -> void
```

Called when an item was left clicked. (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item_global_id|`String`|Global id of the item that was clicked|yes|
|event|`InputEvent`|The received input event|yes|

#### Returns

Returns nothing.
    
% ...
---
### right\_click\_on\_item

```gdscript
func right_click_on_item(item_global_id: String, event: InputEvent) -> void
```

Called when an item was right clicked. (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item_global_id|`String`|Global id of the item that was clicked|yes|
|event|`InputEvent`|The received input event|yes|

#### Returns

Returns nothing.
    
% ...
---
### left\_double\_click\_on\_item

```gdscript
func left_double_click_on_item(item_global_id: String, event: InputEvent) -> void
```

Called when an item was double clicked (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item_global_id|`String`|Global id of the item that was clicked|yes|
|event|`InputEvent`|The received input event|yes|

#### Returns

Returns nothing.
    
% ...
---
### left\_click\_on\_inventory\_item

```gdscript
func left_click_on_inventory_item(inventory_item_global_id: String, event: InputEvent) -> void
```

Called when an inventory item was left clicked (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|inventory_item_global_id|`String`|Global id of the inventory item was clicked|yes|
|event|`InputEvent`|The received input event|yes|

#### Returns

Returns nothing.
    
% ...
---
### right\_click\_on\_inventory\_item

```gdscript
func right_click_on_inventory_item(inventory_item_global_id: String, event: InputEvent) -> void
```

Called when an inventory item was right clicked. (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|inventory_item_global_id|`String`|Global id of the inventory item was clicked|yes|
|event|`InputEvent`|The received input event|yes|

#### Returns

Returns nothing.
    
% ...
---
### left\_double\_click\_on\_inventory\_item

```gdscript
func left_double_click_on_inventory_item(inventory_item_global_id: String, event: InputEvent) -> void
```

Called when an inventory item was double clicked. (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|inventory_item_global_id|`String`|Global id of the inventory item was clicked|yes|
|event|`InputEvent`|The received input event|yes|

#### Returns

Returns nothing.
    
% ...
---
### inventory\_item\_focused

```gdscript
func inventory_item_focused(inventory_item_global_id: String) -> void
```

Called when an inventory item was focused. (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|inventory_item_global_id|`String`|Global id of the inventory item that was focused|yes|

#### Returns

Returns nothing.
    
% ...
---
### inventory\_item\_unfocused

```gdscript
func inventory_item_unfocused() -> void
```

Called when no inventory item is focused anymore. (Needs to be overridden, if supported)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### open\_inventory

```gdscript
func open_inventory() -> void
```

Called when the inventory was opened. (Needs to be overridden, if supported)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### close\_inventory

```gdscript
func close_inventory() -> void
```

Called when the inventory was closed. (Needs to be overridden, if supported)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### mousewheel\_action

```gdscript
func mousewheel_action(direction: int) -> void
```

Called when the mousewheel was used. (Needs to be overridden, if supported)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|direction|`int`|The direction in which the mouse wheel was rotated|yes|

#### Returns

Returns nothing.
    
% ...
---
### hide\_ui

```gdscript
func hide_ui() -> void
```

Called when the UI should be hidden. (Needs to be overridden, if supported)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### show\_ui

```gdscript
func show_ui() -> void
```

Called when the UI should be shown. (Needs to be overridden, if supported)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### pause\_game

```gdscript
func pause_game() -> void
```

Pauses the game. (Needs to be overridden, if supported)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### unpause\_game

```gdscript
func unpause_game() -> void
```

Unpauses the game. (Needs to be overridden, if supported)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### show\_main\_menu

```gdscript
func show_main_menu() -> void
```

Shows the main menu. (Needs to be overridden, if supported)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### hide\_main\_menu

```gdscript
func hide_main_menu() -> void
```

Hides the main menu. (Needs to be overridden, if supported)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### apply\_custom\_settings

```gdscript
func apply_custom_settings(custom_settings: Dictionary) -> void
```

Custom function that is meant to apply custom settings. Called right after Escoria settings file was loaded.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|custom_settings|`Dictionary`|dictionary containing the custom settings.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_custom\_data

```gdscript
func get_custom_data() -> Dictionary
```

Custom function automatically called when save game is created. game file.

#### Parameters

None. 
#### Returns

Returns a `Dictionary` value. (`Dictionary`)
    
% ...
---
### show\_crash\_popup

```gdscript
func show_crash_popup(files: Array) -> void
```

Shows the crash popup when a crash occurs.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|files|`Array`|Array of strings containing the paths to the files generated on crash|no|

#### Returns

Returns nothing.
    
% ...
---
### escoria\_hide\_ui

```gdscript
func escoria_hide_ui() -> void
```

*** FOR USE BY ESCORIA CORE ONLY *** Hides everything under the UI Control node.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### escoria\_show\_ui

```gdscript
func escoria_show_ui() -> void
```

*** FOR USE BY ESCORIA CORE ONLY *** Show everything under the UI Control node.

#### Parameters

None. 
#### Returns

Returns nothing.


  (ESCInputsManager)=
# ESCInputsManager

**Extends:** {ref}`Resource <Resource>`
        
## Description

Escoria inputs manager

Catches, handles and distributes input events for the game. 

## Constants

### INPUT\_ALL
```gdscript
const INPUT_ALL = 0 # enum

```

### INPUT\_NONE
```gdscript
const INPUT_NONE = 1 # enum

```

### INPUT\_SKIP
```gdscript
const INPUT_SKIP = 2 # enum

```

### ESC\_SHOW\_DEBUG\_PROMPT
```gdscript
const ESC_SHOW_DEBUG_PROMPT = "esc_show_debug_prompt"

```
Input action for use by InputMap
### ESC\_UI\_PRIMARY\_ACTION
```gdscript
const ESC_UI_PRIMARY_ACTION = "esc_ui_primary_action"

```
Input action for use by InputMap that represents a "primary action" from an input device, such as a left-click on a mouse or the X button on an XBox controller
## Members
    
### input\_mode

```gdscript
var input_mode: Variant
```

The current input mode
    
### hover\_stack

```gdscript
var hover_stack: ESCInputsManager.HoverStack
```

A LIFO stack of hovered items
    
### hotspot\_focused

```gdscript
var hotspot_focused: String
```

The global id of the topmost item from the hover_stack
    
### custom\_input\_handler

```gdscript
var custom_input_handler: Variant
```

Function reference that can be used to intercept and process input events. If set, this function must have the following signature:

(event: InputEvent, is_default_state: bool) -> bool

#### Parameters

- event: The event to process
- is_default_state: Whether the current state is escoria.GameState.DEFAULT

**Returns** Whether the function processed the event.

## Methods
    
% ...
---
### register\_core

```gdscript
func register_core() -> void
```

Register core signals (from escoria.gd)

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### register\_inventory\_item

```gdscript
func register_inventory_item(item: Node) -> void
```

Connect the item signals to the local methods.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`Node`|The inventory item node to register.|yes|

#### Returns

Returns nothing.
    
% ...
---
### register\_background

```gdscript
func register_background(background: ESCBackground) -> void
```

Connect background signals to local methods.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|background|`ESCBackground`|The background to register.|yes|

#### Returns

Returns nothing.
    
% ...
---
### register\_custom\_input\_handler

```gdscript
func register_custom_input_handler(callback: Variant) -> void
```

Registers a function that can be used to intercept and process input events. `callback` must have the following signature: (event: InputEvent, is_default_state: bool) -> bool ...where:

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|callback|`Variant`|Function reference satisfying the above contract event The event to process is_default_state Whether the current state is escoria.GameState.DEFAULT returns whether the function processed the event `callback` is responsible for calling `get_tree().set_input_as_handled()`, if appropriate.|yes|

#### Returns

Returns nothing.
    
% ...
---
### try\_custom\_input\_handler

```gdscript
func try_custom_input_handler(event: InputEvent, is_default_state: bool) -> bool
```

If a callback was specified via `register_custom_input_handler()`, forwards the event to the callback and returns its result; otherwise,

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|event|`InputEvent`|The event to process|yes|
|is_default_state|`bool`|Whether the current state is escoria.GameState.DEFAULT|yes|

#### Returns

Returns `false`. (`bool`)
    
% ...
---
### set\_hovered\_node

```gdscript
func set_hovered_node(item: ESCItem) -> bool
```

Sets the hovered node and calls its mouse_entered() method if it was the top most item in hover_stack.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`ESCItem`|the item that was focused (mouse_entered)|yes|

#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### unset\_hovered\_node

```gdscript
func unset_hovered_node(item: ESCItem) -> void
```

Unsets the hovered node.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`ESCItem`|the item that was unfocused (mouse_exited)|yes|

#### Returns

Returns nothing.
    
% ...
---
### on\_item\_non\_interactive

```gdscript
func on_item_non_interactive(item: ESCItem) -> void
```

Function called when the item is set to non-interactive, to re-trigger an input on underlying item.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`ESCItem`|The `ESCItem` that was set non-interactive|yes|

#### Returns

Returns nothing.

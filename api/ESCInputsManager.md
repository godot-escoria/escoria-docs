<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCInputsManager

**Extends:** [Resource](../Resource)

## Description

Escoria inputs manager
Catches, handles and distributes input events for the game

## Constants Descriptions

### ESC\_SHOW\_DEBUG\_PROMPT

```gdscript
const ESC_SHOW_DEBUG_PROMPT: String = "esc_show_debug_prompt"
```

Input action for use by InputMap

### ESC\_UI\_PRIMARY\_ACTION

```gdscript
const ESC_UI_PRIMARY_ACTION: String = "esc_ui_primary_action"
```

Input action for use by InputMap that represents a "primary action" from an
input device, such as a left-click on a mouse or the X button on an XBox
controller

### INPUT\_ALL

```gdscript
const INPUT_ALL: int = 0
```

### INPUT\_NONE

```gdscript
const INPUT_NONE: int = 1
```

### INPUT\_SKIP

```gdscript
const INPUT_SKIP: int = 2
```

### SWITCH\_ACTION\_VERB

```gdscript
const SWITCH_ACTION_VERB: String = "switch_action_verb"
```

Input action for use by InputMap

## Property Descriptions

### input\_mode

```gdscript
var input_mode
```

The current input mode

### hover\_stack

```gdscript
var hover_stack: Array
```

A LIFO stack of hovered items

### hotspot\_focused

```gdscript
var hotspot_focused: String = ""
```

The global id of the topmost item from the hover_stack

### custom\_input\_handler

```gdscript
var custom_input_handler
```

Function reference that can be used to intercept and process input events.
If set, this function must have the following signature:

(event: InputEvent, is_default_state: bool) -> bool

#### Parameters

- event: The event to process
- is_default_state: Whether the current state is escoria.GAME_STATE.DEFAULT

**Returns** Whether the function processed the event.

## Method Descriptions

### register\_core

```gdscript
func register_core()
```

Register core signals (from escoria.gd)

### register\_inventory\_item

```gdscript
func register_inventory_item(item: Node)
```

Connect the item signals to the local methods

### register\_background

```gdscript
func register_background(background: ESCBackground)
```

### register\_custom\_input\_handler

```gdscript
func register_custom_input_handler(callback) -> void
```

Registers a function that can be used to intercept and process input events.
`callback` must have the following signature:

(event: InputEvent, is_default_state: bool) -> bool

where

- event: The event to process
- is_default_state: Whether the current state is escoria.GAME_STATE.DEFAULT
- returns whether the function processed the event

`callback` is responsible for calling `get_tree().set_input_as_handled()`,
if appropriate.

#### Parameters
- callback: Function reference satisfying the above contract

### try\_custom\_input\_handler

```gdscript
func try_custom_input_handler(event: InputEvent, is_default_state: bool) -> bool
```

If a callback was specified via `register_custom_input_handler()`,
forwards the event to the callback and returns its result; otherwise,
returns `false`.

#### Parameters

- event: The event to process
- is_default_state: Whether the current state is escoria.GAME_STATE.DEFAULT

**Returns** Result of `custom_input_handler` if set; otherwise, `false`

### clear\_stack

```gdscript
func clear_stack()
```

Clear the stack of hovered items
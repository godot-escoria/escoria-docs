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

### unset\_hovered\_node

```gdscript
func unset_hovered_node(item: ESCItem)
```

Unsets the hovered node.

**Parameters**

- item: the item that was unfocused (mouse_exited)

### set\_hovered\_node

```gdscript
func set_hovered_node(item: ESCItem) -> bool
```

Sets the hovered node and calls its mouse_entered() method if it was the top
most item in hover_stack.

#### Parameters

- item: the item that was focused (mouse_entered)

**Returns**
True if item is the new top hovered object

### on\_item\_non\_interactive

```gdscript
func on_item_non_interactive(item: ESCItem) -> void
```

Function called when the item is set interactive, to re-trigger an input on
underlying item.

#### Parameters

- item: The ESCCItem that was set non-interactive

### hover\_stack\_add\_item

```gdscript
func hover_stack_add_item(item)
```

Add the given item to the stack if not already in it.

#### Parameters
- item: the item to add to the hover stack

### hover\_stack\_add\_items

```gdscript
func hover_stack_add_items(items: Array)
```

Add the items contained in given list to the stack if not already in it.

#### Parameters
- items: the items list (array) to add to the hover stack

### hover\_stack\_erase\_item

```gdscript
func hover_stack_erase_item(item)
```

Remove the given item from the stack

#### Parameters
- item: the item to remove from the hover stack

### hover\_stack\_clear

```gdscript
func hover_stack_clear()
```

Clear the stack of hovered items

## Sub\-classes

### HoverStackSorter

#### Method Descriptions

### sort\_ascending\_z\_index <small>(static)</small>

```gdscript
func sort_ascending_z_index(a, b)
```


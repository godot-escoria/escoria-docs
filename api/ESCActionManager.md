<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCActionManager

**Extends:** [Resource](../Resource)

## Description

Manages currently carried out actions

## Enumerations

### ACTION\_INPUT\_STATE

```gdscript
const ACTION_INPUT_STATE: Dictionary = {"AWAITING_ITEM":1,"AWAITING_TARGET_ITEM":2,"AWAITING_VERB":3,"AWAITING_VERB_CONFIRMATION":4,"AWAITING_VERB_OR_ITEM":0,"COMPLETED":5}
```

States of the action input (verb, item, target)
(I) -> AWAITING_VERB_OR_ITEM -> AWAITING_ITEM -> COMPLETED -> (E)
or
(I) -> AWAITING_VERB_OR_ITEM -> AWAITING_ITEM -> AWAITING_TARGET_ITEM -> COMPLETED -> (E)
or
(I) -> AWAITING_VERB_OR_ITEM -> AWAITING_VERB -> AWAITING_VERB_CONFIRMATION -> COMPLETED -> (E)

### ACTION

```gdscript
const ACTION: Dictionary = {"BACKGROUND_CLICK":0,"ITEM_LEFT_CLICK":1,"ITEM_RIGHT_CLICK":2,"TRIGGER_IN":3,"TRIGGER_OUT":4}
```

Actions understood by the do(...) method
* BACKGROUND_CLICK: Object is to move from its current position
* ITEM_LEFT_CLICK: Item has been clicked on with LMB.
* ITEM_RIGHT_CLICK: Item has been clicked on with RMB.
* TRIGGER_IN: Character has moved into a trigger area.
* TRIGGER_OUT: Character has moved out of a trigger area.

## Constants Descriptions

### ACTION\_ARRIVED

```gdscript
const ACTION_ARRIVED: String = "arrived"
```

Basic required internal actions

### ACTION\_EXIT\_SCENE

```gdscript
const ACTION_EXIT_SCENE: String = "exit_scene"
```

### ACTION\_WALK

```gdscript
const ACTION_WALK: String = "walk"
```

## Property Descriptions

### current\_action

```gdscript
var current_action: String = ""
```

- **Setter**: `set_current_action`

Current verb used

### current\_tool

```gdscript
var current_tool: ESCObject
```

Current tool (ESCItem/ESCInventoryItem) used

### current\_target

```gdscript
var current_target: ESCObject
```

Current target where the tool is being used on/with (if any)

### action\_state

```gdscript
var action_state
```

- **Setter**: `set_action_input_state`

Current action input state

## Method Descriptions

### do

```gdscript
func do(action: int, params: Array, can_interrupt: bool = false) -> void
```

Run a generic action

#### Parameters

- action: type of the action to run
- params: Parameters for the action
- can_interrupt: if true, this command will interrupt any ongoing event
before it is finished

### set\_action\_input\_state

```gdscript
func set_action_input_state(p_state)
```

Sets the current state of action input.

## Parameters
- p_state: the action input state to set

### set\_current\_action

```gdscript
func set_current_action(action: String)
```

Set the current action verb

## Parameters
- action: The action verb to set

### clear\_current\_action

```gdscript
func clear_current_action()
```

Clear the current action

### clear\_current\_tool

```gdscript
func clear_current_tool()
```

Clear the current tool

### perform\_walk

```gdscript
func perform_walk(moving_obj: ESCObject, destination, is_fast: bool = false)
```

### perform\_inputevent\_on\_object

```gdscript
func perform_inputevent_on_object(obj: ESCObject, event: InputEvent, default_action: bool = false)
```

### is\_object\_actionable

```gdscript
func is_object_actionable(global_id: String) -> bool
```

Determines whether the object in question can be acted upon.

#### Parameters

- global_id: the global ID of the item to examine

*Returns* True iff the item represented by global_id can be acted upon.

## Signals

- signal action_changed(): The current action verb was changed
- signal action_finished(): Emitted, when an action has been completed
- signal action_input_state_changed(): Emitted when the action input state has changed

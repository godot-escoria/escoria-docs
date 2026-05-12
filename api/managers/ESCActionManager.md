
  (ESCActionManager)=
# ESCActionManager

**Extends:** {ref}`Resource <Resource>`
        
## Description

Manages actions currently being carried out. 



## Constants

### AWAITING\_VERB\_OR\_ITEM
```gdscript
const AWAITING_VERB_OR_ITEM = 0 # enum "ActionInputState"

```
Initial state
### AWAITING\_ITEM
```gdscript
const AWAITING_ITEM = 1 # enum "ActionInputState"

```
After initial state, verb is defined
### AWAITING\_TARGET\_ITEM
```gdscript
const AWAITING_TARGET_ITEM = 2 # enum "ActionInputState"

```
Item defined requires a target object
### AWAITING\_VERB
```gdscript
const AWAITING_VERB = 3 # enum "ActionInputState"

```
After initial state, item is defined
### AWAITING\_VERB\_CONFIRMATION
```gdscript
const AWAITING_VERB_CONFIRMATION = 4 # enum "ActionInputState"

```
Item was defined first, next verb, need verb confirmation
### COMPLETED
```gdscript
const COMPLETED = 5 # enum "ActionInputState"

```
Final state
### BACKGROUND\_CLICK
```gdscript
const BACKGROUND_CLICK = 0 # enum "ACTION"

```

### ITEM\_LEFT\_CLICK
```gdscript
const ITEM_LEFT_CLICK = 1 # enum "ACTION"

```

### ITEM\_RIGHT\_CLICK
```gdscript
const ITEM_RIGHT_CLICK = 2 # enum "ACTION"

```

### TRIGGER\_IN
```gdscript
const TRIGGER_IN = 3 # enum "ACTION"

```

### TRIGGER\_OUT
```gdscript
const TRIGGER_OUT = 4 # enum "ACTION"

```

### ESCPlayer
```gdscript
const ESCPlayer = <Object>

```
ESCPlayer resource
### ACTION\_ARRIVED
```gdscript
const ACTION_ARRIVED = "arrived"

```
Action (event) triggered when a character has reached a destination.
### ACTION\_EXIT\_SCENE
```gdscript
const ACTION_EXIT_SCENE = "exit_scene"

```
Action (event) triggered when a scene is being exited.
### ACTION\_WALK
```gdscript
const ACTION_WALK = "walk"

```
Action (event) triggered when a character is walking.
## Members
    
### current\_action

```gdscript
var current_action: String
```

Current verb used.
    
### current\_tool

```gdscript
var current_tool: ESCObject
```

Current tool (`ESCItem`/`ESCInventoryItem`) used.
    
### current\_target

```gdscript
var current_target: ESCObject
```

Current target where the tool is being used on/with (if any).
    
### action\_state

```gdscript
var action_state: Variant
```

Current action input state.

## Signals

### action\_changed

```gdscript
signal action_changed()
```

The current action verb was changed.

#### Parameters

None. 


### action\_finished

```gdscript
signal action_finished()
```

Emitted when an action has been completed.

#### Parameters

None. 


### action\_input\_state\_changed

```gdscript
signal action_input_state_changed()
```

Emitted when the action input state has changed.

#### Parameters

None. 


## Methods
    
% ...
---
### do

```gdscript
func do(action: int, params: Array, can_interrupt: bool) -> void
```

Runs a generic action.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|action|`int`|type of the action to run|yes|
|params|`Array`|Parameters for the action|no|
|can_interrupt|`bool`|if true, this command will interrupt any ongoing event before it is finished BACKGROUND_CLICK [moving_obj, target, walk_fast] ITEM_LEFT_CLICK [item, input_event] ITEM_RIGHT_CLICK [item, input_event] TRIGGER_IN [trigger_id, object_id, trigger_in_verb] TRIGGER_OUT [trigger_id, object_id, trigger_out_verb]|no|

#### Returns

Returns nothing.
    
% ...
---
### set\_action\_input\_state

```gdscript
func set_action_input_state(p_state: Variant) -> void
```

Sets the current state of action input. ## Parameters

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_state|`Variant`|the action input state to set|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_current\_action

```gdscript
func set_current_action(action: String) -> void
```

Sets the current action verb. 
#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|action|`String`|the action verb to set|yes|

#### Returns

Returns nothing.
    
% ...
---
### clear\_current\_action

```gdscript
func clear_current_action() -> void
```

Clears the current action.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### clear\_current\_tool

```gdscript
func clear_current_tool() -> void
```

Clears the current tool.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### perform\_walk

```gdscript
func perform_walk(moving_obj: ESCObject, destination: Variant, is_fast: bool) -> void
```

Makes an object walk to a destination. This can be either a 2D position or another object.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|moving_obj|`ESCObject`|Escoria object that should move toward the destination.|yes|
|destination|`Variant`|Either a `Vector2` position or an `ESCObject` whose location is targeted.|yes|
|is_fast|`bool`|Whether to use the object's fast movement speed when walking.|no|

#### Returns

Returns nothing.
    
% ...
---
### perform\_inputevent\_on\_object

```gdscript
func perform_inputevent_on_object(obj: ESCObject, event: InputEvent, default_action: bool) -> void
```

Event handler called when an object/item is clicked.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|obj|`ESCObject`|Object that was left clicked.|yes|
|event|`InputEvent`|Input event that was received.|yes|
|default_action|`bool`|If `true`, run the inventory default action.|no|

#### Returns

Returns nothing.
    
% ...
---
### is\_object\_actionable

```gdscript
func is_object_actionable(global_id: String) -> bool
```

Determines whether the object in question can be acted upon.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|global_id|`String`|The global ID of the item to examine.|yes|

#### Returns

Returns a `bool` value. (`bool`)


  (ESCEventManager)=
# ESCEventManager

**Extends:** {ref}`Node <Node>`
        
## Description

Manager for running events.

There are different "channels" an event can run on. The usual events happen in the foreground channel _front, but additional event queues can be added as required. Additionally, events can be scheduled to be queued in the future. 

## Constants

### EVENT\_PRINT
```gdscript
const EVENT_PRINT = "print"

```
Used for local processing.
### EVENT\_EXIT\_SCENE
```gdscript
const EVENT_EXIT_SCENE = "exit_scene"

```
Used for local processing.
### EVENT\_INIT
```gdscript
const EVENT_INIT = "init"

```
Used for local processing.
### EVENT\_LOAD
```gdscript
const EVENT_LOAD = "load"

```
Used for local processing.
### EVENT\_RESUME
```gdscript
const EVENT_RESUME = "resume"

```
Used for local processing.
### EVENT\_NEW\_GAME
```gdscript
const EVENT_NEW_GAME = "newgame"

```
Used for local processing.
### EVENT\_READY
```gdscript
const EVENT_READY = "ready"

```
Used for local processing.
### EVENT\_SETUP
```gdscript
const EVENT_SETUP = "setup"

```
Used for local processing.
### EVENT\_TRANSITION\_IN
```gdscript
const EVENT_TRANSITION_IN = "transition_in"

```
Used for local processing.
### EVENT\_TRANSITION\_OUT
```gdscript
const EVENT_TRANSITION_OUT = "transition_out"

```
Used for local processing.
### EVENT\_CANT\_REACH
```gdscript
const EVENT_CANT_REACH = "cant_reach"

```
Used for local processing.
### REQUIRED\_EVENTS
```gdscript
const REQUIRED_EVENTS = ["init", "newgame"]

```
Events that MUST exist in order for Escoria to run properly.
### CHANNEL\_FRONT
```gdscript
const CHANNEL_FRONT = "_front"

```
The primary channel for running events.
## Members
    
### scheduled\_events

```gdscript
var scheduled_events: Array
```

A list of currently scheduled events.
    
### events\_queue

```gdscript
var events_queue: Dictionary
```

A list of constantly running events, possibly in multiple background channels.

## Signals

### event\_started

```gdscript
signal event_started(event_name: Variant)
```

Emitted when the event has begun execution.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|event_name|`Variant`|Name of the event whose execution has started.|yes|



### background\_event\_started

```gdscript
signal background_event_started(channel_name: Variant, event_name: Variant)
```

Emitted when an event is started in a channel of the background queue.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|channel_name|`Variant`|Name of the background channel where the event runs.|yes|
|event_name|`Variant`|Name of the event that began on the background channel.|yes|



### event\_finished

```gdscript
signal event_finished(return_code: Variant, event_name: Variant)
```

Emitted when the event has finished running.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|return_code|`Variant`|Execution result returned by the event.|yes|
|event_name|`Variant`|Name of the event that just finished.|yes|



### background\_event\_finished

```gdscript
signal background_event_finished(return_code: Variant, event_name: Variant, channel_name: Variant)
```

Emitted when a background event has finished.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|return_code|`Variant`|Execution result returned by the background event.|yes|
|event_name|`Variant`|Name of the background event that finished.|yes|
|channel_name|`Variant`|Background channel where the event finished.|yes|



## Methods
    
% ...
---
### queue\_event\_from\_esc

```gdscript
func queue_event_from_esc(script_object: ESCScript, event: String, channel: String, block: bool) -> int
```

Queues a new event based on input from an ASHES command, most likely `queue_event`.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|script_object|`ESCScript`|Compiled script object, i.e. the one with the event to queue.|yes|
|event|`String`|Name of the event to queue.|yes|
|channel|`String`|Channel to run the event on (default: `_front`).|yes|
|block|`bool`|Whether to wait for the queue to finish. This is only possible, if the queued event is not to be run on the same event as this command (default: `false`).|yes|

#### Returns

Returns a `int` value. (`int`)
    
% ...
---
### queue\_event

```gdscript
func queue_event(event: ESCGrammarStmts.Event, force: bool, as_first: Variant) -> void
```

Queues a new event to run in the foreground.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|event|`ESCGrammarStmts.Event`|The event to run.|yes|
|force|`bool`|(optional) Events won't normally queue during scene changes. This parameter overrides that behaviour.|no|
|as_first|`Variant`|(optional) Put the event at the head of the queue.|no|

#### Returns

Returns nothing.
    
% ...
---
### schedule\_event

```gdscript
func schedule_event(event: ESCGrammarStmts.Event, timeout: float, object: String) -> void
```

Schedules an event to run after a timeout.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|event|`ESCGrammarStmts.Event`|The event to run.|yes|
|timeout|`float`|Number of seconds to wait before adding the event to the front queue.|yes|
|object|`String`|The target object.|yes|

#### Returns

Returns nothing.
    
% ...
---
### queue\_background\_event

```gdscript
func queue_background_event(channel_name: String, event: ESCGrammarStmts.Event) -> void
```

Queues an event to run in a background channel.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|channel_name|`String`|The name of the channel to use.|yes|
|event|`ESCGrammarStmts.Event`|The event to run; must be of type `ESCGrammarEvents.Event`.|yes|

#### Returns

Returns nothing.
    
% ...
---
### interrupt

```gdscript
func interrupt(exceptions: PackedStringArray, stop_walking: Variant) -> void
```

Interrupts the events currently running and any that are pending.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|exceptions|`PackedStringArray`|An optional list of events which should be left running or queued.|no|
|stop_walking|`Variant`|boolean value (default true) determining whether the player (if any) has to be interrupted walking or not.|no|

#### Returns

Returns nothing.
    
% ...
---
### interrupt\_channel

```gdscript
func interrupt_channel(channel_name: String) -> void
```

Interrupts any events in the specified channel.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|channel_name|`String`|The name of the channel containing the events to be interrupted.|yes|

#### Returns

Returns nothing.
    
% ...
---
### clear\_event\_queue

```gdscript
func clear_event_queue() -> void
```

Clears the event queues.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### is\_channel\_free

```gdscript
func is_channel_free(name: String) -> bool
```

Checks whether a channel is free to run more events.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Name of the channel to inspect.|yes|

#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### get\_running\_event

```gdscript
func get_running_event(name: String) -> ESCGrammarStmts.Event
```

Gets the currently running event in a channel. `null` if there is none.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Name of the channel whose running event should be returned.|yes|

#### Returns

Returns a `ESCGrammarStmts.Event` value. (`ESCGrammarStmts.Event`)
    
% ...
---
### set\_changing\_scene

```gdscript
func set_changing_scene(p_is_changing_scene: bool) -> void
```

Setter for _changing_scene.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_is_changing_scene|`bool`|New value indicating whether a scene transition is currently running.|yes|

#### Returns

Returns nothing.
    
% ...
---
### add\_running\_command

```gdscript
func add_running_command(command: ESCCommand) -> void
```

Adds a currently-running command to the current channel.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command|`ESCCommand`|The `ESCCommand` to be added to the current channel.|yes|

#### Returns

Returns nothing.
    
% ...
---
### running\_command\_finished

```gdscript
func running_command_finished(command: ESCCommand) -> void
```

Removes the specified command from the current channel.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command|`ESCCommand`|The `ESCCommand` to be removed from the current channel.|yes|

#### Returns

Returns nothing.
    
% ...
---
### save\_game

```gdscript
func save_game(p_savegame: ESCSaveGame) -> void
```

Save the running event in the savegame, if any.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_savegame|`ESCSaveGame`|`ESCSaveGame` resource that holds all save data.|yes|

#### Returns

Returns nothing.

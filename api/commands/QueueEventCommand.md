
  (QueueEventCommand)=
# QueueEventCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`queue_event(object: String, event: String[, channel: String[, block: Boolean]])`

Queue an event to run. If you queue multiple events on a channel and none of them are blocking events, all events will effectively run at the same time. As the events are placed on the channel's queue, if one event contains a blocking command, the next event on that channel's queue won't be processed until the blocking command finishes.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`String`|Object that holds the ESC script with the event|yes|
|event|`String`|Name of the event to queue|yes|
|channel|`String`|Channel to run the event on (default: `_front`). Using a previously unused channel name will create a new channel.|no|
|block|`Boolean`|Whether to wait for the queue to finish. This is only possible, if the queued event is not to be run on the same event as this command (default: `false`)|no|

 

## Methods
    
% ...
---
### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

The descriptor of the arguments of this command.

#### Parameters

None. 
#### Returns

Returns the descriptor of the arguments of this command. The argument descriptor for this command. (`ESCCommandArgumentDescriptor`)
    
% ...
---
### validate

```gdscript
func validate(arguments: Array) -> Variant
```

Validates whether the given arguments match the command descriptor.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|arguments|`Array`|The arguments to validate.|yes|

#### Returns

Returns True if the arguments are valid, false otherwise. (`bool`)
    
% ...
---
### run

```gdscript
func run(arguments: Array) -> int
```

Runs the command.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|arguments|`Array`|Command parameters `[global_id, event_name, channel, block]` passed to the execution.|yes|

#### Returns

Returns the execution result code. (`int`)
    
% ...
---
### interrupt

```gdscript
func interrupt() -> void
```

Function called when the command is interrupted.

#### Parameters

None. 
#### Returns

Returns nothing.

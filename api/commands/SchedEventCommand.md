
  (SchedEventCommand)=
# SchedEventCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`sched_event(time: Number, object: String, event: String)`

Schedules an event to run at a later time. If another event is already running when the scheduled event is supposed to start, execution of the scheduled event begins when the already-running event ends.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|time|`Number`|Time in seconds until the scheduled event starts|yes|
|object|`String`|Global ID of the ESCItem that holds the ESC script|yes|
|event|`String`|Name of the event to schedule|yes|

 

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
func run(command_params: Array) -> int
```

Runs the command.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command_params|`Array`|The parameters for the command.|yes|

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

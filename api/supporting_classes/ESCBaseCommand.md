
  (ESCBaseCommand)=
# ESCBaseCommand

**Extends:** {ref}`Resource <Resource>`
        
## Description

Abstract base class for every ESC command.

Extending classes have to override the configure and run function

## Members
    
### filename

```gdscript
var filename: String
```

The filename from which the relevant command is being called, if available.
    
### line\_number

```gdscript
var line_number: int
```

The line number from the file the relevant command is being called from.

## Methods
    
% ...
---
### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

A descriptor (contained in `ESCCommandArgumentDescriptor`) of the arguments of this command.

#### Parameters

None. 
#### Returns

Returns a descriptor (contained in `ESCCommandArgumentDescriptor`) of the arguments of this command. (`ESCCommandArgumentDescriptor`)
    
% ...
---
### validate

```gdscript
func validate(arguments: Array) -> bool
```

Validates whether the given arguments match the command descriptor, returning `true` iff the command's descriptor can successfully validate the arguments. Should be overridden for each command's own needs, with this method called from the child class.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|arguments|`Array`|an array containing the arguments to be passed to the command|yes|

#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### run

```gdscript
func run(_command_params: Array) -> int
```

Runs the command.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command_params|`Array`|an array containing the arguments|yes|

#### Returns

Returns a `int` value. (`int`)
    
% ...
---
### get\_command\_name

```gdscript
func get_command_name() -> String
```

The name of the command based on the script's filename.

#### Parameters

None. 
#### Returns

Returns the name of the command based on the script's filename. (`String`)
    
% ...
---
### interrupt

```gdscript
func interrupt() -> void
```

Method to be called when the command is interrupted.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### raise\_error

```gdscript
func raise_error(command: Variant, message: String) -> void
```

Sends an error to the Escoria logger.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command|`Variant`|the command object causing the error; must extend `ESCBaseCommand`.|yes|
|message|`String`|the message the logger should print to describe the error|yes|

#### Returns

Returns nothing.
    
% ...
---
### raise\_invalid\_object\_error

```gdscript
func raise_invalid_object_error(command: Variant, global_id: String) -> void
```

Raises an error specific to no object being found with `global_id` as its identifier. `command` is the actual command implementation generating the error.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command|`Variant`|the command object causing the error; must extend `ESCBaseCommand`.|yes|
|global_id|`String`|the `global_id` that could not be found|yes|

#### Returns

Returns nothing.

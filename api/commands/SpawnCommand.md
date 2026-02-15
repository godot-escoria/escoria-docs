
  (SpawnCommand)=
# SpawnCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`spawn(identifier: String, path: String[, is_active: Boolean[, position_target: String]])`

Programmatically adds a new item to the scene.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|identifier|`String`|Global ID to use for the new object|yes|
|path|`String`|Path to the scene file of the object|yes|
|is_active|`Boolean`|Whether the new object should be set to active (default: `true`)|no|
|position_target|`String`|Global ID of another object that will be used to position the new object (when omitted, the new object's position is not specified)|no|

 

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

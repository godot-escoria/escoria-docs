
  (SetAnimationsCommand)=
# SetAnimationsCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`set_animations(object: String, animations: String)`

Sets the animation resource for the given `ESCPlayer` or movable `ESCItem`.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`String`|Global ID of the object whose animation resource is to be updated|yes|
|animations|`String`|The path of the animation resource to use|yes|

 

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

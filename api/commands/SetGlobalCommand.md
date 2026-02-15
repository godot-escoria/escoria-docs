
  (SetGlobalCommand)=
# SetGlobalCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`set_global(name: String, value: String|Integer|Boolean[, force: Boolean=false])`

Changes the value of a global.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Name of the global variable to set.|yes|
|value|`String` or `Integer` or `Boolean`|Value to set the global to (can be of type string, boolean, integer.)|yes|
|force|`Boolean`|if false, setting a global whose name is reserved will trigger an error. Defaults to false. Reserved globals are: ESC_LAST_SCENE, FORCE_LAST_SCENE_NULL, ANIMATION_RESOURCES, ESC_CURRENT_SCENE|no|

 

## Constants

### ILLEGAL\_STRINGS
```gdscript
const ILLEGAL_STRINGS = ["/"]

```
The list of illegal strings that cannot be used in global names.
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

Returns the descriptor of the arguments of this command. (`ESCCommandArgumentDescriptor`)
    
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

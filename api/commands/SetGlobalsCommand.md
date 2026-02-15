
  (SetGlobalsCommand)=
# SetGlobalsCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`set_globals(pattern: String, value: String|Integer|Boolean)`

Changes the value of multiple globals using a wildcard pattern, where `*` matches zero or more arbitrary characters and `?` matches any single character except a period (".").

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|pattern|`String`|Pattern to use to match the names of the globals to change|yes|
|value|`String` or `Integer` or `Boolean`|Value to set (can be of type string, boolean, integer or float)|yes|

 

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

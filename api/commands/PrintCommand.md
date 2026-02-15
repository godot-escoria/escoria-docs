
  (PrintCommand)=
# PrintCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`print(string: String)`

INTERNAL USE ONLY Prints a message to the Godot debug window. Use this for debugging game state.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|string|`String`|The string to log|yes|

 

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

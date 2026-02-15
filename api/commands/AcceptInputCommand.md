
  (AcceptInputCommand)=
# AcceptInputCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`accept_input([type: String])`

Sets how much input the game is to accept. This allows for cut scenes in which dialogue can be skipped (if [type] is set to SKIP), and ones where it can't (if [type] is set to NONE).

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|type|`String`|Type of inputs to accept (ALL) `ALL`: Accept all types of user input `SKIP`: Accept skipping dialogues but nothing else `NONE`: Deny all inputs (including opening menus) Warning The type of user input accepted will persist even after the current event has ended. Remember to reset the input type at the end of cut-scenes!|no|

 

## Constants

### SUPPORTED\_INPUT\_TYPES
```gdscript
const SUPPORTED_INPUT_TYPES = ["ALL", "NONE", "SKIP"]

```
The list of supported input types
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

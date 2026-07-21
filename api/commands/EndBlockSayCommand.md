
  (EndBlockSayCommand)=
# EndBlockSayCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`end_block_say()`

`say` commands used subsequent to using the `end_block_say` command will no longer reuse the dialog box type used by the previous `say` command(s) encountered. Using `end_block_say` more than once is safe and idempotent. Example: `block say` `say player "Picture's looking good."` `say player "And so am I."` `end_block_say` This example will reuse the same dialog box type since they are the same between both `say` calls.

#### Parameters

None. 
 

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
func validate(_arguments: Array) -> Variant
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
func run(_command_params: Array) -> int
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

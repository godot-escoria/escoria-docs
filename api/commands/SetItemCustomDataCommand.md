
  (SetItemCustomDataCommand)=
# SetItemCustomDataCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

*** FOR INTERNAL USE ONLY *** `set_item_custom_data(item: String, custom_data: Dictionary)`

Sets the "custom_data" of the item if it currently exists in the object manager.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`String`|Global ID of the item whose `custom_data` should be updated.|yes|
|custom_data|`Dictionary`|Dictionary assigned to the item's `custom_data` property (an empty dictionary is used when `null`).|yes|

 

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

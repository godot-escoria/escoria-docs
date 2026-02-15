
  (InventoryRemoveCommand)=
# InventoryRemoveCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`inventory_remove(item: String)`

Removes an item from the inventory. You may wish to use this command in conjuction with the `set_active` command to show an item in the scene, simulating placing the item somewhere, for example.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`String`|Global ID of the `ESCItem` to remove from the inventory|yes|

 

## Constants

### ILLEGAL\_STRINGS
```gdscript
const ILLEGAL_STRINGS = ["/"]

```
List of illegal strings that cannot be used in item names.
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

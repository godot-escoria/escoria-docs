
  (InventoryAddCommand)=
# InventoryAddCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`inventory_add(item: String)`

Adds an item to the inventory. If the player is picking up an object, you may want to use this command in conjunction with the `set_active` command so that the object 'disappears' from the scene as it's added to the inventory.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`String`|Global ID of the `ESCItem` to add to the inventory|yes|

 

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

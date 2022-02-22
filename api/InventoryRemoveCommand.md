<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# InventoryRemoveCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`inventory_remove item`

Removes an item from the inventory. You may wish to use this command in
conjuction with the `set_active` command to show an item in the scene,
simulating placing the item somewhere, for example.

**Parameters**

- *item*: Global ID of the `ESCItem` to remove from the inventory

@ESC

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

### run

```gdscript
func run(command_params: Array) -> int
```

Run the command
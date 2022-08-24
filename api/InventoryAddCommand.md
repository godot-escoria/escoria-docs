<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# InventoryAddCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`inventory_add item`

Adds an item to the inventory. If the player is picking up an object, you may
want to use this command in conjunction with the `set_active` command so that
the object 'disappears' from the scene as it's added to the inventory.

**Parameters**

- *item*: Global ID of the `ESCItem` to add to the inventory

@ESC

## Constants Descriptions

### ILLEGAL\_STRINGS

```gdscript
const ILLEGAL_STRINGS: Array = ["/"]
```

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

### validate

```gdscript
func validate(arguments: Array)
```

Validate whether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> int
```

Run the command

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.
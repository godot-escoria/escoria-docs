<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetItemCustomDataCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`set_item_custom_data item custom_data`

*** FOR INTERNAL USE ONLY ***

Sets the "custom_data" of the item if it currently exists in the object manager.

**Parameters**

- *item* Global ID of the item
- *custom_data* Dictionary with custom data. If null empty dictionary will be assigned.

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

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.
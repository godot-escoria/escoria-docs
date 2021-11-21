<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# TeleportCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`teleport object target`

Instantly moves an object to a new position

**Parameters**

- *object*: Global ID of the object to move
- *target*: Global ID of the target object to use as the destination

@ESC

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

Validate wether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> int
```

Run the command
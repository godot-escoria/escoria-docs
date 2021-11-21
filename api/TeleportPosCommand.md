<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# TeleportPosCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`teleport_pos object x y`

Instantly moves an object to the specified position

**Parameters**

- *object*: Global ID of the object to move
- *x*: X-coordinate of destination position
- *y*: Y-coordinate of destination position

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
<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetAngleCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`set_angle object degrees [wait]`

Turns a movable `ESCItem` or `ESCPlayer` to face a given angle.

Angles 0 and 360 are the same and correspond to UP/NORTH,
90 is RIGHT/EAST, 180 is DOWN/SOUTH, 270 is LEFT/WEST etc.

**Parameters**

- *object*: Global ID of the object to turn
- *degrees*: Number of degrees by which `object` is to be turned
- *wait*: Number of seconds to wait for each animation occurring between the
  current angle of `object` and the angle specified. A value of `0` will
  complete the turn immediately (default: `0`)

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
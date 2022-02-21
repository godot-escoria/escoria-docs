<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# WalkToPosCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`walk_to_pos object x y`

Moves the specified `ESCPlayer` or movable `ESCItem` to the absolute
coordinates provided while playing the `object`'s walking animation.
This command is non-blocking.

**Parameters**

- *object*: Global ID of the object to move
- *x*: X-coordinate of target position
- *y*: Y-coordinate of target position

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
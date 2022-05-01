<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# WalkToPosBlockCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`walk_to_pos_block object x y [walk_fast]`

Moves the specified `ESCPlayer` or movable `ESCItem` to the absolute
coordinates provided while playing the `object`'s walking animation.
This command is blocking.
This command will use the normal walk speed by default.

**Parameters**

- *object*: Global ID of the object to move
- *x*: X-coordinate of target position
- *y*: Y-coordinate of target position
- *walk_fast*: Whether to walk fast (`true`) or normal speed (`false`).
  (default: false)

@ESC

## Property Descriptions

### walking\_object\_node

```gdscript
var walking_object_node: ESCItem
```

Walking object

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
func run(command_params: Array) -> var
```

Run the command

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.
<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# WalkCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`walk object target [speed]`

Moves the specified `ESCPlayer` or movable `ESCItem` to `target` 
while playing the `object`'s walking animation. This command is non-blocking.

**Parameters**

- *object*: Global ID of the object to move
- *target*: Global ID of the target object
- *speed*: Walking speed to use (default: `object`'s default speed)

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
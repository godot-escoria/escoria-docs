<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetStateCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`set_state object state [immediate]`

Changes the state of `object` to the one specified.

If the specified object's associated animation player has an animation
with the same name, that that animation is also played.

Can be used to change the appearance of an item or player
character. See https://docs.escoria-framework.org/states for details.

**Parameters**

- *object*: Global ID of the object whose state is to be changed
- *immediate*: If an animation for the state exists, specifies
  whether it is to skip to the last frame. Can be `true` or `false`.

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
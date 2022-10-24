<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetStateCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`set_state object state [immediate]`

Changes the state of `object` to the one specified.
This command is primarily used to play animations.

If the specified object's associated animation player has an animation
with the same name, that animation is also played.

When the "state" of the object is set - for example, a door may be set
to a "closed" state - this plays the matching "close" animation if one exists
(to show the door closing in the game). When you re-enter the room (via a
different entry), or restore a saved game, the state of the door object
will be restored - showing the door as a closed door.

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
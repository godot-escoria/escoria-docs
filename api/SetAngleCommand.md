<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetAngleCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`set_angle object target_degrees [wait]`

Turns a movable `ESCItem` or `ESCPlayer` to face a given target direction.

Angles 0 and 360 are the same and correspond to UP/NORTH,
90 is RIGHT/EAST, 180 is DOWN/SOUTH, 270 is LEFT/WEST etc.
The rotation direction will be determined by the shortest path - e.g.
rotating from facing up (0 degrees) to left (270) will be a 90 degree turn
anti-clockwise rather than a 270 degree clockwise turn.

The final animation used is determined by the directions which have
been configured for the object. If the item has a direction configured which
has been drawn to show it facing to the right, and this direction has been
defined to cover the angle from 45 to 135 degrees, setting the target angle
to 120 degrees will result in the right-facing animation being used.

The number of intermediate animations shown while turning the
item will depend on the directions specified in the item's definition. A 16
direction character will turn through 8 different directions to turn 180
degrees, a 4 direction character only 2. The wait time will determine how
long the idle animation for each direction is played before using the next
direction's animation. As such, if wait was set to 1 second, a 16 direction
character would take 8 seconds to turn 180 degrees, a 4 direction character
would take 2 seconds.

**Parameters**

- *object*: Global ID of the object to turn
- *target_degrees*: Number of degrees by which `object` is to be turned
- *wait*: Number of seconds to wait for while playing each animation occurring
  between the current angle of `object` and the target angle. A value of
  `0` will complete the turn immediately (default: `0`)

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
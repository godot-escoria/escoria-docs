<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetDirectionCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`set_direction object direction_id [wait]`

Turns a movable `ESCItem` or `ESCPlayer` to face a given target direction id
(between 0 and 3 for a 4-directional character, or between 0 and 7 for an
8-directional character).

4-directional :
0 : UP / NORTH
1 : RIGHT / EAST
2 : DOWN / SOUTH
3 : LEFT / WEST

8-directional :
0 : UP / NORTH
1 : UP-RIGHT / NORTH-EAST
2 : RIGHT / EAST
3 : DOWN-RIGHT / SOUTH-EAST
4 : DOWN / SOUTH
5 : DOWN-LEFT / SOUTH-WEST
6 : LEFT / WEST
7 : TOP-LEFT / NORTH-WEST

**Parameters**

- *object*: Global ID of the object to turn
- *target_direction_id*: id of the direction as defined in the player animations
- *wait*: Number of seconds to wait while playing each animation occurring
  between the current direction of `object` and the target direction. A value of
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
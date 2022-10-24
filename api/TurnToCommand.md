<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# TurnToCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`turn_to object object_to_face [wait]`

Turns `object` to face another object.

Unlike movement commands, `turn_to` will not automatically reference an
`ESCLocation` that is a child of an `ESCItem.`
To turn towards an `ESCLocation` that is a child of an `ESCItem`, give the
`ESCLocation` a `Global ID` and use this value as the `object_to_face`
parameter.

While turning, the number of directions the item faces will depend on
the number of `directions` defined for the object. A 16 direction character
for example will display 8 directions of animation while turning to face an
object that is 180 degrees away, a 4 direction character would only face 2
directions to make the same turn. As the idle animation will be played for
`wait` seconds for each direction the object faces, a 16 direction character
would take 8 seconds to rotate 180 degrees with a 1 second `wait` time,
whereas a 4 direction character would only take 2 seconds to make the same
rotation.

**Parameters**

- *object*: Global ID of the object to be turned
- *object_to_face*: Global ID of the object to turn towards
- *wait*: Length of time to wait in seconds for each intermediate angle.
  If set to 0, the turnaround is immediate (default: `0`)

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
<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# TurnToCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`turn_to object object_to_face [wait]`

Turns `object` to face another object.

**Parameters**

- *object*: Global ID of the object to be turned
- *object_to_face*: Global ID of the object to turn towards
- *wait*: Length of time to wait in seconds for each intermediate angle.
  If set to 0, the turnaround is immediate (default: `0`)
#
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
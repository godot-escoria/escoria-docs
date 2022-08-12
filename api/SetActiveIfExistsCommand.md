<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetActiveIfExistsCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`set_active_if_exists object active`

*** FOR INTERNAL USE ONLY ***

Changes the "active" state of the object in the current room if it currently
exists in the object manager. If it doesn't, then, unlike set_active, we don't
fail and we just carry on.

Inactive objects are invisible in the room.

**Parameters**

- *object* Global ID of the object
- *active* Whether `object` should be active. `active` can be `true` or `false`.

@ESC

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

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
<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetActiveCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`set_active object active`

Changes the "active" state of the object. 
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
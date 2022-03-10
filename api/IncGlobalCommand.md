<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# IncGlobalCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`inc_global name value`

Adds the given value to the specified global.

**Parameters**

- *name*: Name of the global to be changed
- *value*: Value to be added

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
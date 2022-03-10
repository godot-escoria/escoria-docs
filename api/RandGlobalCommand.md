<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# RandGlobalCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`rand_global name max_value`

Sets the given global to a random integer between 0 and `max_value` (inclusive).

**Parameters**

- *name*: Name of the global to set
- *max_value*: Maximum possible integer value (exclusive)

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
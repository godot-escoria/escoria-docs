<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# RandGlobalCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`rand_global name max_value`

Sets the given global to a random integer between 0 and `max_value`
(inclusive). e.g. Setting `max_value` to 2 could result in '0', '1' or '2'
being returned.

**Parameters**

- *name*: Name of the global to set
- *max_value*: Maximum possible integer value (inclusive) (default: 1)

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
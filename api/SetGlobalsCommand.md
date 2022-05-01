<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetGlobalsCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`set_globals pattern value`

Changes the value of multiple globals using a wildcard pattern, where `*`
matches zero or more arbitrary characters and `?` matches any single
character except a period (".").

**Parameters**

- *pattern*: Pattern to use to match the names of the globals to change
- *value*: Value to set (can be of type string, boolean, integer or float)

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
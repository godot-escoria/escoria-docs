<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCCommand

**Extends:** [ESCStatement](../ESCStatement) < [Object](../Object)

## Description

An ESC command

## Constants Descriptions

### REGEX

```gdscript
const REGEX: String = "^(\\s*)(?<name>[^\\s]+)(\\s(?<parameters>([^\\[]|$)+))?(\\[(?<conditions>[^\\]]+)\\])?"
```

Regex matching command lines

## Property Descriptions

### name

```gdscript
var name: String
```

The name of this command

### parameters

```gdscript
var parameters: Array
```

Parameters of this command

### conditions

```gdscript
var conditions: Array
```

A list of ESCConditions to run this command.
Conditions are combined using logical AND

## Method Descriptions

### \_init

```gdscript
func _init(command_string)
```

Create a command from a command string

### is\_valid

```gdscript
func is_valid() -> bool
```

Check, if conditions match

### command\_exists

```gdscript
func command_exists() -> bool
```

Checks that the command exists

*Returns* True if the command exists, else false.

### run

```gdscript
func run() -> var
```

Run this command
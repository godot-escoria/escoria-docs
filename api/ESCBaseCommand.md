<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCBaseCommand

**Extends:** [Node](../Node)

## Description

A base class for every ESC command.
Extending classes have to override the configure and run function

## Constants Descriptions

### COMMAND\_NAME\_REGEX

```gdscript
const COMMAND_NAME_REGEX: String = "(?<path>.+)/(?<file>[^.]+)(?<extension>\\.[^.]*$|$)"
```

### EXTENSION\_REGEX\_GROUP

```gdscript
const EXTENSION_REGEX_GROUP: String = "extension"
```

### FILE\_REGEX\_GROUP

```gdscript
const FILE_REGEX_GROUP: String = "file"
```

### PATH\_REGEX\_GROUP

```gdscript
const PATH_REGEX_GROUP: String = "path"
```

Regex for creating command name based on the script's filename, including
named groups

## Property Descriptions

### command\_name\_regex

```gdscript
var command_name_regex: RegEx
```

Regex matcher for command names

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

### validate

```gdscript
func validate(arguments: Array) -> bool
```

Validate wether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> int
```

Run the command

### get\_command\_name

```gdscript
func get_command_name() -> String
```

Return the name of the command based on the script's filename
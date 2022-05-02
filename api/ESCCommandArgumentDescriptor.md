<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCCommandArgumentDescriptor

**Extends:** [Object](../Object)

## Description

The descriptor of the arguments of an ESC command

## Constants Descriptions

### GODOT\_TYPE\_LIST

```gdscript
const GODOT_TYPE_LIST: Array = ["nil","bool","int","real","string","vector2","rect2","vector3","matrix32","plane","quat","aabb","matrix3","transform","color","image","node_path","rid","object","input_event","dictionary","array","raw_array","int_array","real_array","string_array","vector2_array","vector3_array","color_array","max"]
```

As the get_type command was deprecated with Godot 2.x w we need a way to determine
variable types. Ideally these wouldn't be hardcoded but there's no GDScript 3.x command to
turn a type back to its name.

## Property Descriptions

### max\_args

```gdscript
var max_args: int = 0
```

Maximum number of total arugments the command can handle

### min\_args

```gdscript
var min_args: int = 0
```

Number of required arguments the command expects

### types

```gdscript
var types: Array
```

The types the arguments as TYPE_ constants. If the command is called with
more arguments than there are entries in the types array, the additional
arguments will be checked against the last entry of the types array.

### defaults

```gdscript
var defaults: Array
```

The default values for the arguments

### strip\_quotes

```gdscript
var strip_quotes: Array
```

Whether to strip quotes on specific arguments

### has\_varargs

```gdscript
var has_varargs: bool = false
```

Whether the final argument is a series of varargs

## Method Descriptions

### \_init

```gdscript
func _init(p_min_args: int = 0, p_types: Array, p_defaults: Array, p_strip_quotes: Array = true, p_has_varargs: bool = false)
```

### prepare\_arguments

```gdscript
func prepare_arguments(arguments: Array) -> Array
```

Combine the default argument values with the given arguments

### validate

```gdscript
func validate(command: String, arguments: Array) -> bool
```

Validate whether the given arguments match the command descriptor
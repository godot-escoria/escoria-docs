
  (ESCCommandArgumentDescriptor)=
# ESCCommandArgumentDescriptor

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Describes the arguments of commands that extend `ESCBaseCommand`.



## Constants

### GODOT\_TYPE\_LIST
```gdscript
const GODOT_TYPE_LIST = ["nil", "bool", "int", "real", "string", "vector2", "rect2", "vector3", "matrix32", "plane", "quat", "aabb", "matrix3", "transform", "color", "image", "node_path", "rid", "object", "input_event", "dictionary", "array", "raw_array", "int_array", "real_array", "string_array", "vector2_array", "vector3_array", "color_array", "max"]

```
As the get_type command was deprecated with Godot 2.x w we need a way to determine variable types. Ideally these wouldn't be hardcoded but there's no GDScript 3.x command to turn a type back to its name.

TODO: With Escoria having been ported to Godot 4, this concept will need to be revisited.
## Members
    
### max\_args

```gdscript
var max_args: int
```

Maximum number of total arugments the command can handle
    
### min\_args

```gdscript
var min_args: int
```

Number of required arguments the command expects
    
### types

```gdscript
var types: Array
```

The types the arguments as TYPE_ constants. If the command is called with more arguments than there are entries in the types array, the additional arguments will be checked against the last entry of the types array.
    
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
var has_varargs: bool
```

Whether the final argument is a series of varargs
    
### filename

```gdscript
var filename: String
```

The filename from which the relevant command is being called, if available.
    
### line\_number

```gdscript
var line_number: int
```

The line number from the file the relevant command is being called from.

## Methods
    
% ...
---
### prepare\_arguments

```gdscript
func prepare_arguments(arguments: Array) -> Array
```

Combines the default argument values with the given arguments.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|arguments|`Array`|an array of arguments to pass in to the command, with the array's order corresponding to the order of the arguments the command expects. If the number of arguments passed in is fewer than the maximum number of arguments the command can handle, default values are used for those arguments not passed in.|yes|

#### Returns

Returns a `Array` value. (`Array`)
    
% ...
---
### validate

```gdscript
func validate(command: String, arguments: Array) -> bool
```

Validates whether the given arguments match the command descriptor.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command|`String`|the name of the command; used for logging purposes.|yes|
|arguments|`Array`|the arguments to be passed to the command|yes|

#### Returns

Returns a `bool` value. (`bool`)

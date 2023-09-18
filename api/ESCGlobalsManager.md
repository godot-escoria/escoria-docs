<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCGlobalsManager

**Extends:** [Resource](../Resource)

## Description

A resource that manages the ESC global states
The ESC global state is basically simply a dictionary of keys with
values. Values can be bool, integer or strings

## Property Descriptions

### globals\_regex

```gdscript
var globals_regex: RegEx
```

Use look-ahead/behind to capture the term in braces

## Method Descriptions

### has

```gdscript
func has(key: String) -> bool
```

Check if a global was registered

#### Parameters

- key: The global key to check
**Returns** Whether the global was registered

### register\_reserved\_global

```gdscript
func register_reserved_global(key: String, value = null) -> void
```

Registers a global as being reserved and initializes it.

#### Parameters

- key: The key of the global to register
- value: The initial value (optional)

### get\_global

```gdscript
func get_global(key: String)
```

Get the current value of a global

#### Parameters

- key: The key of the global to return the value
**Returns** The value of the global

### filter

```gdscript
func filter(pattern: String) -> Dictionary
```

Filter the globals and return all matching keys and their values as
a dictionary
Check out [the Godot docs](https://docs.godotengine.org/en/3.5/classes/class_string.html#class-string-method-match)
for the pattern format

#### Parameters

- pattern: The pattern that the keys have to match
**Returns** A dictionary of matching keys and their values

### set\_global

```gdscript
func set_global(key: String, value, ignore_reserved: bool = false) -> void
```

Set the value of a global

#### Parameters

- key: The key of the global to modify
- value: The new value

### set\_global\_wildcard

```gdscript
func set_global_wildcard(pattern: String, value) -> void
```

Set all globals that match the pattern to the value
Check out [the Godot docs](https://docs.godotengine.org/en/3.5/classes/class_string.html#class-string-method-match)
for the pattern format

#### Parameters

- pattern: The wildcard pattern to match
- value: The new value

### replace\_globals

```gdscript
func replace_globals(string: String) -> String
```

Look to see if any globals (names in braces) should be interpreted

#### Parameters

* string: Text in which to replace globals

*Returns* the provided string with globals variables replaced with their values

### save\_game

```gdscript
func save_game(p_savegame: ESCSaveGame) -> void
```

Save the state of globals in the savegame.

#### Parameters
- p_savegame: ESCSaveGame resource that holds all data of the save

## Signals

- signal global_changed(global, old_value, new_value): Emitted when a global is changed

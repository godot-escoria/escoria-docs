
  (ESCGlobalsManager)=
# ESCGlobalsManager

**Extends:** {ref}`Resource <Resource>`
        
## Description

A resource that manages the ASHES global states.

The ASHES global state is basically simply a dictionary of keys with values. Values can be bool, integer or strings. 

## Members

## Signals

### global\_changed

```gdscript
signal global_changed(global: Variant, old_value: Variant, new_value: Variant)
```

Emitted when a global has changed.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|global|`Variant`|Key of the global that changed.|yes|
|old_value|`Variant`|Value stored under the key before the change.|yes|
|new_value|`Variant`|Updated value stored for the key.|yes|



## Methods
    
% ...
---
### has

```gdscript
func has(key: String) -> bool
```

Checks whether a global has already been registered.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|key|`String`|The global key to check.|yes|

#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### clear

```gdscript
func clear() -> void
```

Clears all globals.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### register\_reserved\_global

```gdscript
func register_reserved_global(key: String, value: Variant) -> void
```

Registers a global as being reserved and initializes it.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|key|`String`|The key of the global to register.|yes|
|value|`Variant`|The key's initial value (optional).|no|

#### Returns

Returns nothing.
    
% ...
---
### get\_global

```gdscript
func get_global(key: String) -> Variant
```

Retrieves the current value of a global.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|key|`String`|The key of the global to return the value.|yes|

#### Returns

Returns a `Variant` value representing the global's value, or `null` if not found. (`Variant`)
    
% ...
---
### filter

```gdscript
func filter(pattern: String) -> Dictionary
```

Filters the globals and return all matching keys and their values as a dictionary. Check out [the Godot docs](https://docs.godotengine.org/en/stable/classes/class_string.html#class-string-method-match) for the pattern format.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|pattern|`String`|The pattern that the keys have to match.|yes|

#### Returns

Returns a `Dictionary` value. (`Dictionary`)
    
% ...
---
### set\_global

```gdscript
func set_global(key: String, value: Variant, ignore_reserved: bool) -> void
```

Sets the value of a global.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|key|`String`|The key of the global to modify.|yes|
|value|`Variant`|The new value to be stored with the key.|yes|
|ignore_reserved|`bool`|If `true`, allows overriding globals marked as reserved.|no|

#### Returns

Returns nothing.
    
% ...
---
### set\_global\_wildcard

```gdscript
func set_global_wildcard(pattern: String, value: Variant) -> void
```

Sets all globals that match the pattern to the value. Check out [the Godot docs](https://docs.godotengine.org/en/stable/classes/class_string.html#class-string-method-match) for the pattern format.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|pattern|`String`|The wildcard pattern to match.|yes|
|value|`Variant`|The new value to be stored with the key.|yes|

#### Returns

Returns nothing.
    
% ...
---
### replace\_globals

```gdscript
func replace_globals(string: String) -> String
```

Replaces any globals whose names are specified in braces with their respective values (i.e. performs string interpolation). values.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|string|`String`|The text in which globals in braces are to be substituted.|yes|

#### Returns

Returns a `String` value. (`String`)
    
% ...
---
### save\_game

```gdscript
func save_game(p_savegame: ESCSaveGame) -> void
```

Saves the state of globals in the savegame.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_savegame|`ESCSaveGame`|`ESCSaveGame` resource that holds all save data.|yes|

#### Returns

Returns nothing.


  (ESCEvent)=
# ESCEvent

**Extends:** {ref}`ESCStatement <ESCStatement>`
        
## Description

An event in Escoria.

Events are triggered from various sources. Common events include:

- `:setup` : This event is always the first to be called each time the room is visited. It allows elements in the room to be prepared *before* the room is displayed to the player (e.g. starting particle effects).
- `:ready` : This event is the second to be called each time the room is visited. It is run immediately after `:setup` finishes execution, if it exists. Otherwise, `:ready` will be the first event to run. Regardless, this event is run *after* the room is displayed to the player, allowing cutscenes or animations to be run once the room is visible.
- `:use <global id>` : Called from the current item when it is used with the item with specified by `<global id>`.

## Constants

### TK
```gdscript
const TK = 1 # enum "FLAGS"

```

### NO\_TT
```gdscript
const NO_TT = 2 # enum "FLAGS"

```

### NO\_UI
```gdscript
const NO_UI = 4 # enum "FLAGS"

```

### NO\_SAVE
```gdscript
const NO_SAVE = 8 # enum "FLAGS"

```

### REGEX
```gdscript
const REGEX = "^:(?<name>[^|]+)( \\|\\s*(?<flags>( (TK|NO_TT|NO_UI|NO_SAVE))+))?$"

```
Regex identifying an ESC event.
### PREFIX
```gdscript
const PREFIX = ":"

```
Prefix to identify this as an ESC event.
## Members
    
### name

```gdscript
var name: String
```

Name of the event.
    
### original\_name

```gdscript
var original_name: String
```

Original name of the event (in case it is modified when resuming a loaded event).
    
### flags

```gdscript
var flags: int
```

Flags set for this event.

## Methods
    
% ...
---
### exported

```gdscript
func exported() -> Dictionary
```

A Dictionary containing statements data for serialization, typically used as part of the savegame process.

#### Parameters

None. 
#### Returns

Returns a Dictionary containing statements data for serialization, typically used as part of the savegame process. (`Dictionary`)
    
% ...
---
### init

```gdscript
func init(event_name: String, event_flags: Array) -> void
```

Initializes the event with specified arguments.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|event_name|`String`|the name of the event|yes|
|event_flags|`Array`|an array containing zero or more event flags as described in the enum contained in this class.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_flags\_from\_list

```gdscript
func get_flags_from_list(event_flags: String[]) -> int
```

Converts a list of event flag strings to a bitmask.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|event_flags|`Array[String]`|Array of flag strings.|yes|

#### Returns

Returns the bitmask of flags as an int. (`int`)
    
% ...
---
### run

```gdscript
func run() -> int
```

Executes this statement and returns a return code.

#### Parameters

None. 
#### Returns

Returns a `int` value. (`int`)
    
% ...
---
### get\_event\_name

```gdscript
func get_event_name() -> String
```

The event's name.

#### Parameters

None. 
#### Returns

Returns the event's name. (`String`)

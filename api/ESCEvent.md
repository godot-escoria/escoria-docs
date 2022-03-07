<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCEvent

**Extends:** [ESCStatement](../ESCStatement) < [Object](../Object)

## Description

An event in the ESC language

Events are triggered from various sources. Common events include

* :setup : This event is always the first to be called each time the room is visited.
   It allows elements in the room to be prepared *before* the room is displayed to the
   player (e.g. starting particle effects).
* :ready : This event is the second to be called each time the room is visited.
   It is run immediately after `:setup` finishes execution, if it exists. Otherwise,
   `:ready` will be the first event to run. Regardless, this event is run *after*
   the room is displayed to the player, allowing cutscenes or animations to be
   run once the room is visible.
* :use <global id> Called from the current item when it is used with the item
  with the global id <global id>

## Constants Descriptions

### FLAG\_NO\_SAVE

```gdscript
const FLAG_NO_SAVE: int = 8
```

### FLAG\_NO\_TT

```gdscript
const FLAG_NO_TT: int = 2
```

### FLAG\_NO\_UI

```gdscript
const FLAG_NO_UI: int = 4
```

### FLAG\_TK

```gdscript
const FLAG_TK: int = 1
```

### PREFIX

```gdscript
const PREFIX: String = ":"
```

Prefix to identify this as an ESC event.

### REGEX

```gdscript
const REGEX: String = "^:(?<name>[^|]+)( \\|\\s*(?<flags>( (TK|NO_TT|NO_UI|NO_SAVE))+))?$"
```

Regex identifying an ESC event

## Property Descriptions

### name

```gdscript
var name: String
```

Name of event

### flags

```gdscript
var flags: int = 0
```

Flags set to this event

## Method Descriptions

### \_init

```gdscript
func _init(event_string: String)
```

Create a new event from an event line

### run

```gdscript
func run() -> int
```

Execute this statement and return its return code
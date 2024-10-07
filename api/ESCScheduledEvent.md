<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCScheduledEvent

**Extends:** [Reference](../Reference)

## Description

An event that is scheduled to run later

## Property Descriptions

### event

```gdscript
var event: ESCEvent
```

Event to run when timeout is reached

### timeout

```gdscript
var timeout: float
```

The number of seconds until the event is run

### object

```gdscript
var object: String
```

The target object

## Method Descriptions

### \_init

```gdscript
func _init(p_event: ESCEvent, p_timeout: float, p_object: String)
```

Create a new scheduled event

### exported

```gdscript
func exported() -> Dictionary
```

Returns a Dictionary containing statements data for serialization

### run

```gdscript
func run() -> int
```

Run the event

**Returns** The execution code
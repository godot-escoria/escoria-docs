
  (ESCScheduledEvent)=
# ESCScheduledEvent

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Represents an event that is scheduled to run sometime in the future.



## Members
    
### event

```gdscript
var event: Variant
```

The event to run when timeout is reached.
    
### timeout

```gdscript
var timeout: float
```

The number of seconds until the event is to be run.
    
### object

```gdscript
var object: String
```

The target object.

## Methods
    
% ...
---
### exported

```gdscript
func exported() -> Dictionary
```

A `Dictionary` containing relevant data for serialization.

#### Parameters

None. 
#### Returns

Returns a `Dictionary` containing relevant data for serialization. (`Dictionary`)
    
% ...
---
### run

```gdscript
func run() -> int
```

TODO: THIS IS NO LONGER USED AS EVENT IS NOW RUN BY ASHES INTERPRETER. THIS MAY BE REMOVED IN THE FUTURE. Runs the event.

#### Parameters

None. 
#### Returns

Returns a `int` value. (`int`)

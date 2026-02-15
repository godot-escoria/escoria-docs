
  (ESCWalkContext)=
# ESCWalkContext

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

The walk context describes the target of a walk command and if that command should be executed fast.



## Members
    
### target\_object

```gdscript
var target_object: ESCObject
```

Target object that the walk command tries to reach.
    
### target\_position

```gdscript
var target_position: Vector2
```

The target position
    
### fast

```gdscript
var fast: bool
```

Whether to move fast
    
### dont\_interact\_on\_arrival

```gdscript
var dont_interact_on_arrival: bool
```

Whether an interaction should NOT happen after walk reaches destination

## Methods

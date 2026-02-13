
  (ESCRoomObjectsKey)=
# ESCRoomObjectsKey

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Simple pair container to store a room's identifying information for use in the object manager.



## Members
    
### room\_global\_id

```gdscript
var room_global_id: String
```

Contains the `global_id` of the room being represented by this key.
    
### room\_instance\_id

```gdscript
var room_instance_id: int
```

Contains the instance ID of the room being represented by this key.

## Methods
    
% ...
---
### is\_valid

```gdscript
func is_valid() -> bool
```

Checks whether this key is valid and represents an actual room.

#### Parameters

None. 
#### Returns

Returns a `bool` value. (`bool`)

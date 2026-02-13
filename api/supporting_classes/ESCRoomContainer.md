
  (ESCRoomContainer)=
# ESCRoomContainer

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Abstract base class for a container of Escoria entities specific to a room to be stored in and used by the Escoria object manager.



## Members
    
### is\_reserved

```gdscript
var is_reserved: bool
```

Designates whether the objects contained in this container are all reserved objects.
    
### room\_global\_id

```gdscript
var room_global_id: String
```

Global ID of the room in which the objects in this container are registered.
    
### room\_instance\_id

```gdscript
var room_instance_id: int
```

Instance ID of the room in which the objects in this container are registered. This is used to disambiguate in cases where more than one of the same room exist in the object manager.

<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCRoomObjects

**Extends:** [Reference](../Reference)

## Description

Container for ESCObjects stored in the object manager.

## Property Descriptions

### is\_reserved

```gdscript
var is_reserved: bool = false
```

Designated whether 'objects' is the container for all reserved objects.

### room\_global\_id

```gdscript
var room_global_id: String = ""
```

Global ID of the room to which the objects in 'objects' are registered.

### room\_instance\_id

```gdscript
var room_instance_id: int = -1
```

Instance ID of the room to which the objects in 'objects' are registered.
This is used to disambiguate in cases where more than one of the same room
exist in the object manager.

### objects

```gdscript
var objects: Dictionary
```

The hash of objects registered to the room specified above.
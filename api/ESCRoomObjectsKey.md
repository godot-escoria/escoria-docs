<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCRoomObjectsKey

**Extends:** [Reference](../Reference)

## Description

Simple pair container to store a room's identifying information for use in
the object manager.

## Property Descriptions

### room\_global\_id

```gdscript
var room_global_id: String = ""
```

Contains the global_id of the room being represented by this key.

### room\_instance\_id

```gdscript
var room_instance_id: int = -1
```

Contains the instance ID of the room being represented by this key.

## Method Descriptions

### is\_valid

```gdscript
func is_valid() -> bool
```

Checks whether this key is valid and represents an actual room.

**Returns** true iff the key has a valid global_id and room instance ID.
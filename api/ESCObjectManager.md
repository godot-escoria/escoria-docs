<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCObjectManager

**Extends:** [Resource](../Resource)

## Description

A manager for ESC objects

## Constants Descriptions

### CAMERA

```gdscript
const CAMERA: String = "_camera"
```

### MUSIC

```gdscript
const MUSIC: String = "_music"
```

### RESERVED\_OBJECTS

```gdscript
const RESERVED_OBJECTS: Array = ["_music","_sound","_speech"]
```

### SOUND

```gdscript
const SOUND: String = "_sound"
```

### SPEECH

```gdscript
const SPEECH: String = "_speech"
```

## Property Descriptions

### room\_objects

```gdscript
var room_objects: Array
```

The array of registered objects (organized by room, so each entry is a structure
representing a room and its registered objects). This also includes one
"room" for reserved objects; that is, we use one entry of the array to
hold all reserved objects. This entry can be identified by the "is_reserved"
property being set to true.

"Reserved objects" are those which are named in the RESERVED_OBJECTS const
array and include objects that are used internally by Escoria in every room,
e.g. a music player, a sound player, a speech player, the main camera.

In almost all cases, the reserved objects' entry doesn't need updating once
created.

Example structure:

	[
		{
			is_reserved: true,	# Indicates this is the "reserved objects" entry
			room: "",
			room_instance_id: "",
			objects:
				{
					"_camera": camera
				},
		},
		{
			is_reserved: false,	# Indicates this an entry for a room's objectss
			room_global_id: "<room_global_id>",
			room_instance_id: "<room_object_instance_id>",
			objects:
				{
					"obj1": val1,
					"obj2": val2
				}
		}
	]

### current\_room\_key

```gdscript
var current_room_key: ESCRoomObjectsKey
```

We also store the current room's ids for retrieving the right objects.

### reserved\_objects\_container

```gdscript
var reserved_objects_container: ESCRoomObjects
```

To avoid having to look this up all the time, we hold a reference.

## Method Descriptions

### set\_current\_room

```gdscript
func set_current_room(room: ESCRoom) -> void
```

Updates which object manager room is to be treated as the currently active one.

#### Parameters

- room: Room to register the object with in the object manager

### register\_object

```gdscript
func register_object(object: ESCObject, room: ESCRoom = null, force: bool = false, auto_unregister: bool = true) -> void
```

Register the object in the manager

#### Parameters

- object: Object to register
- room: Room to register the object with in the object manager
- force: Register the object, even if it has already been registered
- auto_unregister: Automatically unregister object on tree_exited

### has

```gdscript
func has(global_id: String, room: ESCRoom = null) -> bool
```

Check whether an object was registered

#### Parameters

- global_id: Global ID of object
- room: ESCRoom instance the object is registered with.
***Returns*** Whether the object exists in the object registry

### get\_object

```gdscript
func get_object(global_id: String, room: ESCRoom = null) -> ESCObject
```

Get the object from the object registry

#### Parameters

- global_id: The global id of the object to retrieve
- room: ESCRoom instance the object is registered with.
***Returns*** The retrieved object, or null if not found

### unregister\_object

```gdscript
func unregister_object(object: ESCObject, room_key: ESCRoomObjectsKey) -> void
```

Remove an object from the registry

#### Parameters

- object: The object to unregister
- room_key: The room under which the object should be unregistered.

### unregister\_object\_by\_global\_id

```gdscript
func unregister_object_by_global_id(global_id: String, room_key: ESCRoomObjectsKey) -> void
```

Remove an object from the registry by global_id

#### Parameters

- global_id: The global_id of the object to unregister
- room_key: The room under which the object should be unregistered.

### save\_game

```gdscript
func save_game(p_savegame: ESCSaveGame) -> void
```

Insert data to save into savegame. For now, we only save the current room's
objects.

#### Parameters

- p_savegame: The savegame resource

### get\_start\_location

```gdscript
func get_start_location() -> ESCLocation
```

Returns the current room's starting location. If more than one exists, the
first one encountered is returned.
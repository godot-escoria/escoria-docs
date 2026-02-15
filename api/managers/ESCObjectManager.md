
  (ESCObjectManager)=
# ESCObjectManager

**Extends:** {ref}`Resource <Resource>`
        
## Description

A manager for ESC objects. 



## Constants

### CAMERA
```gdscript
const CAMERA = "_camera"

```
Reserved camera object.
### MUSIC
```gdscript
const MUSIC = "_music"

```
Reserved music player object.
### SOUND
```gdscript
const SOUND = "_sound"

```
Reserved sound player object.
### SPEECH
```gdscript
const SPEECH = "_speech"

```
Reserved speech player object.
### AMBIENT
```gdscript
const AMBIENT = "_ambient"

```
Reserved ambient player object.
### RESERVED\_OBJECTS
```gdscript
const RESERVED_OBJECTS = ["_music", "_sound", "_speech", "_ambient"]

```
Array of objects that are reserved and automatically created when Escoria starts up.
## Members
    
### room\_objects

```gdscript
var room_objects: Array
```

The array of registered objects (organized by room, so each entry is a structure representing a room and its registered objects). This also includes one "room" for reserved objects; that is, we use one entry of the array to hold all reserved objects. This entry can be identified by the "is_reserved" property being set to true.

"Reserved objects" are those which are named in the RESERVED_OBJECTS const array and include objects that are used internally by Escoria in every room, e.g. a music player, a sound player, a speech player, the main camera.

In almost all cases, the reserved objects' entry doesn't need updating once created.

Example structure:

[
{
is_reserved: true, # Indicates this is the "reserved objects" entry
room: "",
room_instance_id: "",
objects:
{
"_camera": camera
},
},
{
is_reserved: false, # Indicates this an entry for a room's objects
room_global_id: "<room_global_id>",
room_instance_id: "<room_object_instance_id>",
objects:
{
"obj1": val1,
"obj2": val2
}
}
]
    
### room\_terrains

```gdscript
var room_terrains: Array
```

Array containing the encountered terrains so they can be properly saved in savegames.
    
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

## Methods
    
% ...
---
### set\_current\_room

```gdscript
func set_current_room(room: ESCRoom) -> void
```

Updates which object manager room is to be treated as the currently active one.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|room|`ESCRoom`|Room to register objects with in the object manager.|yes|

#### Returns

Returns nothing.
    
% ...
---
### register\_object

```gdscript
func register_object(object: ESCObject, room: ESCRoom, force: bool, auto_unregister: bool) -> void
```

Registers the object in the manager.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`ESCObject`|The object to register.|yes|
|room|`ESCRoom`|(optional) Room to register the object with in the object manager; if not specified, the object manager will attempt to register the object with the current room if one has been specified.|no|
|force|`bool`|(optional) Register the object, even if it has already been registered (default: `false`).|no|
|auto_unregister|`bool`|(optional) Automatically unregister the object when its node exits the scene tree (default: `true`).|no|

#### Returns

Returns nothing.
    
% ...
---
### register\_terrain

```gdscript
func register_terrain(object: ESCObject, room: ESCRoom) -> void
```

Registers the terrain with the manager.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`ESCObject`|The object containing the terrain to register.|yes|
|room|`ESCRoom`|(optional) Room to register the object with in the object manager; if not specified, the object manager will attempt to register the terrain with the current room if one has been specified.|no|

#### Returns

Returns nothing.
    
% ...
---
### has

```gdscript
func has(global_id: String, room: ESCRoom) -> bool
```

Checks whether an object has been registered.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|global_id|`String`|The global ID of the object.|yes|
|room|`ESCRoom`|(optional) `ESCRoom` instance the object is registered with; if not specified, the object manager will attempt to use the current room if one has been specified.|no|

#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### get\_object

```gdscript
func get_object(global_id: String, room: ESCRoom) -> ESCObject
```

Retrieves the object from the object registry.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|global_id|`String`|The global id of the object to retrieve.|yes|
|room|`ESCRoom`|The `ESCRoom` instance the object is registered with; if not specified, the object manager will attempt to use the current room if one has been specified.|no|

#### Returns

Returns a `ESCObject` value. (`ESCObject`)
    
% ...
---
### unregister\_object

```gdscript
func unregister_object(object: ESCObject, room_key: ESCRoomObjectsKey) -> void
```

Removes an object from the registry.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`ESCObject`|The object to unregister.|yes|
|room_key|`ESCRoomObjectsKey`|The room under which the object should be unregistered.|yes|

#### Returns

Returns nothing.
    
% ...
---
### unregister\_object\_by\_global\_id

```gdscript
func unregister_object_by_global_id(global_id: String, room_key: ESCRoomObjectsKey) -> void
```

Removes an object from the registry by its `global_id`.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|global_id|`String`|The global id` of the object to unregister.|yes|
|room_key|`ESCRoomObjectsKey`|The room under which the object should be unregistered.|yes|

#### Returns

Returns nothing.
    
% ...
---
### save\_game

```gdscript
func save_game(p_savegame: ESCSaveGame) -> void
```

Inserts data to save into savegame. For now, we only save the current room's objects.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_savegame|`ESCSaveGame`|The savegame resource.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_start\_location

```gdscript
func get_start_location() -> ESCLocation
```

The current room's starting location. If more than one exists, the first one encountered is returned. or `null` if no `ESCLocation` with `is_start_location` enabled can be found.

#### Parameters

None. 
#### Returns

Returns the current room's starting location. If more than one exists, the first one encountered is returned. or `null` if no `ESCLocation` with `is_start_location` enabled can be found. (`ESCLocation`)

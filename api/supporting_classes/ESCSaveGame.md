
  (ESCSaveGame)=
# ESCSaveGame

**Extends:** {ref}`Resource <Resource>`
        
## Description

Resource used for holding savegames data.



## Constants

### MAIN\_LAST\_SCENE\_GLOBAL\_ID\_KEY
```gdscript
const MAIN_LAST_SCENE_GLOBAL_ID_KEY = "last_scene_global_id"

```
Access key for the main data last_scene_global_id.
### MAIN\_CURRENT\_SCENE\_FILENAME\_KEY
```gdscript
const MAIN_CURRENT_SCENE_FILENAME_KEY = "current_scene_filename"

```
Access key for the main data current_scene_filename.
## Members
    
### escoria\_version

```gdscript
var escoria_version: String
```

Escoria version which the savegame was created with.
    
### game\_version

```gdscript
var game_version: String
```

Game version which the savegame was created with.
    
### name

```gdscript
var name: String
```

Name of the savegame. Can be custom value, provided by the player.
    
### date

```gdscript
var date: Dictionary
```

Date of creation of the savegame.
    
### main

```gdscript
var main: Dictionary
```

Main data to be saved.
    
### globals

```gdscript
var globals: Dictionary
```

Escoria Global variables exported from ESCGlobalsManager.
    
### inventory

```gdscript
var inventory: Array
```

Inventory items.
    
### objects

```gdscript
var objects: Dictionary
```

Escoria objects exported from ESCObjectsManager.
    
### events

```gdscript
var events: Dictionary
```

Running event exported from ESCEventManager.
    
### terrain\_navpolys

```gdscript
var terrain_navpolys: Dictionary
```

Enabled ESCTerrain navpolygons.
    
### settings

```gdscript
var settings: Dictionary
```

Settings.
    
### custom\_data

```gdscript
var custom_data: Dictionary
```

Custom data.

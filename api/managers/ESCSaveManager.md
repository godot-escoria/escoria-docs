
  (ESCSaveManager)=
# ESCSaveManager

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Saves and loads savegame and settings files. 



## Constants

### SETTINGS\_TEMPLATE
```gdscript
const SETTINGS_TEMPLATE = "settings.tres"

```
Template for settings filename.
### SAVE\_NAME\_TEMPLATE
```gdscript
const SAVE_NAME_TEMPLATE = "save_%03d.tres"

```
Template for savegames filenames.
### CRASH\_SAVE\_NAME\_TEMPLATE
```gdscript
const CRASH_SAVE_NAME_TEMPLATE = "crash_autosave_%s_%s.tres"

```
Template for crash savegames filenames.
## Members
    
### save\_enabled

```gdscript
var save_enabled: bool
```

If true, saving a game is enabled. Else, saving is disabled.
    
### save\_folder

```gdscript
var save_folder: String
```

Variable containing the saves folder obtained from Project Settings.
    
### crash\_savegame\_filename

```gdscript
var crash_savegame_filename: String
```

Filename of the latest crash savegame file.
    
### settings\_folder

```gdscript
var settings_folder: String
```

Variable containing the settings folder obtained from Project Settings.
    
### is\_loading\_game

```gdscript
var is_loading_game: bool
```

True if escoria is currently loading a savegame. This is used to avoid RoomManager to execute room's :setup and :ready events when loading a savegame.

## Signals

### game\_is\_loading

```gdscript
signal game_is_loading()
```

Emitted when the game is starting to load a savegame.

#### Parameters

None. 


### game\_finished\_loading

```gdscript
signal game_finished_loading()
```

Emitted when the game has finished loading a savegame.

#### Parameters

None. 


## Methods
    
% ...
---
### get\_saves\_list

```gdscript
func get_saves_list() -> Dictionary
```

Return a list of savegames metadata (id, date, name and game version).

#### Parameters

None. 
#### Returns

Returns a `Dictionary` value. (`Dictionary`)
    
% ...
---
### save\_game\_exists

```gdscript
func save_game_exists(id: int) -> bool
```

True whether the savegame identified by id does exist.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|id|`int`|Integer suffix of the savegame file.|yes|

#### Returns

Returns true whether the savegame identified by id does exist. (`bool`)
    
% ...
---
### save\_game

```gdscript
func save_game(id: int, p_savename: String) -> void
```

Save the current state of the game in a file suffixed with the id value. This id can help with slots development for the game developer.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|id|`int`|Integer suffix of the savegame file.|yes|
|p_savename|`String`|Name of the savegame.|yes|

#### Returns

Returns nothing.
    
% ...
---
### save\_game\_crash

```gdscript
func save_game_crash() -> int
```

Performs an emergency savegame in case of crash.

#### Parameters

None. 
#### Returns

Returns a `int` value. (`int`)
    
% ...
---
### load\_game

```gdscript
func load_game(id: int) -> void
```

Load a savegame file from its id.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|id|`int`|Integer suffix of the savegame file.|yes|

#### Returns

Returns nothing.

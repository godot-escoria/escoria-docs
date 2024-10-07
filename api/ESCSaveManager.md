<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCSaveManager

## Constants Descriptions

### CRASH\_SAVE\_NAME\_TEMPLATE

```gdscript
const CRASH_SAVE_NAME_TEMPLATE: String = "crash_autosave_%s_%s.tres"
```

Template for crash savegames filenames

### SAVE\_NAME\_TEMPLATE

```gdscript
const SAVE_NAME_TEMPLATE: String = "save_%03d.tres"
```

Template for savegames filenames

### SETTINGS\_TEMPLATE

```gdscript
const SETTINGS_TEMPLATE: String = "settings.tres"
```

Template for settings filename

## Property Descriptions

### save\_enabled

```gdscript
var save_enabled: bool = true
```

If true, saving a game is enabled. Else, saving is disabled

### save\_folder

```gdscript
var save_folder: String
```

Variable containing the saves folder obtained from Project Settings

### crash\_savegame\_filename

```gdscript
var crash_savegame_filename: String
```

Filename of the latest crash savegame file

### settings\_folder

```gdscript
var settings_folder: String
```

Variable containing the settings folder obtained from Project Settings

### is\_loading\_game

```gdscript
var is_loading_game: bool
```

True if escoria is currently loading a savegame. This is used to avoid
RoomManager to execute room's :setup and :ready events when loading a savegame

## Method Descriptions

### get\_saves\_list

```gdscript
func get_saves_list() -> Dictionary
```

Return a list of savegames metadata (id, date, name and game version)

### save\_game\_exists

```gdscript
func save_game_exists(id: int) -> bool
```

Returns true whether the savegame identified by id does exist

## Parameters
- id: integer suffix of the savegame file

### save\_game

```gdscript
func save_game(id: int, p_savename: String)
```

Save the current state of the game in a file suffixed with the id value.
This id can help with slots development for the game developer.

 ## Parameters
- id: integer suffix of the savegame file
- p_savename: name of the savegame

### save\_game\_crash

```gdscript
func save_game_crash()
```

Performs an emergency savegame in case of crash.

### load\_game

```gdscript
func load_game(id: int)
```

Load a savegame file from its id.

 ## Parameters
- id: integer suffix of the savegame file

## Signals

- signal game_is_loading(): 
- signal game_finished_loading(): 


  (escoria)=
# escoria

**Extends:** {ref}`Node <Node>`
        
## Description

This is Escoria's singleton script. It holds accessors to some utils, such as Escoria's logger.



## Constants

### DEFAULT
```gdscript
const DEFAULT = 0 # enum "GAME\_STATE"

```

### DIALOG
```gdscript
const DIALOG = 1 # enum "GAME\_STATE"

```

### WAIT
```gdscript
const WAIT = 2 # enum "GAME\_STATE"

```

### LOADING
```gdscript
const LOADING = 3 # enum "GAME\_STATE"

```

### PAUSED
```gdscript
const PAUSED = 4 # enum "GAME\_STATE"

```

### BUS\_MASTER
```gdscript
const BUS_MASTER = "Master"

```
Master audio bus
### BUS\_SFX
```gdscript
const BUS_SFX = "SFX"

```
SFX audio bus
### BUS\_MUSIC
```gdscript
const BUS_MUSIC = "Music"

```
Music audio bus
### BUS\_SPEECH
```gdscript
const BUS_SPEECH = "Speech"

```
Speech audio bus
### BUS\_AMBIENT
```gdscript
const BUS_AMBIENT = "Ambient"

```
Ambient sound audio bus
### CAMERA\_SCENE\_PATH
```gdscript
const CAMERA_SCENE_PATH = "res://addons/escoria-core/game/scenes/camera_player/camera.tscn"

```

### EscLogger
```gdscript
const EscLogger = <Object>

```

### GROUP\_ITEM\_CAN\_COLLIDE
```gdscript
const GROUP_ITEM_CAN_COLLIDE = "item_can_collide"

```
Group for ESCItem's that can be collided with in a scene. Used for quick
retrieval of such nodes to easily change their attributes at the same time.
### GROUP\_ITEM\_TRIGGERS
```gdscript
const GROUP_ITEM_TRIGGERS = "item_triggers"

```
Group for ESCItem's that are triggers
## Members
    
### logger

```gdscript
var logger: "addons/escoria-core/tools/logging/esc_logger.gd".ESCLoggerFile
```
    
### esc\_compiler

```gdscript
var esc_compiler: ESCCompiler
```

ESC Compiler instance
    
### object\_manager

```gdscript
var object_manager: ESCObjectManager
```

ESC Object Manager instance
    
### room\_manager

```gdscript
var room_manager: ESCRoomManager
```

ESC Room Manager instance
    
### di

```gdscript
var di: ESCDependencyInjector
```

ESC Dependency Injector
    
### inventory\_manager

```gdscript
var inventory_manager: ESCInventoryManager
```

Inventory manager instance
    
### action\_manager

```gdscript
var action_manager: ESCActionManager
```

Action manager instance
    
### event\_manager

```gdscript
var event_manager: ESCEventManager
```

Event manager instance
    
### globals\_manager

```gdscript
var globals_manager: ESCGlobalsManager
```

Globals registry instance
    
### command\_registry

```gdscript
var command_registry: ESCCommandRegistry
```

ASHES command registry instance
    
### settings\_manager

```gdscript
var settings_manager: ESCSettingsManager
```

Manager of game settings (resolution, sound, etc)
    
### resource\_cache

```gdscript
var resource_cache: ESCResourceCache
```

Resource cache handler
    
### dialog\_player

```gdscript
var dialog_player: ESCDialogPlayer
```

Dialog player instantiator. This instance is called directly for dialogs.
    
### interpreter\_factory

```gdscript
var interpreter_factory: ESCInterpreterFactory
```

ESCScript interpreter factory instance
    
### inputs\_manager

```gdscript
var inputs_manager: ESCInputsManager
```

Inputs manager instance
    
### save\_manager

```gdscript
var save_manager: ESCSaveManager
```

Savegames and settings manager
    
### game\_scene

```gdscript
var game_scene: ESCGame
```

The game scene loaded
    
### player\_camera

```gdscript
var player_camera: ESCCamera
```

The main player camera
    
### start\_script

```gdscript
var start_script: ESCScript
```

The compiled start script loaded from ProjectSettings escoria/main/game_start_script
    
### action\_default\_script

```gdscript
var action_default_script: ESCScript
```

The "fallback" script to use when an action is tried on an item that hasn't been explicitly scripted.
    
### is\_direct\_room\_run

```gdscript
var is_direct_room_run: bool
```

Whether we ran a room directly from editor, not a full game
    
### is\_quitting

```gdscript
var is_quitting: bool
```

Whether we're quitting the game
    
### room\_terrain

```gdscript
var room_terrain: Variant
```

Terrain of the current room
    
### inventory

```gdscript
var inventory: Variant
```

Inventory scene
    
### main

```gdscript
var main: Variant
```

The main scene
    
### creating\_new\_game

```gdscript
var creating_new_game: bool
```

Whether Escoria is creating a new game
    
### game\_size

```gdscript
var game_size: Variant
```

Game actual resolution obtained from viewport.
    
### current\_state

```gdscript
var current_state: Variant
```

Current state of Escoria (GAME_STATE enum)

## Signals

### paused

```gdscript
signal paused()
```

Signal sent when Escoria is paused

#### Parameters

None. 


### resumed

```gdscript
signal resumed()
```

Signal sent when Escoria is resumed from pause

#### Parameters

None. 


## Methods
    
% ...
---
### init\_main\_scene

```gdscript
func init_main_scene() -> void
```

Initializes the Escoria main scene as child of the Escoria autoloaded scene.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### get\_escoria

```gdscript
func get_escoria() -> Variant
```

Get the Escoria node. That node gives access to the Escoria scene that's instanced by the main_scene (if full game is run) or by this autoload if room is run directly.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### set\_game\_paused

```gdscript
func set_game_paused(p_paused: bool) -> void
```

Pauses or unpause the game

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_paused|`bool`|if true, pauses the game. If false, unpauses the game.|yes|

#### Returns

Returns nothing.
    
% ...
---
### new\_game

```gdscript
func new_game() -> void
```

Called from main menu's "new game" button.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### quit

```gdscript
func quit() -> void
```

Called from main menu's "quit" button.

#### Parameters

None. 
#### Returns

Returns nothing.

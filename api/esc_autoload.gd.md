<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# esc\_autoload.gd

**Extends:** [Node](../Node)

## Description

This is Escoria's singleton script.
It holds accessors to some utils, such as Escoria's logger.

## Enumerations

### GAME\_STATE

```gdscript
const GAME_STATE: Dictionary = {"DEFAULT":0,"DIALOG":1,"WAIT":2}
```

Current game state
* DEFAULT: Common game function
* DIALOG: Game is playing a dialog
* WAIT: Game is waiting

## Constants Descriptions

### BUS\_MASTER

```gdscript
const BUS_MASTER: String = "Master"
```

Audio bus indices.

### BUS\_MUSIC

```gdscript
const BUS_MUSIC: String = "Music"
```

### BUS\_SFX

```gdscript
const BUS_SFX: String = "SFX"
```

### BUS\_SPEECH

```gdscript
const BUS_SPEECH: String = "Speech"
```

### CAMERA\_SCENE\_PATH

```gdscript
const CAMERA_SCENE_PATH: String = "res://addons/escoria-core/game/scenes/camera_player/camera.tscn"
```

Path to camera scene

### Logger

```gdscript
const Logger: GDScript = preload("res://addons/escoria-core/game/esc_logger.gd")
```

Logger class

## Property Descriptions

### logger

```gdscript
var logger
```

Logger instance

### esc\_compiler

```gdscript
var esc_compiler
```

ESC Compiler

### object\_manager

```gdscript
var object_manager
```

ESC Object Manager

### room\_manager

```gdscript
var room_manager
```

ESC Room Manager

### room\_terrain

```gdscript
var room_terrain
```

Terrain of the current room

### inventory\_manager

```gdscript
var inventory_manager: ESCInventoryManager
```

The inventory manager instance

### action\_manager

```gdscript
var action_manager: ESCActionManager
```

The action manager instance

### event\_manager

```gdscript
var event_manager: ESCEventManager
```

ESC Event manager instance

### globals\_manager

```gdscript
var globals_manager: ESCGlobalsManager
```

ESC globals registry instance

### command\_registry

```gdscript
var command_registry: ESCCommandRegistry
```

ESC command registry instance

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

### inventory

```gdscript
var inventory
```

Inventory scene

### main

```gdscript
var main
```

The main scene

### inputs\_manager

```gdscript
var inputs_manager: ESCInputsManager
```

The escoria inputs manager

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

The compiled start script loaded from ProjectSettings
escoria/main/game_start_script

### is\_direct\_room\_run

```gdscript
var is_direct_room_run: bool = false
```

Whether we ran a room directly from editor, not a full game

### is\_quitting

```gdscript
var is_quitting: bool = false
```

Whether we're quitting the game

### game\_size

```gdscript
var game_size
```

The game resolution

### current\_state

```gdscript
var current_state
```

The current state of the game

## Method Descriptions

### get\_escoria

```gdscript
func get_escoria()
```

Get the Escoria node. That node gives access to the Escoria scene that's
instanced by the main_scene (if full game is run) or by this autoload if
room is run directly.

### set\_game\_paused

```gdscript
func set_game_paused(p_paused: bool)
```

Pauses or unpause the game

#### Parameters
- p_paused: if true, pauses the game. If false, unpauses the game.

### new\_game

```gdscript
func new_game()
```

Called from main menu's "new game" button

### quit

```gdscript
func quit()
```

Called from main menu's "quit" button

## Signals

- signal paused():  Signal sent when Escoria is paused
- signal resumed(): Signal sent when Escoria is resumed from pause

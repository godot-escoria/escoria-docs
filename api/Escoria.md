<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Escoria

**Extends:** [Node](../Node)

## Description

The escoria main script

## Constants Descriptions

### ESCORIA\_CORE\_PLUGIN\_NAME

```gdscript
const ESCORIA_CORE_PLUGIN_NAME: String = "escoria-core"
```

Name of the Escoria core plugin

## Property Descriptions

### main

```gdscript
var main
```

The main scene

## Method Descriptions

### init

```gdscript
func init()
```

Called by Escoria's main_scene as very very first event EVER.
Usually you'll want to show some logos animations before spawning the main
menu in the escoria/main/game_start_script 's :init event

### run\_event\_from\_script

```gdscript
func run_event_from_script(script: ESCScript, event_name: String)
```

Runs the event "event_name" from the "script" ESC script.

#### Parameters
- script: ESC script containing the event to run. The script must have been
loaded.
- event_name: Name of the event to run

### new\_game

```gdscript
func new_game()
```

Called from escoria autoload to start a new game.

### quit

```gdscript
func quit()
```

Function called to quit the game.

### is\_ready\_for\_inputs

```gdscript
func is_ready_for_inputs() -> bool
```

Used by game.gd to determine whether the game scene is ready to take inputs
from the _input() function. To do so, the current_scene must be set, the game
scene must be set, and the game scene must've been notified that the room
is ready.

*Returns*
true if game scene is ready for inputs

## Signals

- signal request_pause_menu(): Signal sent when pause menu has to be displayed

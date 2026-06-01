
  (Escoria)=
# Escoria

**Extends:** {ref}`Node <Node>`
        
## Description

The main Escoria script.



## Constants

### ESCORIA\_CORE\_PLUGIN\_NAME
```gdscript
const ESCORIA_CORE_PLUGIN_NAME = "escoria-core"

```
Name of the Escoria core plugin
## Members
    
### main

```gdscript
var main: Variant
```

The main scene

## Signals

### request\_pause\_menu

```gdscript
signal request_pause_menu()
```

Signal sent when pause menu has to be displayed

#### Parameters

None. 


## Methods
    
% ...
---
### init

```gdscript
func init() -> void
```

Initializer called by Escoria's main_scene as very very first event EVER. Usually you'll want to show some logos animations before spawning the main menu in the escoria/main/game_start_script 's `:init` event

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### run\_event\_from\_script

```gdscript
func run_event_from_script(script: ESCScript, event_name: String, _from_statement_id: int) -> Variant
```

Runs the event "event_name" from the "script" ESC script.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|script|`ESCScript`|ESC script containing the event to run. The script must have been loaded.|yes|
|event_name|`String`|Name of the event to run|yes|
|from_statement_id|`int`|Statement id to start from (default 0)|no|

#### Returns

Returns ESCExecution. Waits for the event to finish before returning. (`Variant`)
    
% ...
---
### new\_game

```gdscript
func new_game() -> void
```

Called from escoria autoload to start a new game.

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

Function called to quit the game.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### is\_ready\_for\_inputs

```gdscript
func is_ready_for_inputs() -> bool
```

Used by game.gd to determine whether the game scene is ready to take inputs from the _input() function. To do so, the current_scene must be set, the game scene must be set, and the game scene must've been notified that the room is ready.

#### Parameters

None. 
#### Returns

Returns true if game scene is ready for inputs. (`bool`)

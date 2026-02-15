
  ("addons/escoria-core/game/scenes/esc_prompt/esc_prompt_popup.gd")=
# "addons/escoria-core/game/scenes/esc_prompt/esc_prompt_popup.gd"

**Extends:** {ref}`Window <Window>`
        
## Description

A debug window which can run esc commands



## Constants

### COMMANDS\_HISTORY\_LENGTH
```gdscript
const COMMANDS_HISTORY_LENGTH = 20

```
The maximum number of commands to keep in history
## Members
    
### past\_actions

```gdscript
var past_actions: Variant
```

Reference to the past actions display
    
### command

```gdscript
var command: Variant
```

Reference to the command input
    
### commands\_history

```gdscript
var commands_history: PackedStringArray
```

History of typed commands
    
### commands\_history\_current\_id

```gdscript
var commands_history_current_id: int
```

The current index in the command history

## Methods

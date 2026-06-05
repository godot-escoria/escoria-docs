
  (ESCExitSceneScriptAnalyzer)=
# ESCExitSceneScriptAnalyzer

**Extends:** {ref}`ESCScriptAnalyzer <ESCScriptAnalyzer>`
        
## Description





## Constants

### EXIT\_SCENE\_EVENT\_NAME
```gdscript
const EXIT_SCENE_EVENT_NAME = "exit_scene"

```

### ACCEPT\_INPUT\_DISABLE\_ARGS
```gdscript
const ACCEPT_INPUT_DISABLE_ARGS = ["none", "skip"]

```

### CHANGE\_SCENE\_MISSING\_MESSAGE
```gdscript
const CHANGE_SCENE_MISSING_MESSAGE = "Event \':exit_scene\' is missing \'change_scene\' command. Scene might not change as expected. Ignore this warning if the command was omitted on purpose."

```

### COMMANDS\_AFTER\_CHANGE\_SCENE\_MESSAGE
```gdscript
const COMMANDS_AFTER_CHANGE_SCENE_MESSAGE = "Event \':exit_scene\' may have commands that are expected to be run after a call to \'change_scene\'. Such commands will not be executed."

```

### MISSING\_ACCEPT\_INPUT\_MESSAGE
```gdscript
const MISSING_ACCEPT_INPUT_MESSAGE = "Event \':exit_scene\' may allow for the player character to move while exiting and changing the scene. To prevent this, ensure a call to \'accept_input\' with an argument evaluating to \'NONE\' or \'SKIP\' is made before any calls to \'transition\' and/or \'change_scene\'."

```

### BULLET\_CHARACTER
```gdscript
const BULLET_CHARACTER = "- "

```

## Members
    
### transition\_command\_name

```gdscript
var transition_command_name: Variant
```
    
### change\_scene\_command\_name

```gdscript
var change_scene_command_name: Variant
```
    
### accept\_input\_command\_name

```gdscript
var accept_input_command_name: Variant
```

## Methods
    
% ...
---
### analyze

```gdscript
func analyze(statements: Array) -> void
```
    
% ...
---
### visit\_call\_expr

```gdscript
func visit_call_expr(expr: ESCGrammarExprs.Call) -> Variant
```

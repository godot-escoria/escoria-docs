
  (ESCCommandRegistry)=
# ESCCommandRegistry

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

A registry of ASHES command objects.



## Members
    
### registry

```gdscript
var registry: Dictionary
```

The registry of registered commands.

## Methods
    
% ...
---
### load\_command

```gdscript
func load_command(command_name: String) -> ESCBaseCommand
```

Load a command by its name.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command_name|`String`|Name of command to load.|yes|

#### Returns

Returns a `ESCBaseCommand` value. (`ESCBaseCommand`)
    
% ...
---
### is\_command\_or\_control\_pressed

```gdscript
func is_command_or_control_pressed(command_name: String) -> ESCBaseCommand
```

Retrieves a command from the command registry.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command_name|`String`|The name of the command.|yes|

#### Returns

Returns a `ESCBaseCommand` value. (`ESCBaseCommand`)

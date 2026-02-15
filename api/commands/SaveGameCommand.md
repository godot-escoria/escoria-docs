
  (SaveGameCommand)=
# SaveGameCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`save_game(slot_id: Integer, savegame_description: String)`

Saves the game in the [slot_id] slot, and sets the [savegame_description] in the savegame name/title. Example: `save_game 1 "description of save game"`

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|slot_id|`Integer`|Numeric slot index to store the save data in.|yes|
|savegame_description|`String`|Text shown to players when listing this save slot.|yes|

 

## Methods
    
% ...
---
### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

The descriptor of the arguments of this command.

#### Parameters

None. 
#### Returns

Returns the descriptor of the arguments of this command. The argument descriptor for this command. (`ESCCommandArgumentDescriptor`)
    
% ...
---
### validate

```gdscript
func validate(arguments: Array) -> Variant
```

Validates whether the given arguments match the command descriptor.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|arguments|`Array`|The arguments to validate.|yes|

#### Returns

Returns True if the arguments are valid, false otherwise. (`bool`)
    
% ...
---
### run

```gdscript
func run(command_params: Array) -> int
```

Runs the command.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command_params|`Array`|The parameters for the command.|yes|

#### Returns

Returns the execution result code. (`int`)
    
% ...
---
### interrupt

```gdscript
func interrupt() -> void
```

Function called when the command is interrupted.

#### Parameters

None. 
#### Returns

Returns nothing.

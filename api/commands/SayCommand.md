
  (SayCommand)=
# SayCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`say(player: String, text: String[, key: String[, type: String]])`

Displays the specified string as dialog spoken by the player. This command blocks further event execution until the dialog has finished being 'said' (either as displayed text or as audible speech from a file). Global variables can be substituted into the text by wrapping the global name in braces, e.g. say player "I have {coin_count} coins remaining".

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|player|`String`|Global ID of the `ESCPlayer` or `ESCItem` object that is active. You can specify `current_player` in order to refer to the currently active player, e.g. in cases where multiple players are playable such as in games like Maniac Mansion or Day of the Tentacle.|yes|
|text|`String`|Text to display.|yes|
|key|`String`|Translation key (default: nil)|no|
|type|`String`|Dialog type to use. One of `floating` or `avatar`. (default: the value set in the setting "Escoria/UI/Default Dialog Type") The text supports translation keys by prepending the key followed by a colon (`:`) to the text. For more details see: https://docs.escoria-framework.org/en/devel/getting_started/dialogs.html#translations Playing an audio file while the text is being displayed is also supported by this mechanism. For more details see: https://docs.escoria-framework.org/en/devel/getting_started/dialogs.html#recorded_speech Example: `say(player, "Picture's looking good.", "ROOM1_PICTURE")`|no|

 

## Constants

### CURRENT\_PLAYER\_KEYWORD
```gdscript
const CURRENT_PLAYER_KEYWORD = "CURRENT_PLAYER"

```
The keyword used to refer to the current player
## Members
    
### globals\_regex

```gdscript
var globals_regex: RegEx
```

Regex to match global variables in strings

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

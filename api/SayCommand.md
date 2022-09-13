<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SayCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`say player text [type]`

Displays the specified string as dialog spoken by the player. This command
blocks further event execution until the dialog has finished being 'said'
(either as displayed text or as audible speech from a file).

Global variables can be substituted into the text by wrapping the global
name in braces.
e.g. say player "I have {coin_count} coins remaining".

**Parameters**

- *player*: Global ID of the `ESCPlayer` or `ESCItem` object that is active.
	You can specify `current_player` in order to refer to the currently active
	player, e.g. in cases where multiple players are playable such as in games
	like Maniac Mansion or Day of the Tentacle.
- *text*: Text to display.
- *type*: Dialog type to use. One of `floating` or `avatar`.
  (default: the value set in the setting "Escoria/UI/Default Dialog Type")

The text supports translation keys by prepending the key followed by
a colon (`:`) to the text.
For more details see: https://docs.escoria-framework.org/en/devel/getting_started/dialogs.html#translations

Playing an audio file while the text is being
displayed is also supported by this mechanism.
For more details see: https://docs.escoria-framework.org/en/devel/getting_started/dialogs.html#recorded_speech

Example: `say player ROOM1_PICTURE:"Picture's looking good."`

@ESC

## Constants Descriptions

### CURRENT\_PLAYER\_KEYWORD

```gdscript
const CURRENT_PLAYER_KEYWORD: String = "CURRENT_PLAYER"
```

## Property Descriptions

### globals\_regex

```gdscript
var globals_regex: RegEx
```

Regex to match global variables in strings

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

### validate

```gdscript
func validate(arguments: Array)
```

Validate whether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> var
```

Run the command

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.
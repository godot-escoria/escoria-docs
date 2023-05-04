<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCDialogManager

**Extends:** [Control](../Control)

## Description

A base class for dialog plugins to work with Escoria

## Method Descriptions

### has\_type

```gdscript
func has_type(type: String) -> bool
```

Check whether a specific type is supported by the
dialog plugin

#### Parameters
- type: required type
*Returns* Whether the type is supported or not

### has\_chooser\_type

```gdscript
func has_chooser_type(type: String) -> bool
```

Check whether a specific chooser type is supported by the
dialog plugin

#### Parameters
- type: required chooser type
*Returns* Whether the type is supported or not

### say

```gdscript
func say(dialog_player: Node, global_id: String, text: String, type: String)
```

Output a text said by the item specified by the global id. Emit
`say_finished` after finishing displaying the text.

#### Parameters
- dialog_player: Node of the dialog player in the UI
- global_id: Global id of the item that is speaking
- text: Text to say, optional prefixed by a translation key separated
  by a ":"
- type: Type of dialog box to use

### choose

```gdscript
func choose(dialog_player: Node, dialog: ESCDialog, type: String)
```

Present an option chooser to the player and sends the signal
`option_chosen` with the chosen dialog option

#### Parameters
- dialog_player: Node of the dialog player in the UI
- dialog: Information about the dialog to display
- type: The dialog chooser type to use

### speedup

```gdscript
func speedup()
```

Trigger running the dialogue faster

### finish

```gdscript
func finish()
```

Trigger an instant finish of the current dialog

### interrupt

```gdscript
func interrupt()
```

The say command has been interrupted, cancel the dialog display

### voice\_audio\_finished

```gdscript
func voice_audio_finished()
```

To be called if voice audio has finished.

## Signals

- signal say_finished(): Emitted when the say function has completed showing the text
- signal say_visible(): Emitted when text has just become fully visible
- signal option_chosen(option): Emitted when the player has chosen an option

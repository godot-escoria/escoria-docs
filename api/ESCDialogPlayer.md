<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCDialogPlayer

**Extends:** [Node](../Node)

## Description

Escoria dialog player

## Constants Descriptions

### DIALOG\_TYPE\_CHOOSE

```gdscript
const DIALOG_TYPE_CHOOSE: String = "choose"
```

### DIALOG\_TYPE\_SAY

```gdscript
const DIALOG_TYPE_SAY: String = "say"
```

Used when specifying dialog types in various methods

## Method Descriptions

### say

```gdscript
func say(character: String, type: String, text: String) -> void
```

Make a character say some text

#### Parameters

- character: Character that is talking
- type: UI to use for the dialog
- text: Text to say

### start\_dialog\_choices

```gdscript
func start_dialog_choices(dialog: ESCDialog, type: String = "simple")
```

Display a list of choices

#### Parameters

- dialog: The dialog to start
- type: The dialog chooser type to use (default: "simple")

### interrupt

```gdscript
func interrupt() -> void
```

Interrupt the currently running dialog

## Signals

- signal option_chosen(option): Emitted when an answer as chosem

##### Parameters

- option: The dialog option that was chosen
- signal say_finished(): Emitted when a say command finished

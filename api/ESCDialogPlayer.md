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

### enable\_preserve\_dialog\_box

```gdscript
func enable_preserve_dialog_box() -> void
```

Instructs the dialog manager to preserve the next dialog box used by a `say`
command until a call to `disable_preserve_dialog_box` is made.

This method should be idempotent, i.e. if called after the first time and
prior to `disable_preserve_dialog_box` being called, the result should be the
same.

### disable\_preserve\_dialog\_box

```gdscript
func disable_preserve_dialog_box() -> void
```

Instructs the dialog manager to no longer preserve the currently-preserved
dialog box or to not preserve the next dialog box used by a `say` command
(this is the default state).

This method should be idempotent, i.e. if called after the first time and
prior to `enable_preserve_dialog_box` being called, the result should be the
same.

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

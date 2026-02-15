
  (ESCDialogPlayer)=
# ESCDialogPlayer

**Extends:** {ref}`Control <Control>`
        
## Description

Escoria dialog player



## Constants

### DIALOG\_TYPE\_SAY
```gdscript
const DIALOG_TYPE_SAY = "say"

```
Used when specifying dialog types in various methods.
### DIALOG\_TYPE\_CHOOSE
```gdscript
const DIALOG_TYPE_CHOOSE = "choose"

```
Used when specifying dialog types in various methods.
## Members

## Signals

### option\_chosen

```gdscript
signal option_chosen(option: Variant)
```

Emitted when an answer is chosen.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|option|`Variant`|The dialog option that was chosen.|yes|



### say\_finished

```gdscript
signal say_finished()
```

Emitted when a say command finished.

#### Parameters

None. 


## Methods
    
% ...
---
### enable\_preserve\_dialog\_box

```gdscript
func enable_preserve_dialog_box() -> void
```

Instructs the dialog manager to preserve the next dialog box used by a `say` command until a call to `disable_preserve_dialog_box` is made. This method should be idempotent, i.e. if called after the first time and prior to `disable_preserve_dialog_box` being called, the result should be the same.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### disable\_preserve\_dialog\_box

```gdscript
func disable_preserve_dialog_box() -> void
```

Instructs the dialog manager to no longer preserve the currently-preserved dialog box or to not preserve the next dialog box used by a `say` command (this is the default state). This method should be idempotent, i.e. if called after the first time and prior to `enable_preserve_dialog_box` being called, the result should be the same.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### say

```gdscript
func say(character: String, type: String, text: String, key: String) -> void
```

Makes a character say some text.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|character|`String`|Character that is talking.|yes|
|type|`String`|UI to use for the dialog.|yes|
|text|`String`|Text to say.|yes|
|key|`String`|Translation key.|yes|

#### Returns

Returns nothing.
    
% ...
---
### start\_dialog\_choices

```gdscript
func start_dialog_choices(dialog: ESCDialog, type: String) -> void
```

Displays a list of choices.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|dialog|`ESCDialog`|The dialog to start.|yes|
|type|`String`|The dialog chooser type to use (default: "simple").|no|

#### Returns

Returns nothing.
    
% ...
---
### interrupt

```gdscript
func interrupt() -> void
```

Interrupts the currently running dialog.

#### Parameters

None. 
#### Returns

Returns nothing.


  (ESCDialogManager)=
# ESCDialogManager

**Extends:** {ref}`Control <Control>`
        
## Description

A base class for dialog plugins to work with Escoria 



## Signals

### say\_finished

```gdscript
signal say_finished()
```

Emitted when the say function has completed showing the text

#### Parameters

None. 


### say\_visible

```gdscript
signal say_visible()
```

Emitted when text has just become fully visible

#### Parameters

None. 


### option\_chosen

```gdscript
signal option_chosen(option: Variant)
```

Emitted when the player has chosen an option

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|option|`Variant`|Dialog option chosen by the player.|yes|



## Methods
    
% ...
---
### has\_type

```gdscript
func has_type(_type: String) -> bool
```

Checks whether a specific type is supported by the dialog plugin.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|type|`String`|Required type.|yes|

#### Returns

Returns whether the type is supported or not. (`bool`)
    
% ...
---
### has\_chooser\_type

```gdscript
func has_chooser_type(_type: String) -> bool
```

Checks whether a specific chooser type is supported by the dialog plugin.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|type|`String`|Required chooser type.|yes|

#### Returns

Returns whether the type is supported or not. (`bool`)
    
% ...
---
### say

```gdscript
func say(_dialog_player: Node, _global_id: String, _text: String, _type: String, _key: String) -> void
```

Outputs a text said by the item specified by the global id and emits `say_finished` after finishing displaying the text.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|dialog_player|`Node`|Node of the dialog player in the UI.|yes|
|global_id|`String`|Global id of the item that is speaking.|yes|
|text|`String`|Text to say, optional prefixed by a translation key separated by a ":".|yes|
|type|`String`|Type of dialog box to use.|yes|
|key|`String`|Translation key.|yes|

#### Returns

Returns nothing.
    
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
### choose

```gdscript
func choose(_dialog_player: Node, _dialog: ESCDialog, _type: String) -> void
```

Presents an option chooser to the player and sends the signal `option_chosen` with the chosen dialog option.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|dialog_player|`Node`|Node of the dialog player in the UI.|yes|
|dialog|`ESCDialog`|Information about the dialog to display.|yes|
|type|`String`|The dialog chooser type to use.|yes|

#### Returns

Returns nothing.
    
% ...
---
### speedup

```gdscript
func speedup() -> void
```

Triggers running the dialogue faster.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### finish

```gdscript
func finish() -> void
```

Triggers an instant finish of the current dialog.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### interrupt

```gdscript
func interrupt() -> void
```

The say command has been interrupted, cancel the dialog display.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### voice\_audio\_finished

```gdscript
func voice_audio_finished() -> void
```

To be called if voice audio has finished.

#### Parameters

None. 
#### Returns

Returns nothing.

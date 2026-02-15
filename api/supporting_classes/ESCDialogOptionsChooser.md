
  (ESCDialogOptionsChooser)=
# ESCDialogOptionsChooser

**Extends:** {ref}`Control <Control>`
        
## Description

Base class for all dialog options implementations



## Members
    
### dialog

```gdscript
var dialog: ESCDialog
```

The dialog to show

## Signals

### option\_chosen

```gdscript
signal option_chosen(option: Variant)
```

Emitted when an option is chosen.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|option|`Variant`|The dialog option that was chosen.|yes|



## Methods
    
% ...
---
### set\_dialog

```gdscript
func set_dialog(new_dialog: ESCDialog) -> void
```

Sets the dialog used for the chooser.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|new_dialog|`ESCDialog`|Dialog to set.|yes|

#### Returns

Returns nothing.
    
% ...
---
### show\_chooser

```gdscript
func show_chooser() -> void
```

Shows the dialog chooser UI.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### hide\_chooser

```gdscript
func hide_chooser() -> void
```

Hides the dialog chooser UI.

#### Parameters

None. 
#### Returns

Returns nothing.

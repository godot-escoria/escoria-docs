
  (ESCDialogOption)=
# ESCDialogOption

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

A single option used as part of a dialog.

`ESCDialog` makes use of these when assembling an actual dialog in Escoria.

## Members
    
### option

```gdscript
var option: String
```

Option text displayed in the HUD.
    
### translation\_key

```gdscript
var translation_key: String
```

Explicit translation key for the option text.
    
### source\_option

```gdscript
var source_option: Variant
```

Maps back to the parsed source option.
    
### source\_option\_index

```gdscript
var source_option_index: int
```

One-based index of this option in its authored dialog block.

## Methods
    
% ...
---
### get\_translated\_option

```gdscript
func get_translated_option() -> String
```

The translated version of the option, if one exists; otherwise, the default text is returned.

#### Parameters

None. 
#### Returns

Returns the translated version of the option, if one exists; otherwise, the default text is returned. (`String`)
    
% ...
---
### is\_valid

```gdscript
func is_valid() -> bool
```

Whether this dialog option is valid. Note: this value isn't currently used as part of any meaningful validation checks.

#### Parameters

None. 
#### Returns

Returns whether this dialog option is valid. Note: this value isn't currently used as part of any meaningful validation checks. (`bool`)
    
% ...
---
### set\_is\_valid

```gdscript
func set_is_valid(value: bool) -> void
```

Sets whether the option is valid, although this value isn't currently used as part of any useful checks.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|value|`bool`|`true` to mark the option as valid; `false` to invalidate it.|yes|

#### Returns

Returns nothing.

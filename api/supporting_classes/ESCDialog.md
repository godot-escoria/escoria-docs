
  (ESCDialog)=
# ESCDialog

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Represents a dialog in Escoria.



## Members
    
### avatar

```gdscript
var avatar: String
```

Avatar used in the dialog, if any.
    
### timeout

```gdscript
var timeout: int
```

Timeout until the timeout_option option is selected. Use 0 for no timeout.
    
### timeout\_option

```gdscript
var timeout_option: int
```

The dialog option to select when timeout is reached.
    
### options

```gdscript
var options: Array
```

A list of `ESCDialogOption`s.

## Methods
    
% ...
---
### is\_valid

```gdscript
func is_valid() -> bool
```

True iff the dialog and its settings are valid.

#### Parameters

None. 
#### Returns

Returns true iff the dialog and its settings are valid. (`bool`)
    
% ...
---
### run

```gdscript
func run() -> Variant
```

Run this dialog. TODO: Although this method overrides its parent version, the return type here does NOT match the parent's signature. Consider either changing the parent's return type to be a `Variant`, or doing something to ensure greater consistency.

#### Parameters

None. 
#### Returns

Returns the `ESCDialogOption` chosen by the player. (`Variant`)

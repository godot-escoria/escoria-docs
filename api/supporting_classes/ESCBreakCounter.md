
  (ESCBreakCounter)=
# ESCBreakCounter

**Extends:** {ref}`Object <Object>`
        
## Description

Used by the intpreter to track the depth of a `break` statement invoked in a dialog.



## Members

## Methods
    
% ...
---
### set\_levels\_left

```gdscript
func set_levels_left(levels: int) -> void
```

Sets the depth from the root of the dialog tree, with `levels == 0` at the root.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|levels|`int`|Number of dialog nesting levels remaining (0 represents the root).|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_levels\_left

```gdscript
func get_levels_left() -> int
```

Gets the depth from the root of the dialog tree, with `levels == 0` at the root.

#### Parameters

None. 
#### Returns

Returns a `int` value. (`int`)
    
% ...
---
### dec\_levels\_left

```gdscript
func dec_levels_left() -> void
```

Decrements by one the depth from the root of the dialog tree, with `levels == 0` at the root.

#### Parameters

None. 
#### Returns

Returns nothing.

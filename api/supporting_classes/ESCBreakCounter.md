
  (ESCBreakCounter)=
# ESCBreakCounter

**Extends:** {ref}`Object <Object>`
        
## Description

Used by the intpreter to track dialog `break` propagation state.



## Members

## Methods
    
% ...
---
### set\_levels\_left

```gdscript
func set_levels_left(levels: int) -> void
```

Sets the remaining number of dialog levels to unwind before control should return to a parent dialog, where `levels == 0` means the unwind has reached the parent dialog that should resume.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|levels|`int`|Number of dialog nesting levels still to exit before resuming a parent dialog.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_levels\_left

```gdscript
func get_levels_left() -> int
```

Gets the remaining number of dialog levels to unwind before control should return to a parent dialog, where `levels == 0` means the unwind has reached the parent dialog that should resume.

#### Parameters

None. 
#### Returns

Returns an `int` value.
    
% ...
---
### has\_levels\_left

```gdscript
func has_levels_left() -> bool
```

Returns whether more dialog levels still need to be exited before reaching the parent dialog that should resume.

#### Parameters

None. 
#### Returns

Returns `true` if additional dialog levels must still be unwound, otherwise `false`. (`bool`)
    
% ...
---
### advance\_up\_one\_level

```gdscript
func advance_up_one_level() -> void
```

Advances the dialog-break state upward by one dialog level.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### mark\_resume\_parent\_dialog

```gdscript
func mark_resume_parent_dialog() -> void
```

Marks the dialog-break state so the receiving dialog frame resumes its own option loop instead of concluding.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### should\_resume\_parent\_dialog

```gdscript
func should_resume_parent_dialog() -> bool
```

Returns whether the receiving dialog frame should resume its option loop.

#### Parameters

None. 
#### Returns

Returns `true` if the parent dialog should resume, otherwise `false`. (`bool`)
    
% ...
---
### consume\_parent\_resume

```gdscript
func consume_parent_resume() -> void
```

Clears the resume-parent-dialog state after it has been consumed by a dialog frame.

#### Parameters

None. 
#### Returns

Returns nothing.

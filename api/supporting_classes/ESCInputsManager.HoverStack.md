
  (ESCInputsManager.HoverStack)=
# ESCInputsManager.HoverStack

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Hover Stack implementation.



## Members
    
### hover\_stack

```gdscript
var hover_stack: Array
```

Array representing the hover stack

## Signals

### hover\_stack\_changed

```gdscript
signal hover_stack_changed()
```

Emitted when the content of the hover stack has changed

#### Parameters

None. 


### hover\_stack\_emptied

```gdscript
signal hover_stack_emptied()
```

Emitted when the hover stack was emptied

#### Parameters

None. 


## Methods
    
% ...
---
### add\_item

```gdscript
func add_item(item: Variant) -> void
```

Add the given item to the stack if not already in it.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`Variant`|the item to add to the hover stack|yes|

#### Returns

Returns nothing.
    
% ...
---
### add\_items

```gdscript
func add_items(items: Array) -> void
```

Add the items contained in given list to the stack if not already in it.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|items|`Array`|the items list (array) to add to the hover stack|yes|

#### Returns

Returns nothing.
    
% ...
---
### clean

```gdscript
func clean() -> void
```

Clean the hover stack

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### pop\_top\_item

```gdscript
func pop_top_item() -> Variant
```

Pops the top element of the hover stack and returns it

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### get\_top\_item

```gdscript
func get_top_item() -> Variant
```

The top element of the hover stack

#### Parameters

None. 
#### Returns

Returns the top element of the hover stack. (`Variant`)
    
% ...
---
### erase\_item

```gdscript
func erase_item(item: Variant) -> void
```

Remove the given item from the stack

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`Variant`|the item to remove from the hover stack|yes|

#### Returns

Returns nothing.
    
% ...
---
### clear

```gdscript
func clear() -> void
```

Clear the stack of hovered items

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### is\_empty

```gdscript
func is_empty() -> bool
```

True if the hover stack is empty, else false

#### Parameters

None. 
#### Returns

Returns true if the hover stack is empty, else false. (`bool`)
    
% ...
---
### has

```gdscript
func has(item: Variant) -> bool
```

True if the hover stack contains the given item

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`Variant`|the item to search|yes|

#### Returns

Returns true if the hover stack contains the given item. (`bool`)
    
% ...
---
### get\_all

```gdscript
func get_all() -> Array
```

The hover stack array

#### Parameters

None. 
#### Returns

Returns the hover stack array. (`Array`)

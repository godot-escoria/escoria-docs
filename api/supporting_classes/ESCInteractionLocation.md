
  (ESCInteractionLocation)=
# ESCInteractionLocation

**Extends:** {ref}`ESCLocation <ESCLocation>`
        
## Description

 A simple node extending Position2D with a global ID so that it can be referenced in ESC Scripts. Movement-based commands like `walk_to_pos` will automatically use an `ESCLocation` that is a child of the destination node.
Commands like `turn_to`--which are not movement-based--will ignore child `ESCLocation`s and refer to the parent node.



## Methods
    
% ...
---
### is\_class

```gdscript
func is_class(p_classname: String) -> bool
```

Whether this object's class is the same as given string class name.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_classname|`String`|String class to compare against|yes|

#### Returns

Returns a `bool` value. (`bool`)

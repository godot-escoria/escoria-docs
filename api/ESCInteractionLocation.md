<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCInteractionLocation

**Extends:** [ESCLocation](../ESCLocation) < [Position2D](../Position2D)

## Description

 A simple node extending Position2D with a global ID so that it can be
referenced in ESC Scripts. Movement-based commands like `walk_to_pos` will
automatically use an `ESCLocation` that is a child of the destination node.
Commands like `turn_to`--which are not movement-based--will ignore child
`ESCLocation`s and refer to the parent node.

## Method Descriptions

### is\_class

```gdscript
func is_class(p_classname: String) -> bool
```

p_classname: String class to compare against
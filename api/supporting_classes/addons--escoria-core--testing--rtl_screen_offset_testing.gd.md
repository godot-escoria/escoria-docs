
  ("addons/escoria-core/testing/rtl_screen_offset_testing.gd")=
# "addons/escoria-core/testing/rtl_screen_offset_testing.gd"

**Extends:** {ref}`Control <Control>`
        
## Description





## Constants

### ONE\_LINE\_HEIGHT
```gdscript
const ONE_LINE_HEIGHT = 16

```

### MIN\_HEIGHT
```gdscript
const MIN_HEIGHT = 30

```

### MAX\_HEIGHT
```gdscript
const MAX_HEIGHT = 500

```

## Members
    
### screen\_width

```gdscript
var screen_width: Variant
```
    
### screen\_height

```gdscript
var screen_height: Variant
```
    
### global\_distance\_to\_clamp

```gdscript
var global_distance_to_clamp: Variant
```
    
### path\_to\_richtextlabel

```gdscript
var path_to_richtextlabel: NodePath
```
    
### max\_width

```gdscript
var max_width: int
```

## Signals

### mouse\_moved

```gdscript
signal mouse_moved(position: Variant)
```



### text\_selected

```gdscript
signal text_selected(text: Variant)
```



## Methods
    
% ...
---
### set\_path\_to\_richtextlabel

```gdscript
func set_path_to_richtextlabel(path: Variant) -> void
```
    
% ...
---
### set\_global\_dist\_clamp

```gdscript
func set_global_dist_clamp(d: Variant) -> void
```
    
% ...
---
### get\_global\_dist\_clamp

```gdscript
func get_global_dist_clamp() -> Variant
```
    
% ...
---
### update\_line2d

```gdscript
func update_line2d() -> void
```
    
% ...
---
### tooltip\_distance\_to\_edge\_top

```gdscript
func tooltip_distance_to_edge_top(position: Vector2) -> Variant
```
    
% ...
---
### tooltip\_distance\_to\_edge\_bottom

```gdscript
func tooltip_distance_to_edge_bottom(position: Vector2) -> Variant
```
    
% ...
---
### tooltip\_distance\_to\_edge\_left

```gdscript
func tooltip_distance_to_edge_left(position: Vector2) -> Variant
```
    
% ...
---
### tooltip\_distance\_to\_edge\_right

```gdscript
func tooltip_distance_to_edge_right(position: Vector2) -> Variant
```
    
% ...
---
### update\_size

```gdscript
func update_size() -> void
```

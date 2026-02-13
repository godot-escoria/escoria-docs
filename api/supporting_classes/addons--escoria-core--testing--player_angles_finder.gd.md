
  ("addons/escoria-core/testing/player_angles_finder.gd")=
# "addons/escoria-core/testing/player_angles_finder.gd"

**Extends:** {ref}`Node2D <Node2D>`
        
## Description





## Constants

### NORTH
```gdscript
const NORTH = 0 # enum "Directions"

```

### NORTHEAST
```gdscript
const NORTHEAST = 1 # enum "Directions"

```

### EAST
```gdscript
const EAST = 2 # enum "Directions"

```

### SOUTHEAST
```gdscript
const SOUTHEAST = 3 # enum "Directions"

```

### SOUTH
```gdscript
const SOUTH = 4 # enum "Directions"

```

### SOUTHWEST
```gdscript
const SOUTHWEST = 5 # enum "Directions"

```

### WEST
```gdscript
const WEST = 6 # enum "Directions"

```

### NORTHWEST
```gdscript
const NORTHWEST = 7 # enum "Directions"

```

### POLYGON\_DISTANCE
```gdscript
const POLYGON_DISTANCE = 400

```

### starting\_angles
```gdscript
const starting_angles = [0, 0.7853981633974483, 1.5707963267948966, 2.356194490192345, 3.141592653589793, 3.9269908169872414, 4.71238898038469, 5.497787143782138]

```

## Members
    
### number\_of\_directions

```gdscript
var number_of_directions: int
```
    
### angle\_horizontal\_axes

```gdscript
var angle_horizontal_axes: float
```
    
### angle\_vertical\_axes

```gdscript
var angle_vertical_axes: float
```
    
### angle\_diagonal\_axes

```gdscript
var angle_diagonal_axes: float
```
    
### colors

```gdscript
var colors: Variant
```
    
### result\_angles

```gdscript
var result_angles: Variant
```

## Methods
    
% ...
---
### clear\_areas\_node

```gdscript
func clear_areas_node() -> void
```
    
% ...
---
### calculate\_areas

```gdscript
func calculate_areas(nb_directions: int) -> void
```
    
% ...
---
### construct\_scene\_nodes

```gdscript
func construct_scene_nodes(angles: Variant) -> void
```
    
% ...
---
### clamp360

```gdscript
func clamp360(angle: float) -> Variant
```

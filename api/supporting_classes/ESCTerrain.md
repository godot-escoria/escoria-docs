
  (ESCTerrain)=
# ESCTerrain

**Extends:** {ref}`Node2D <Node2D>`
        
## Description

A walkable Terrain for Escoria rooms.



## Constants

### NONE
```gdscript
const NONE = 0 # enum "DebugMode"

```

### SCALES
```gdscript
const SCALES = 1 # enum "DebugMode"

```

### LIGHTMAP
```gdscript
const LIGHTMAP = 2 # enum "DebugMode"

```

### EscLogger
```gdscript
const EscLogger = <Object>

```
Logger class reference
## Members
    
### scales

```gdscript
var scales: Texture2D
```

Scaling texture. If empty, items scale will always be 1.0. This is a greyscale image defining how close to the camera the character will appear at each pixel position. White is closer, black is further.
    
### scale\_min

```gdscript
var scale_min: float
```

Minimum scaling. Corresponds to the scale used for characters when they are located at the blackest pixel of scaling texture, at which they will appear smallest. Unused if scaling texture is not set.
    
### scale\_max

```gdscript
var scale_max: float
```

Maximum scaling. Corresponds the scale used for characters when they are located at the whitest pixel of scaling texture, at which they will appear biggest. Unused if scaling texture is not set.
    
### lightmap

```gdscript
var lightmap: Texture2D
```

Lightmap texture.
    
### lightmap\_modulate

```gdscript
var lightmap_modulate: Color
```

Additional modulator to the lightmap texture.
    
### bitmaps\_scale

```gdscript
var bitmaps_scale: Vector2
```

Scaling factor for the scale and light maps.
    
### player\_speed\_multiplier

```gdscript
var player_speed_multiplier: float
```

Multiplier applied to the player speed on this terrain.
    
### player\_doubleclick\_speed\_multiplier

```gdscript
var player_doubleclick_speed_multiplier: float
```

Multiplier that determines how much faster the player will walk when fast mode is on (double clicked)
    
### editor\_debug\_mode

```gdscript
var editor_debug_mode: Variant
```

Debug display mode.
None: no debug display
Scales: displays the scales map
Lightmap: displays the lightmap
    
### current\_active\_navigation\_instance

```gdscript
var current_active_navigation_instance: NavigationRegion2D
```

The currently active navigation polygon
    
### logger

```gdscript
var logger: Variant
```

Logger instance

## Methods
    
% ...
---
### get\_children\_navpolys

```gdscript
func get_children_navpolys() -> Array
```

All NavigationPolygonInstances defined as children of ESCTerrain in an Array.

#### Parameters

None. 
#### Returns

Returns all NavigationPolygonInstances defined as children of ESCTerrain in an Array. (`Array`)
    
% ...
---
### get\_light

```gdscript
func get_light(pos: Vector2) -> Color
```

Return the Color of the lightmap pixel for the specified position.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|pos|`Vector2`|Position to calculate lightmap for.|yes|

#### Returns

Returns a `Color` value. (`Color`)
    
% ...
---
### get\_scale\_range

```gdscript
func get_scale_range(factor: float) -> Vector2
```

Calculate the scale inside the scale range for a given scale factor.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|factor|`float`|The factor for the scaling according to the scale map|yes|

#### Returns

Returns a `Vector2` value. (`Vector2`)
    
% ...
---
### get\_terrain

```gdscript
func get_terrain(pos: Vector2) -> float
```

Get the terrain scale factor for a given position

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|pos|`Vector2`|The position to calculate for|yes|

#### Returns

Returns a `float` value. (`float`)
    
% ...
---
### get\_simple\_path

```gdscript
func get_simple_path(from: Vector2, to: Vector2, optimize: bool, layers: int) -> PackedVector2Array
```

Calculate a path from a given point to another. The path consists in a list of points.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|from|`Vector2`|Origin point|yes|
|to|`Vector2`|Destination point|yes|
|optimize|`bool`|(default is true) enabled optimisation|no|
|layers|`int`|bitmask of all region navigation layers that are allowed to be in the path.|no|

#### Returns

Returns a `PackedVector2Array` value. (`PackedVector2Array`)

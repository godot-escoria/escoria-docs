<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCAnimationResource

**Extends:** [Resource](../Resource)

## Description

Resource containing all defined animations and angles for
characters movement.

## Property Descriptions

### dir\_angles

```gdscript
export var dir_angles: Array = []
```

- **Setter**: `set_dir_angles`

Array containing the different angles available for animations.
Each angle is defined by an array [start_angle, angle_size].
start_angle must be between 0 and 360.
Angles 0 and 360 are the same and correspond to UP/NORTH,
90 is RIGHT/EAST, 180 is DOWN/SOUTH, 270 is LEFT/WEST etc.

### directions

```gdscript
export var directions: Array = []
```

- **Setter**: `set_directions`

Array of animations for each direction, from UP to RIGHT_UP clockwise
[animation_name, scale]: scale parameter can be set to -1 to mirror
the animation

### idles

```gdscript
export var idles: Array = []
```

- **Setter**: `set_idles`

Array containing the idle animations for each direction (in the
order defined by dir_angles): scale parameter can be set to -1 to mirror
the animation

### speaks

```gdscript
export var speaks: Array = []
```

- **Setter**: `set_speaks`

Array containing the speak animations for each direction (in the
order defined by dir_angles): scale parameter can be set to -1 to mirror
the animation

## Method Descriptions

### set\_dir\_angles

```gdscript
func set_dir_angles(p_dir_angles: Array) -> void
```

Sets the dir_angles property.

#### Parameters

- p_dir_angles: array of direction angle resources to set.

### set\_directions

```gdscript
func set_directions(p_set_directions: Array) -> void
```

Sets the directions property.

#### Parameters

- p_directions: array of direction resources to set.

### set\_idles

```gdscript
func set_idles(p_set_idles: Array) -> void
```

Sets the idles property.

#### Parameters

- p_set_idles: array of idle resources to set.

### set\_speaks

```gdscript
func set_speaks(p_set_speaks: Array) -> void
```

Sets the speaks property.

#### Parameters

- p_set_idles: array of speak resources to set.
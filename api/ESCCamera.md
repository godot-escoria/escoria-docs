<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCCamera

**Extends:** [Camera2D](../Camera2D)

## Description

Camera handling

## Method Descriptions

### register

```gdscript
func register(room = null)
```

Register this camera with the object manager. We do it out here so we can
work with the camera before it's made active as part of the current scene
tree.

#### Parameters

- room: The room with which to register the camera.

### get\_tween

```gdscript
func get_tween() -> Tween
```

Returns the camera's tween.

**Returns** the tween owned by this camera.

### set\_limits

```gdscript
func set_limits(limits: ESCCameraLimits)
```

Sets camera limits so it doesn't go out of the scene

#### Parameters

- limits: The limits to set

### set\_drag\_margin\_enabled

```gdscript
func set_drag_margin_enabled(p_dm_h_enabled, p_dm_v_enabled)
```

### set\_target

```gdscript
func set_target(p_target, p_time: float = 0)
```

Set the target for the camera

#### Parameters
- p_target: Object to target
- p_time: Number of seconds for the camera to reach the target

### set\_camera\_zoom

```gdscript
func set_camera_zoom(p_zoom_level: float, p_time: float)
```

Set the camera zoom level

#### Parameters
- p_zoom_level: Zoom level to set
- p_time: Number of seconds for the camera to reach the zoom level

### push

```gdscript
func push(p_target, p_time: float = 0, p_type: int = 0)
```

Push the camera towards the target in terms of position and zoom level
using a given transition type and time.
See
https://docs.godotengine.org/en/3.5/classes/class_tween.html#enumerations

#### Parameters
- p_target: Target to push to
- p_time: Number of seconds for the transition to take
- p_type: Tween transition type

### shift

```gdscript
func shift(p_target: Vector2, p_time: float, p_type: int)
```

Shift the camera by the given vector in a given time and using a specific
Tween transition type.

See
https://docs.godotengine.org/en/3.5/classes/class_tween.html#enumerations

#### Parameters
- p_target: Vector to shift the camera by
- p_time: Number of seconds for the transition to take
- p_type: Tween transition type

### check\_point\_is\_inside\_viewport\_limits

```gdscript
func check_point_is_inside_viewport_limits(point: Vector2) -> bool
```

Checks whether the given point is contained within the viewport's limits.
Note that this is different from the camera's limits when using anchor mode
DRAG_CENTER.

#### Parameters
- point: Point to be tested against viewport limits.

**Returns** true iff point is inside the calculated viewport's limits (inclusive)

### get\_current\_valid\_viewport\_values\_x

```gdscript
func get_current_valid_viewport_values_x() -> Array
```

Returns the inclusive minimum and maximum values for the x-component of the current valid viewport.
Mainly used in any logging messages related to same.

**Returns** the inclusive minimum and maximum values for the x-component of the current valid viewport.

### get\_current\_valid\_viewport\_values\_y

```gdscript
func get_current_valid_viewport_values_y() -> Array
```

Returns the inclusive minimum and maximum values for the y-component of the current valid viewport.
Mainly used in any logging messages related to same.

**Returns* the inclusive minimum and maximum values for the y-component of the current valid viewport.

### get\_camera\_limit\_rect

```gdscript
func get_camera_limit_rect() -> Rect2
```

Returns the camera's current limits as a Rect2.
Mainly used in any logging messages related to same.

**Returns** the camera's current limits as a Rect2.

### clamp\_to\_viewport\_limits

```gdscript
func clamp_to_viewport_limits() -> void
```

Used when drag margins are enabled. Clamps the camera so it respects the viewport limits inside
the camera limits.
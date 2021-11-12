<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCCamera

**Extends:** [Camera2D](../Camera2D)

## Description

Camera handling

## Method Descriptions

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
func set_target(p_target, p_speed: float = 0)
```

Set the target for the camera

#### Parameters
- p_target: Object to target
- p_speed: Number of seconds for the camera to reach the target

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
https://docs.godotengine.org/en/stable/classes/class_tween.html#enumerations

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
https://docs.godotengine.org/en/stable/classes/class_tween.html#enumerations

#### Parameters
- p_target: Vector to shift the camera by
- p_time: Number of seconds for the transition to take
- p_type: Tween transition type
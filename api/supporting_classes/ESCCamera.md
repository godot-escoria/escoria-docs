
  (ESCCamera)=
# ESCCamera

**Extends:** {ref}`Camera2D <Camera2D>`
        
## Description

Camera handling for Escoria scenes.



## Members

## Methods
    
% ...
---
### get\_tween

```gdscript
func get_tween() -> Tween3
```

The camera's tween instance.

#### Parameters

None. 
#### Returns

Returns the camera's tween instance. (`Tween3`)
    
% ...
---
### set\_limits

```gdscript
func set_limits(limits: ESCCameraLimits) -> void
```

Sets camera limits so it doesn't go out of the scene.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|limits|`ESCCameraLimits`|The limits to set|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_drag\_margin\_enabled

```gdscript
func set_drag_margin_enabled(p_dm_h_enabled: Variant, p_dm_v_enabled: Variant) -> void
```

Enable or disable drag margins for the camera.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_dm_h_enabled|`Variant`|Enable horizontal drag margin|yes|
|p_dm_v_enabled|`Variant`|Enable vertical drag margin|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_target

```gdscript
func set_target(p_target: Variant, p_time: float) -> void
```

Set the target for the camera to move to.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_target|`Variant`|Object to target|yes|
|p_time|`float`|Number of seconds for the camera to reach the target|no|

#### Returns

Returns nothing.
    
% ...
---
### set\_camera\_zoom

```gdscript
func set_camera_zoom(p_zoom_level: float, p_time: float) -> void
```

Set the camera zoom level.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_zoom_level|`float`|Zoom level to set|yes|
|p_time|`float`|Number of seconds for the camera to reach the zoom level|yes|

#### Returns

Returns nothing.
    
% ...
---
### push

```gdscript
func push(p_target: Variant, p_time: float, p_type: int) -> void
```

Push the camera towards the target in terms of position and zoom level using a given transition type and time. See https://docs.godotengine.org/en/stable/classes/class_tween.html#enumerations

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_target|`Variant`|Target to push to|yes|
|p_time|`float`|Number of seconds for the transition to take|no|
|p_type|`int`|Tween transition type|no|

#### Returns

Returns nothing.
    
% ...
---
### shift

```gdscript
func shift(p_target: Vector2, p_time: float, p_type: int) -> void
```

Shift the camera by the given vector in a given time and using a specific Tween transition type. See https://docs.godotengine.org/en/stable/classes/class_tween.html#enumerations

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_target|`Vector2`|Vector to shift the camera by|yes|
|p_time|`float`|Number of seconds for the transition to take|yes|
|p_type|`int`|Tween transition type|yes|

#### Returns

Returns nothing.
    
% ...
---
### check\_point\_is\_inside\_viewport\_limits

```gdscript
func check_point_is_inside_viewport_limits(point: Vector2) -> bool
```

Checks whether the given point is contained within the viewport's limits. Note that this is different from the camera's limits when using anchor mode DRAG_CENTER.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|point|`Vector2`|Point to be tested against viewport limits.|yes|

#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### get\_current\_valid\_viewport\_values\_x

```gdscript
func get_current_valid_viewport_values_x() -> Array
```

The inclusive minimum and maximum values for the x-component of the current valid viewport. Mainly used in any logging messages related to same. the current valid viewport.

#### Parameters

None. 
#### Returns

Returns the inclusive minimum and maximum values for the x-component of the current valid viewport. Mainly used in any logging messages related to same. the current valid viewport. (`Array`)
    
% ...
---
### get\_current\_valid\_viewport\_values\_y

```gdscript
func get_current_valid_viewport_values_y() -> Array
```

The inclusive minimum and maximum values for the y-component of the current valid viewport. Mainly used in any logging messages related to same. the current valid viewport.

#### Parameters

None. 
#### Returns

Returns the inclusive minimum and maximum values for the y-component of the current valid viewport. Mainly used in any logging messages related to same. the current valid viewport. (`Array`)
    
% ...
---
### get\_camera\_limit\_rect

```gdscript
func get_camera_limit_rect() -> Rect2
```

The camera's current limits as a Rect2. Mainly used in any logging messages related to same.

#### Parameters

None. 
#### Returns

Returns the camera's current limits as a Rect2. Mainly used in any logging messages related to same. (`Rect2`)
    
% ...
---
### clamp\_to\_viewport\_limits

```gdscript
func clamp_to_viewport_limits() -> void
```

Used when drag margins are enabled. Clamps the camera so it respects the viewport limits inside the camera limits.

#### Parameters

None. 
#### Returns

Returns nothing.

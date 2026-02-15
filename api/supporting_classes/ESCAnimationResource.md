
  (ESCAnimationResource)=
# ESCAnimationResource

**Extends:** {ref}`Resource <Resource>`
        
## Description

Resource containing all defined animations and angles for character movement.




## Members
    
### dir\_angles

```gdscript
var dir_angles: ESCDirectionAngle[]
```

Array containing the different angles available for animations.
Each angle is defined by an array [start_angle, angle_size]. start_angle must be between 0 and 360.
Angles 0 and 360 are the same and correspond to UP/NORTH, 90 is RIGHT/EAST, 180 is DOWN/SOUTH, 270 is LEFT/WEST etc.
    
### directions

```gdscript
var directions: ESCAnimationName[]
```

Array of animations for each direction, from UP to RIGHT_UP clockwise.
Each entry is [animation_name, scale]. The scale parameter can be set to -1 to mirror the animation.
    
### idles

```gdscript
var idles: ESCAnimationName[]
```

Array containing the idle animations for each direction (in the order defined by dir_angles).
The scale parameter can be set to -1 to mirror the animation.
    
### speaks

```gdscript
var speaks: ESCAnimationName[]
```

Array containing the speak animations for each direction (in the order defined by dir_angles).
The scale parameter can be set to -1 to mirror the animation.

## Methods
    
% ...
---
### set\_dir\_angles

```gdscript
func set_dir_angles(p_dir_angles: ESCDirectionAngle[]) -> void
```

Sets the dir_angles property.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_dir_angles|`Array`|Array of direction angle resources to set.|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_directions

```gdscript
func set_directions(p_set_directions: ESCAnimationName[]) -> void
```

Sets the directions property.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_set_directions|`Array`|Array of direction resources to set.|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_idles

```gdscript
func set_idles(p_set_idles: ESCAnimationName[]) -> void
```

Sets the idles property.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_set_idles|`Array`|Array of idle resources to set.|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_speaks

```gdscript
func set_speaks(p_set_speaks: ESCAnimationName[]) -> void
```

Sets the speaks property.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_set_speaks|`Array`|Array of speak resources to set.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_direction\_id\_from\_animation\_name

```gdscript
func get_direction_id_from_animation_name(p_animation_name: String) -> int
```

The direction id from an animation name. 1 if not found.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_animation_name|`String`|The animation name.|yes|

#### Returns

Returns the direction id from an animation name. 1 if not found. (`int`)

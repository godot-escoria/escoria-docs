
  (ESCAnimationPlayer)=
# ESCAnimationPlayer

**Extends:** {ref}`Node <Node>`
        
## Description

An abstraction class to expose the same animation methods for both AnimatedSprite and AnimationPlayer.



## Members

## Signals

### animation\_finished

```gdscript
signal animation_finished(name: Variant)
```

Signal emitted when the animation finished playing.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`Variant`|Name of the animation that completed playback.|yes|



## Methods
    
% ...
---
### get\_animation

```gdscript
func get_animation() -> String
```

Return the currently playing animation.

#### Parameters

None. 
#### Returns

Returns a `String` value. (`String`)
    
% ...
---
### get\_animations

```gdscript
func get_animations() -> PackedStringArray
```

A list of all animation names.

#### Parameters

None. 
#### Returns

Returns a list of all animation names. (`PackedStringArray`)
    
% ...
---
### is\_playing

```gdscript
func is_playing() -> bool
```

Whether the animation is playing.

#### Parameters

None. 
#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### stop

```gdscript
func stop() -> void
```

Stop the animation.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### play

```gdscript
func play(name: String, backwards: bool) -> void
```

Play the animation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Animation name to play.|yes|
|backwards|`bool`|Play backwards.|no|

#### Returns

Returns nothing.
    
% ...
---
### play\_backwards

```gdscript
func play_backwards(name: String) -> void
```

Play the given animation backwards.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Animation name to play in reverse.|yes|

#### Returns

Returns nothing.
    
% ...
---
### has\_animation

```gdscript
func has_animation(name: String) -> bool
```

Check if the given animation exists.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Animation name to test for availability.|yes|

#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### seek\_end

```gdscript
func seek_end(name: String) -> void
```

Play an animation and directly skip to the end.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Animation name to jump to the last frame of.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_length

```gdscript
func get_length(name: String) -> float
```

Get the length of the specified animation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Animation name whose duration should be returned.|yes|

#### Returns

Returns a `float` value. (`float`)
    
% ...
---
### is\_valid

```gdscript
func is_valid() -> bool
```

Return true if the ESCAnimationPlayer node is valid, ie. it has a valid player node.

#### Parameters

None. 
#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### get\_current\_animation

```gdscript
func get_current_animation() -> String
```

Gets the current animation name.

#### Parameters

None. 
#### Returns

A string containing the current animation name.

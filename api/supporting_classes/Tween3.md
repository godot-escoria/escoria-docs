
  (Tween3)=
# Tween3

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

In Godot 4, tweens cannot be resumed. But if you re-create them,
the bindings are lost. So this class wraps a tween and offers a reset function.



## Members

## Signals

### finished

```gdscript
signal finished()
```

Emitted when the tween finishes.

#### Parameters

None. 


## Methods
    
% ...
---
### tween\_interpolate\_property

```gdscript
func tween_interpolate_property(tween: Tween, object: Object, property: NodePath, initial_val: Variant, final_val: Variant, duration: float, trans_type: int, ease_type: int, delay: float) -> bool
```

Interpolates a property on an object using a tween.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|tween|`Tween`|The Tween instance to use.|yes|
|object|`Object`|The object whose property will be tweened.|yes|
|property|`NodePath`|The property to tween.|yes|
|initial_val|`Variant`|The initial value of the property.|yes|
|final_val|`Variant`|The final value of the property.|yes|
|duration|`float`|The duration of the tween in seconds.|yes|
|trans_type|`Tween.TransitionType`|The transition type (default 0).|no|
|ease_type|`Tween.EaseType`|The ease type (default 2).|no|
|delay|`float`|The delay before starting the tween (default 0).|no|

#### Returns

Returns True if the interpolation was set up successfully. (`bool`)
    
% ...
---
### reset

```gdscript
func reset() -> void
```

Resets the tween, stopping and killing the current tween and creating a new one.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### tween\_method

```gdscript
func tween_method(method: Callable, from: Variant, to: Variant, duration: float) -> void
```

Adds a method tween to the tween sequence.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|method|`Callable`|The method to tween.|yes|
|from|`Variant`|The initial value.|yes|
|to|`Variant`|The final value.|yes|
|duration|`float`|The duration of the tween in seconds.|yes|

#### Returns

Returns nothing.
    
% ...
---
### interpolate\_property

```gdscript
func interpolate_property(object: Object, property: NodePath, initial_val: Variant, final_val: Variant, duration: float, trans_type: int, ease_type: int, delay: float) -> bool
```

Interpolates a property on an object using the managed tween.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`Object`|The object whose property will be tweened.|yes|
|property|`NodePath`|The property to tween.|yes|
|initial_val|`Variant`|The initial value of the property.|yes|
|final_val|`Variant`|The final value of the property.|yes|
|duration|`float`|The duration of the tween in seconds.|yes|
|trans_type|`Tween.TransitionType`|The transition type (default 0).|no|
|ease_type|`Tween.EaseType`|The ease type (default 2).|no|
|delay|`float`|The delay before starting the tween (default 0).|no|

#### Returns

Returns True if the interpolation was set up successfully. (`bool`)
    
% ...
---
### play

```gdscript
func play() -> void
```

Plays the tween.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### resume

```gdscript
func resume() -> void
```

Resumes the tween if it is valid.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### pause

```gdscript
func pause() -> void
```

Pauses the tween.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### stop

```gdscript
func stop() -> void
```

Stops the tween.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### is\_running

```gdscript
func is_running() -> Variant
```

True if the tween is running.

#### Parameters

None. 
#### Returns

Returns true if the tween is running. True if the tween is running. (`bool`)
    
% ...
---
### is\_valid

```gdscript
func is_valid() -> Variant
```

True if the tween is valid.

#### Parameters

None. 
#### Returns

Returns true if the tween is valid. True if the tween is valid. (`bool`)
    
% ...
---
### get\_total\_elapsed\_time

```gdscript
func get_total_elapsed_time() -> Variant
```

Gets the total elapsed time of the tween.

#### Parameters

None. 
#### Returns

Returns the total elapsed time in seconds. (`Variant`)
    
% ...
---
### get\_duration

```gdscript
func get_duration() -> Variant
```

Gets the duration of the tween.

#### Parameters

None. 
#### Returns

Returns the duration of the tween in seconds. (`Variant`)

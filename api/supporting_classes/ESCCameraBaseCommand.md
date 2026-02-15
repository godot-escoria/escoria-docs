
  (ESCCameraBaseCommand)=
# ESCCameraBaseCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

Abstract base class for those commands that implement camera-based functionality.



#### Parameters

None. 


## Methods
    
% ...
---
### generate\_viewport\_warning

```gdscript
func generate_viewport_warning(pos: Vector2, camera: ESCCamera) -> void
```

Generates a log entry when attempting to move the camera to an invalid position.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|pos|`Vector2`|The offending position, represented by a `Vector2`.|yes|
|camera|`ESCCamera`|The camera object as an `ESCCamera` that `pos` was checked against.|yes|

#### Returns

Returns nothing.

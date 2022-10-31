<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCCameraBaseCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

## Method Descriptions

### generate\_viewport\_warning

```gdscript
func generate_viewport_warning(pos: Vector2, camera: ESCCamera) -> void
```

Generaters a log entry when attempting to move the camera to an invalid position.

#### Parameters

- pos: The offending position.
- camera: The camera object that `pos` was checked against.
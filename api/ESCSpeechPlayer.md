<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCSpeechPlayer

**Extends:** [Control](../Control)

## Description

Speech player

## Property Descriptions

### global\_id

```gdscript
export var global_id: String = "_speech"
```

Global id of the background music player

### stream

```gdscript
var stream: AudioStreamPlayer
```

Reference to the audio player

## Method Descriptions

### set\_state

```gdscript
func set_state(p_state: String, from_seconds: float = 0, p_force: bool = false) -> void
```

Set the state of this player

#### Parameters

- p_state: New state to use
- from_seconds: Sets the starting playback position
- p_force: Override the existing state even if the stream is still playing

### pause

```gdscript
func pause()
```

Pause the speech player

### resume

```gdscript
func resume()
```

Unpause the speech player

### get\_playback\_position

```gdscript
func get_playback_position() -> float
```

Returns the playback position of the audio stream in seconds

**Returns** playback position
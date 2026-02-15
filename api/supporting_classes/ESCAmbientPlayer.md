
  (ESCAmbientPlayer)=
# ESCAmbientPlayer

**Extends:** {ref}`Control <Control>`
        
## Description

Background ambient sound player



## Members
    
### global\_id

```gdscript
var global_id: String
```

Global id of the background ambient sound player.
    
### state

```gdscript
var state: String
```

The state of the music player. "default" or "off" disable music. Any other state refers to a music stream that should be played.
    
### stream

```gdscript
var stream: AudioStreamPlayer
```

Reference to the audio player.

## Methods
    
% ...
---
### set\_state

```gdscript
func set_state(p_state: String, from_seconds: float, p_force: bool) -> void
```

Sets the state of this player.

#### Parameters

- p_state: New state to use.
- from_seconds: Sets the starting playback position.
- p_force: Override the existing state even if the stream is still playing.
    
% ...
---
### get\_playback\_position

```gdscript
func get_playback_position() -> float
```

Returns the playback position of the audio stream in seconds.

*Returns* the playback position as a float value.

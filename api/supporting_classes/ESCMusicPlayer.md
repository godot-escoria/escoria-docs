
  (ESCMusicPlayer)=
# ESCMusicPlayer

**Extends:** {ref}`Control <Control>`
        
## Description

Background music player



## Members
    
### global\_id

```gdscript
var global_id: String
```

Global id of the background music player.
    
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

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_state|`String`|New state to use.|yes|
|from_seconds|`float`|Sets the starting playback position.|no|
|p_force|`bool`|Override the existing state even if the stream is still playing.|no|

#### Returns

Returns nothing.
    
% ...
---
### get\_playback\_position

```gdscript
func get_playback_position() -> float
```

The playback position of the audio stream in seconds.

#### Parameters

None. 
#### Returns

Returns the playback position of the audio stream in seconds. the playback position as a float value. (`float`)

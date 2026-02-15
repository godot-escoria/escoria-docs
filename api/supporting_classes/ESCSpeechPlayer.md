
  (ESCSpeechPlayer)=
# ESCSpeechPlayer

**Extends:** {ref}`Control <Control>`
        
## Description

Speech player



## Members
    
### global\_id

```gdscript
var global_id: String
```

Global id of the speech player.
    
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
### pause

```gdscript
func pause() -> void
```

Pauses the speech player.

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

Unpauses the speech player.

#### Parameters

None. 
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

Returns the playback position of the audio stream in seconds. The playback position in seconds. (`float`)

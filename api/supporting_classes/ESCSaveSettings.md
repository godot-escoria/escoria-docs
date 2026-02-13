
  (ESCSaveSettings)=
# ESCSaveSettings

**Extends:** {ref}`Resource <Resource>`
        
## Description

Resource holding game settings. Note that we call directly to ProjectSettings for instance variable initialization since this class is instantiated from escoria.gd.



## Members
    
### escoria\_version

```gdscript
var escoria_version: String
```

Version of ESCORIA Framework.
    
### text\_lang

```gdscript
var text_lang: String
```

Language of displayed text.
    
### voice\_lang

```gdscript
var voice_lang: String
```

Language of voice speech.
    
### speech\_enabled

```gdscript
var speech_enabled: bool
```

Whether speech is enabled.
    
### master\_volume

```gdscript
var master_volume: float
```

Master volume (mix of music, voice and sfx).
    
### music\_volume

```gdscript
var music_volume: float
```

Volume of music only.
    
### sfx\_volume

```gdscript
var sfx_volume: float
```

Volume of SFX only.
    
### speech\_volume

```gdscript
var speech_volume: float
```

Speech volume only.
    
### ambient\_volume

```gdscript
var ambient_volume: float
```

Ambient volume only.
    
### fullscreen

```gdscript
var fullscreen: bool
```

True if game has to be fullscreen.
    
### custom\_settings

```gdscript
var custom_settings: Dictionary
```

Dictionary containing all user-defined settings.


  (ESCExit)=
# ESCExit

**Extends:** {ref}`ESCItem <ESCItem>`
        
## Description

An ESCExit is a minimal feature node that provides an exit to a room.

For exits that don't require scripts, the ``ESCExit`` node is provided. The only things you will need to configure on the node are the "target_scene" to change to, and optionally, a "switch sound" (the sound to play when changing rooms).

If you want to attach the exit to a script to perform additional actions - a cutscene for example - use an ``ESCItem`` with "Is Exit" selected instead.

The game character will automatically walk to an ``ESCLocation`` created as a child of an ``ESCExit`` node.



## Members
    
### target\_scene

```gdscript
var target_scene: String
```

Path to the target scene to change to
    
### switch\_sound

```gdscript
var switch_sound: Resource
```

Sound effect to play when changing the scene
    
### exit\_direction

```gdscript
var exit_direction: Variant
```

String value to be used as UI hint, for example to determine the mouse cursor to use.

## Methods

<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCExit

**Extends:** [ESCItem](../ESCItem) < [Area2D](../Area2D)

## Description

An ESCExit is a minimal feature node that provides an exit to a room.

For exits that don't require scripts, the ``ESCExit`` node is provided.
The only things you will need to configure on the node are the
"target_scene" to change to, and optionally, a "switch
sound" (the sound to play when changing rooms).

If you want to attach the exit to a script to perform additional actions -
a cutscene for example - use an ``ESCItem`` with "Is Exit" selected instead.

The game character will automatically walk to an ``ESCLocation`` created as a
child of an ``ESCExit`` node.

## Property Descriptions

### target\_scene

```gdscript
export var target_scene = ""
```

Path to the target scene to change to

### switch\_sound

```gdscript
export var switch_sound = ""
```

Sound effect to play when changing the scene
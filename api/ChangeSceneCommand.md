<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ChangeSceneCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`change_scene path [enable_automatic_transition] [run_events]`

Switches the game from the current scene to another scene. Use this to move
the player to a new room when they walk through an unlocked door for 
example.

**Parameters**

- *path*: Path of the new scene
- *enable_automatic_transition*: Automatically transition to the new scene
  (default: `true`)
- *run_events*: Run the standard ESC events of the new scene (default: `true`)

@ESC

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

### validate

```gdscript
func validate(arguments: Array) -> bool
```

Validate wether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> int
```

Run the command
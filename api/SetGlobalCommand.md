<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetGlobalCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`set_global name value [force=false]`

Changes the value of a global.

**Parameters**

- *name*: Name of the global
- *value*: Value to set the global to (can be of type string, boolean, integer
  or float)
- *force*: if false, setting a global whose name is reserved will
  trigger an error. Defaults to false. Reserved globals are: ESC_LAST_SCENE,
  FORCE_LAST_SCENE_NULL, ANIMATION_RESOURCES, ESC_CURRENT_SCENE

@ESC

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

### run

```gdscript
func run(command_params: Array) -> int
```

Run the command

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.
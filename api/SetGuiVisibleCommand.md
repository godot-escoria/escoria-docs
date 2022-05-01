<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetGuiVisibleCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`set_gui_visible visible`

Show or hide the GUI.

**Parameters**

- *visible*: Whether the GUI should be visible (`true` or `false`)

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
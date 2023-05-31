<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# HideMenuCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`hide_menu menu_type`

Hides either the main menu or the pause menu. Transitions from the menu using
the default transition type (set in the Escoria project settings).

**Parameters**

- *menu_type*: Which menu to hide. Can be either `main` or `pause` (default: `main`)

@ESC

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

### validate

```gdscript
func validate(arguments: Array)
```

Validate whether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> var
```

Run the command

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.
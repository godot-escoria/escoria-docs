<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# HideMenuCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`hide_menu menu_type [enable_automatic_transition]`

Hides either the main menu or the pause menu.

**Parameters**

- *menu_type*: Type of menu to hide. Can be either `main` or `pause` (default: `main`)
- *enable_automatic_transition*: Whether to automatically transition from the menu (default: `false`)

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

Validate wether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> var
```

Run the command
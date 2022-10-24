<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ShowMenuCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`show_menu menu_type [enable_automatic_transition]`

Shows either the main menu or the pause menu. The enable_automatic_transition
parameter can be used to specify if Escoria manages the graphical transition to
the menu or not.
Setting `enable_automatic_transition` to false allows you to manage the
transition effect for your menu as it transitions in and out. Place a
`transition` command in the menu's `setup` event to manage the look of the
transition in, and in the menu's `exit_scene` event to manage the look of the
transition out.

**Parameters**

- *menu_type*: Which menu to show. Can be either `main` or `pause` (default: `main`)
- *enable_automatic_transition*: Whether to automatically transition to the menu (default: `false`)

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
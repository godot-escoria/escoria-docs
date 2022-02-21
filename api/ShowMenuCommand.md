<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ShowMenuCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`show_menu menu_type [enable_automatic_transition]`

Shows either the main menu or the pause menu. The enable_automatic_transition
parameter can be used to specify if Escoria manages the graphical transition to 
the menu or not. If set to false, you can manage the transition yourself 
instead (if you want to change the transition type from the default for 
example) using the `transition` command.

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

Validate wether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> var
```

Run the command
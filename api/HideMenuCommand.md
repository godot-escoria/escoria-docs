<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# HideMenuCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`hide_menu main|pause=main [enable_automatic_transition: true|false=false]`

Hides the main or pause menu.
 The `enable_automatic_transition` is a boolean (default false) can be set
to false to disable automatic transitions between scenes, to allow you
to control your transitions manually using the `transition` command.

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
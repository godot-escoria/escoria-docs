<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# EndBlockSayCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`end_block_say`

`say` commands used subsequent to using the `end_block_say` command will no longer
reuse the dialog box type used by the previous `say` command(s) encountered.

Using `end_block_say` more than once is safe and idempotent.

Example:
`block say`
`say player "Picture's looking good."`
`say player "And so am I."`
`end_block_say`

This example will reuse the same dialog box type since they are the same between both `say` calls.

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
func run(command_params: Array) -> int
```

Run the command

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.
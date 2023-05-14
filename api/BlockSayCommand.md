<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# BlockSayCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`block_say`

`say` commands called subsequent to using the `block_say` command will reuse the
dialog box type of the previous `say` command if both dialog box types between the two `say`
commands match.

Different dialog box types can be used across multiple `say` commands, with the latest one
used being preserved for reuse by the next `say` command should the dialog box type specified by
both `say` commands match.

This reuse will continue until a call to `end_block_say` is made.

Using `block_say` more than once prior to calling `end_block_say` is idempotent and has the
following behaviour:

- If no `say` command has yet been encountered since the first use of `block_say`,
  the result of using this command will be as described above.
- If a `say` command has been encountered since the previous use of `block_say`,
  the dialog box used with that `say` command will continue to be reused for subsequent
  `say` commands should the dialog box type requested match. Note that the dialog box used with
  the next `say` command may be different than the one currently being reused.

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
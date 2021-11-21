<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetSpeedCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`set_speed object speed`

Sets the speed of a `ESCPlayer` or movable `ESCItem`.

**Parameters**

- *object*: Global ID of the `ESCPlayer` or movable `ESCItem`
- *speed*: Speed value for `object`

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
func run(command_params: Array) -> int
```

Run the command
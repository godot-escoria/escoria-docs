<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetAnimationsCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`set_animations object animations`

Sets the animation resource for the given `ESCPlayer` or movable `ESCItem`.

**Parameters**

- *object*: Global ID of the object whose animation resource is to be updated
- *animations*: The path of the animation resource to use

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
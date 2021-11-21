<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CustomCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`custom object node func_name [params]`

Calls the given Godot function on a (child) node of a registered `ESCitem`.

**Parameters**

- *object*: Global ID of the target `ESCItem`
- *node*: Name of the child node of the target `ESCItem`
- *func_name*: Name of the function to be called
- *params*: Any primitive, non-array arguments for the function. Multiple
  parameters can be passed by using comma-separated values inside a string

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
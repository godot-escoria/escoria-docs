<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CustomCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`custom object node func_name [params...]`

Executes the specified Godot function. This function must be in a script
attached to a child node of a registered `ESCItem`.

**Parameters**

- *object*: Global ID of the target `ESCItem`
- *node*: Name of the child node of the target `ESCItem`
- *func_name*: Name of the function to be called
- params: Any arguments to be passed to the function (array and object parameters are not supported).
Multiple parameters can be passed by simply passing them in as additional arguments separated by
spaces, e.g. `custom the_object the_node the_function arg1 arg2 arg3`

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
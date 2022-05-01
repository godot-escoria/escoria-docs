<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# WalkBlockCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`walk_block object target [walk_fast]`

Moves the specified `ESCPlayer` or movable `ESCItem` to `target`
while playing `object`'s walking animation. This command is blocking.
This command will use the normal walk speed by default.

**Parameters**

- *object*: Global ID of the object to move
- *target*: Global ID of the target object
- *walk_fast*: Whether to walk fast (`true`) or normal speed (`false`).
  (default: false)

@ESC

## Property Descriptions

### walking\_object\_node

```gdscript
var walking_object_node: ESCItem
```

Walking object

### target\_object\_node

```gdscript
var target_object_node: ESCObject
```

Target object

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
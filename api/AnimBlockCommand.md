<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# AnimBlockCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`anim_block object name [reverse]`

Executes the animation specified in "name" on "object",
while blocking. The next command in the event will be executed when the animation
is finished playing.

**Parameters**

* *object*: Global ID of the object with the animation
* *name*: Name of the animation to play
* *reverse*: Plays the animation in reverse when true

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
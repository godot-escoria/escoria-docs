<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# QueueResourceCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`queue_resource path [front_of_queue]`

Queues the loading of the given resource into the resource cache.

**Parameters**

- *path*: Path of the resource to cache
- *front_of_queue*: Whether to put the resource at the front of the
  queue in order to load it as soon as possible (default: `false`)

@ESC

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

### validate

```gdscript
func validate(arguments: Array) -> bool
```

Validate whether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> int
```

Run the command
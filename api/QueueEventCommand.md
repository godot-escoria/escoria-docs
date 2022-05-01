<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# QueueEventCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`queue_event object event [channel] [block]`

Queue an event to run.

**Parameters**

- object: Object that holds the ESC script with the event
- event: Name of the event to queue
- channel: Channel to run the event on (default: `_front`)
- block: Whether to wait for the queue to finish. This is only possible, if
  the queued event is not to be run on the same event as this command
  (default: `false`)

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
func run(arguments: Array) -> int
```

Run the command

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.
<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# QueueEventCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`queue_event object event [channel] [block]`

Queue an event to run.

If you queue multiple events on a channel and none of them are blocking
events, all events will effectively run at the same time. As the events are
placed on the channel's queue, if one event contains a blocking command, the
next event on that channel's queue won't be processed until the blocking
command finishes.

**Parameters**

- object: Object that holds the ESC script with the event
- event: Name of the event to queue
- channel: Channel to run the event on (default: `_front`). Using a
  previously unused channel name will create a new channel.
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
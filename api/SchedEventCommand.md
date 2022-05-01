<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SchedEventCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`sched_event time object event`

Schedules an event to run at a later time.

If another event is already running when the scheduled
event is supposed to start, execution of the scheduled event
begins when the already-running event ends.

**Parameters**

- *time*: Time in seconds until the scheduled event starts
- *object*: Global ID of the ESCItem that holds the ESC script
- *event*: Name of the event to schedule

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
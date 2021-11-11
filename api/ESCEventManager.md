<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCEventManager

**Extends:** [Node](../Node)

## Description

A manager for running events

## Property Descriptions

### events\_queue

```gdscript
var events_queue: Array
```

A queue of events to run

### scheduled\_events

```gdscript
var scheduled_events: Array
```

A list of currently scheduled events

### can\_process\_next\_event

```gdscript
var can_process_next_event
```

 Whether the event manager is allowed to proceed with next event.

## Method Descriptions

### queue\_event

```gdscript
func queue_event(event: ESCEvent) -> void
```

Queue a new event to run

### schedule\_event

```gdscript
func schedule_event(event: ESCEvent, timeout: float) -> void
```

Schedule an event to run after a timeout

### interrupt\_running\_event

```gdscript
func interrupt_running_event()
```

Interrupt the event currently running.

### clear\_event\_queue

```gdscript
func clear_event_queue()
```

Clears the event queue.

## Signals

- signal event_started(event_name): Emitted when the event started execution
- signal event_finished(event_name, return_code): Emitted when the event did finish running
- signal event_interrupted(event_name, return_code): Emitted when the event was interrupted

<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCEventManager

**Extends:** [Node](../Node)

## Description

A manager for running events
There are different "channels" an event can run on.
The usual events happen in the foreground channel _front, but
additional event queues can be added as required.
Additionally, events can be scheduled to be queued in the future

## Property Descriptions

### scheduled\_events

```gdscript
var scheduled_events: Array
```

A list of currently scheduled events

### events\_queue

```gdscript
var events_queue: Dictionary
```

A list of constantly running events in multiple background channels

## Method Descriptions

### queue\_event

```gdscript
func queue_event(event: ESCEvent) -> void
```

Queue a new event to run in the foreground

#### Parameters
- event: Event to run

### schedule\_event

```gdscript
func schedule_event(event: ESCEvent, timeout: float) -> void
```

Schedule an event to run after a timeout

#### Parameters
- event: Event to run
- timeout: Number of seconds to wait before adding the event to the
  front queue

### queue\_background\_event

```gdscript
func queue_background_event(channel_name: String, event: ESCEvent) -> void
```

Queue the run of an event in a background channel

#### Parameters
- channel_name: Name of the channel to use
- event: Event to run

### interrupt\_running\_event

```gdscript
func interrupt_running_event()
```

Interrupt the events currently running.

### clear\_event\_queue

```gdscript
func clear_event_queue()
```

Clears the event queues.

### is\_channel\_free

```gdscript
func is_channel_free(name: String) -> bool
```

Check wether a channel is free to run more events

#### Parameters
- name: Name of the channel to test
**Returns** Wether the channel can currently accept a new event

### get\_running\_event

```gdscript
func get_running_event(name: String) -> ESCEvent
```

Get the currently running event in a channel

#### Parameters
- name: Name of the channel
**Returns** The currently running event or null

## Signals

- signal event_started(event_name): Emitted when the event started execution
- signal background_event_started(channel_name, event_name): Emitted when an event is started in a channel of the background queue
- signal event_finished(return_code, event_name): Emitted when the event did finish running
- signal background_event_finished(return_code, event_name, channel_name): Emitted when a background event was finished

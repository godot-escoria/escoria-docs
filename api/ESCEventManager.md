<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCEventManager

**Extends:** [Node](../Node)

## Description

A manager for running events
There are different "channels" an event can run on.
The usual events happen in the foreground channel _front, but
additional event queues can be added as required.
Additionally, events can be scheduled to be queued in the future

## Constants Descriptions

### CHANNEL\_FRONT

```gdscript
const CHANNEL_FRONT: String = "_front"
```

Event channel names

### EVENT\_DEBUG

```gdscript
const EVENT_DEBUG: String = "debug"
```

Pre-defined ESC events

### EVENT\_EXIT\_SCENE

```gdscript
const EVENT_EXIT_SCENE: String = "exit_scene"
```

### EVENT\_INIT

```gdscript
const EVENT_INIT: String = "init"
```

### EVENT\_LOAD

```gdscript
const EVENT_LOAD: String = "load"
```

### EVENT\_NEW\_GAME

```gdscript
const EVENT_NEW_GAME: String = "newgame"
```

### EVENT\_READY

```gdscript
const EVENT_READY: String = "ready"
```

### EVENT\_ROOM\_SELECTOR

```gdscript
const EVENT_ROOM_SELECTOR: String = "room_selector"
```

### EVENT\_SETUP

```gdscript
const EVENT_SETUP: String = "setup"
```

### EVENT\_TRANSITION\_IN

```gdscript
const EVENT_TRANSITION_IN: String = "transition_in"
```

### EVENT\_TRANSITION\_OUT

```gdscript
const EVENT_TRANSITION_OUT: String = "transition_out"
```

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

### queue\_event\_from\_esc

```gdscript
func queue_event_from_esc(script_object: ESCScript, event: String, channel: String, block: bool) -> var
```

Queue a new event based on input from an ESC command, most likely "queue_event"

#### Parameters
- script_object: Compiled script object, i.e. the one with the event to queue
- event: Name of the event to queue
- channel: Channel to run the event on (default: `_front`)
- block: Whether to wait for the queue to finish. This is only possible, if
  the queued event is not to be run on the same event as this command
  (default: `false`)

**Returns** indicator of success/status

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

Check whether a channel is free to run more events

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

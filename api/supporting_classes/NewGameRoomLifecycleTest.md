
  (NewGameRoomLifecycleTest)=
# NewGameRoomLifecycleTest

**Extends:** {ref}`GdUnitTestSuite <GdUnitTestSuite>`
        
## Description





## Constants

### FIXTURES
```gdscript
const FIXTURES = "res://addons/escoria-core/testing/new_game/"

```

### START
```gdscript
const START = "res://addons/escoria-core/testing/new_game/starting_room.tscn"

```

### OTHER
```gdscript
const OTHER = "res://addons/escoria-core/testing/new_game/other_room.tscn"

```

### TIMEOUT\_MS
```gdscript
const TIMEOUT_MS = 5000

```

## Members

## Methods
    
% ...
---
### before\_test

```gdscript
func before_test() -> void
```

Prepare isolated lifecycle counters and a minimal new-game script.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### after\_test

```gdscript
func after_test() -> void
```

Restore the start script and clear pending runtime events.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### test\_restart\_in\_starting\_room\_replaces\_room\_before\_setup

```gdscript
func test_restart_in_starting_room_replaces_room_before_setup() -> void
```

Verify a restart replaces the starting room and registers fresh objects before setup.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### test\_restart\_from\_another\_room\_replaces\_room\_before\_setup

```gdscript
func test_restart_from_another_room_replaces_room_before_setup() -> void
```

Verify a restart from another room initializes the starting room once.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### test\_repeated\_restart\_does\_not\_accumulate\_state

```gdscript
func test_repeated_restart_does_not_accumulate_state() -> void
```

Verify repeated restarts clear the lifecycle flag and stale registrations.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### test\_paused\_menu\_restart\_interrupts\_active\_event

```gdscript
func test_paused_menu_restart_interrupts_active_event() -> void
```

Verify restart resumes a paused game and interrupts the old active event.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### test\_ordinary\_same\_room\_transition\_preserves\_instance\_and\_registration

```gdscript
func test_ordinary_same_room_transition_preserves_instance_and_registration() -> void
```

Verify an ordinary same-room transition leaves the current room intact.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### test\_same\_room\_save\_load\_reinitializes\_existing\_room\_once\_without\_setup

```gdscript
func test_same_room_save_load_reinitializes_existing_room_once_without_setup() -> void
```

Verify same-room loading reinitializes the existing room once without setup.

#### Parameters

None. 
#### Returns

Returns nothing.

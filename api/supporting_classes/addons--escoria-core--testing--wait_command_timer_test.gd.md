
  ("addons/escoria-core/testing/wait_command_timer_test.gd")=
# "addons/escoria-core/testing/wait_command_timer_test.gd"

**Extends:** {ref}`GdUnitTestSuite <GdUnitTestSuite>`
        
## Description





## Members

## Methods
    
% ...
---
### test\_completed\_wait\_releases\_timer

```gdscript
func test_completed_wait_releases_timer() -> void
```

Verify a completed wait frees its timer and tolerates later interruption.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### test\_interrupted\_wait\_releases\_timer

```gdscript
func test_interrupted_wait_releases_timer() -> void
```

Verify interrupting a pending wait frees its timer and is safe to repeat.

#### Parameters

None. 
#### Returns

Returns nothing.

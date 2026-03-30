
  (ESCInterpreterTest)=
# ESCInterpreterTest

**Extends:** {ref}`GdUnitTestSuite <GdUnitTestSuite>`
        
## Description





## Members

## Methods
    
% ...
---
### before

```gdscript
func before() -> void
```
    
% ...
---
### after

```gdscript
func after() -> void
```
    
% ...
---
### test\_execute\_block\_restores\_scope\_after\_break

```gdscript
func test_execute_block_restores_scope_after_break() -> void
```
    
% ...
---
### test\_invalid\_numeric\_comparison\_does\_not\_succeed\_silently

```gdscript
func test_invalid_numeric_comparison_does_not_succeed_silently() -> void
```
    
% ...
---
### test\_print\_with\_zero\_arguments\_does\_not\_native\_crash

```gdscript
func test_print_with_zero_arguments_does_not_native_crash() -> void
```
    
% ...
---
### test\_print\_with\_two\_arguments\_does\_not\_native\_crash

```gdscript
func test_print_with_two_arguments_does_not_native_crash() -> void
```
    
% ...
---
### test\_stop\_in\_nested\_block\_prevents\_later\_statements

```gdscript
func test_stop_in_nested_block_prevents_later_statements() -> void
```
    
% ...
---
### test\_done\_in\_nested\_dialog\_block\_prevents\_later\_statements

```gdscript
func test_done_in_nested_dialog_block_prevents_later_statements() -> void
```
    
% ...
---
### test\_break\_one\_returns\_to\_parent\_dialog\_level

```gdscript
func test_break_one_returns_to_parent_dialog_level() -> void
```
    
% ...
---
### test\_done\_exits\_entire\_nested\_dialog\_tree

```gdscript
func test_done_exits_entire_nested_dialog_tree() -> void
```
    
% ...
---
### test\_dialog\_followup\_runs\_after\_all\_options\_are\_exhausted

```gdscript
func test_dialog_followup_runs_after_all_options_are_exhausted() -> void
```
    
% ...
---
### test\_break\_two\_exits\_two\_dialog\_levels

```gdscript
func test_break_two_exits_two_dialog_levels() -> void
```
    
% ...
---
### test\_stop\_in\_dialog\_option\_prevents\_later\_event\_statements

```gdscript
func test_stop_in_dialog_option_prevents_later_event_statements() -> void
```
    
% ...
---
### test\_delayed\_command\_in\_dialog\_option\_preserves\_ordering

```gdscript
func test_delayed_command_in_dialog_option_preserves_ordering() -> void
```
    
% ...
---
### test\_delayed\_command\_in\_loop\_preserves\_ordering

```gdscript
func test_delayed_command_in_loop_preserves_ordering() -> void
```
    
% ...
---
### test\_interrupting\_delayed\_command\_stops\_event\_progress

```gdscript
func test_interrupting_delayed_command_stops_event_progress() -> void
```
    
% ...
---
### test\_interrupting\_delayed\_command\_in\_dialog\_stops\_event\_progress

```gdscript
func test_interrupting_delayed_command_in_dialog_stops_event_progress() -> void
```
    
% ...
---
### test\_interrupting\_delayed\_command\_stops\_multi\_iteration\_loop

```gdscript
func test_interrupting_delayed_command_stops_multi_iteration_loop() -> void
```
    
% ...
---
### test\_invalid\_command\_does\_not\_continue\_event

```gdscript
func test_invalid_command_does_not_continue_event() -> void
```
    
% ...
---
### test\_invalid\_command\_in\_dialog\_does\_not\_continue\_event

```gdscript
func test_invalid_command_in_dialog_does_not_continue_event() -> void
```
    
% ...
---
### test\_invalid\_command\_in\_loop\_does\_not\_continue\_event

```gdscript
func test_invalid_command_in_loop_does_not_continue_event() -> void
```
    
% ...
---
### test\_dialog\_option\_scope\_shadowing\_restores\_outer\_local

```gdscript
func test_dialog_option_scope_shadowing_restores_outer_local() -> void
```
    
% ...
---
### test\_interrupting\_background\_channel\_does\_not\_interrupt\_front\_channel

```gdscript
func test_interrupting_background_channel_does_not_interrupt_front_channel() -> void
```
    
% ...
---
### test\_concurrent\_channels\_complete\_without\_interrupting\_each\_other

```gdscript
func test_concurrent_channels_complete_without_interrupting_each_other() -> void
```
    
% ...
---
### test\_interrupting\_channel\_clears\_queued\_successor\_events

```gdscript
func test_interrupting_channel_clears_queued_successor_events() -> void
```
    
% ...
---
### test\_concurrent\_channels\_do\_not\_block\_other\_channel\_queues

```gdscript
func test_concurrent_channels_do_not_block_other_channel_queues() -> void
```
    
% ...
---
### test\_global\_interrupt\_stops\_running\_channels\_and\_clears\_queues

```gdscript
func test_global_interrupt_stops_running_channels_and_clears_queues() -> void
```
    
% ...
---
### test\_queue\_event\_block\_waits\_for\_correct\_background\_event\_under\_concurrency

```gdscript
func test_queue_event_block_waits_for_correct_background_event_under_concurrency() -> void
```
    
% ...
---
### test\_queue\_event\_block\_waits\_for\_correct\_front\_event\_under\_concurrency

```gdscript
func test_queue_event_block_waits_for_correct_front_event_under_concurrency() -> void
```
    
% ...
---
### test\_sequential\_front\_events\_preserve\_globals\_between\_runtime\_interpreters

```gdscript
func test_sequential_front_events_preserve_globals_between_runtime_interpreters() -> void
```
    
% ...
---
### test\_background\_event\_sees\_globals\_written\_by\_previous\_front\_event

```gdscript
func test_background_event_sees_globals_written_by_previous_front_event() -> void
```
    
% ...
---
### test\_running\_interpreter\_sees\_new\_global\_defined\_by\_other\_channel

```gdscript
func test_running_interpreter_sees_new_global_defined_by_other_channel() -> void
```
    
% ...
---
### test\_queue\_background\_event\_allows\_consecutive\_duplicate\_queue\_entries

```gdscript
func test_queue_background_event_allows_consecutive_duplicate_queue_entries() -> void
```
    
% ...
---
### test\_queue\_background\_event\_allows\_same\_event\_after\_current\_run\_starts

```gdscript
func test_queue_background_event_allows_same_event_after_current_run_starts() -> void
```
    
% ...
---
### test\_global\_interrupt\_preserves\_exception\_events

```gdscript
func test_global_interrupt_preserves_exception_events() -> void
```
    
% ...
---
### test\_scheduled\_front\_event\_runs\_after\_current\_front\_event\_while\_background\_is\_busy

```gdscript
func test_scheduled_front_event_runs_after_current_front_event_while_background_is_busy() -> void
```
    
% ...
---
### test\_global\_interrupt\_preserves\_scheduled\_events\_before\_dispatch

```gdscript
func test_global_interrupt_preserves_scheduled_events_before_dispatch() -> void
```
    
% ...
---
### test\_clear\_event\_queue\_preserves\_scheduled\_events

```gdscript
func test_clear_event_queue_preserves_scheduled_events() -> void
```
    
% ...
---
### test\_interrupt\_channel\_does\_not\_affect\_still\_scheduled\_front\_events

```gdscript
func test_interrupt_channel_does_not_affect_still_scheduled_front_events() -> void
```
    
% ...
---
### test\_immediate\_command\_preserves\_statement\_ordering

```gdscript
func test_immediate_command_preserves_statement_ordering() -> void
```
    
% ...
---
### test\_delayed\_command\_preserves\_statement\_ordering

```gdscript
func test_delayed_command_preserves_statement_ordering() -> void
```

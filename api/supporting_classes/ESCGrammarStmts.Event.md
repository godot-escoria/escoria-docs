
  (ESCGrammarStmts.Event)=
# ESCGrammarStmts.Event

**Extends:** {ref}`ESCGrammarStmt <ESCGrammarStmt>`
        
## Description

Represents an Escoria event, e.g. `:look`. An event can also be given a "target" to act on, e.g. `:use "wrench"`.



## Constants

### FLAG\_TK
```gdscript
const FLAG_TK = 1 # enum

```

### FLAG\_NO\_TT
```gdscript
const FLAG_NO_TT = 2 # enum

```

### FLAG\_NO\_UI
```gdscript
const FLAG_NO_UI = 4 # enum

```

### FLAG\_NO\_SAVE
```gdscript
const FLAG_NO_SAVE = 8 # enum

```

## Members
    
### source

```gdscript
var source: String
```

## Signals

### finished

```gdscript
signal finished()
```

Signal fired when the event has finished.

#### Parameters

None. 


### interrupted

```gdscript
signal interrupted()
```

Signal fired if the event has been interrupted.

#### Parameters

None. 


## Methods
    
% ...
---
### init

```gdscript
func init(name: ESCToken, target: ESCGrammarExprs.Literal, flags: Dictionary, body: ESCGrammarStmts.Block, object_global_id: String) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`ESCToken`|Token representing the event name.|yes|
|target|`ESCGrammarExprs.Literal`|a literal representing the global ID of an object the event is meant to act on; can be null.|yes|
|flags|`Dictionary`|an array containing event flags to be applied; can be null/empty.|yes|
|body|`ESCGrammarStmts.Block`|the body of the event; this is the script block that will be executed when the event is run.|yes|
|object_global_id|`String`|the object/room the event is attached to, if any (may be empty)|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_name

```gdscript
func get_name() -> ESCToken
```

The event's name (as an `ESCToken`).

#### Parameters

None. 
#### Returns

Returns the event's name (as an `ESCToken`). (`ESCToken`)
    
% ...
---
### get\_target

```gdscript
func get_target() -> ESCGrammarExprs.Literal
```

The target as a literal.

#### Parameters

None. 
#### Returns

Returns the target as a literal. (`ESCGrammarExprs.Literal`)
    
% ...
---
### get\_target\_name

```gdscript
func get_target_name() -> String
```

A string containing the name of the target, if it exists.

#### Parameters

None. 
#### Returns

Returns a string containing the name of the target, if it exists. (`String`)
    
% ...
---
### get\_event\_name

```gdscript
func get_event_name() -> String
```

The name of the event as a string.

#### Parameters

None. 
#### Returns

Returns the name of the event as a string. (`String`)
    
% ...
---
### get\_flags

```gdscript
func get_flags() -> int
```

The flags set for this event. Note that this is an integer that serves as a collection of mutually exclusive bits.

#### Parameters

None. 
#### Returns

Returns the flags set for this event. Note that this is an integer that serves as a collection of mutually exclusive bits. (`int`)
    
% ...
---
### get\_flags\_with\_conditions

```gdscript
func get_flags_with_conditions() -> Dictionary
```
    
% ...
---
### add\_flag

```gdscript
func add_flag(flag: int) -> void
```
    
% ...
---
### get\_body

```gdscript
func get_body() -> ESCGrammarStmts.Block
```

The body of the event. This is the script block that will be executed when the event is run.

#### Parameters

None. 
#### Returns

Returns the body of the event. This is the script block that will be executed when the event is run. (`ESCGrammarStmts.Block`)
    
% ...
---
### get\_object\_global\_id

```gdscript
func get_object_global_id() -> String
```
    
% ...
---
### get\_num\_statements\_in\_block

```gdscript
func get_num_statements_in_block() -> int
```

The number of top-level statements in the body. Generally only useful for internal purposes.

#### Parameters

None. 
#### Returns

Returns the number of top-level statements in the body. Generally only useful for internal purposes. (`int`)
    
% ...
---
### get\_running\_command

```gdscript
func get_running_command() -> Variant
```

The command currently being executed in this event.

#### Parameters

None. 
#### Returns

Returns the command currently being executed in this event. (`Variant`)
    
% ...
---
### set\_running\_command

```gdscript
func set_running_command(cmd: Variant) -> void
```

Sets the command that is currently being executed in this event.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|cmd|`Variant`|Command currently being executed for this event.|yes|

#### Returns

Returns nothing.
    
% ...
---
### clear\_running\_command

```gdscript
func clear_running_command() -> void
```

Clears the currently-running command.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### interrupt

```gdscript
func interrupt() -> void
```

Forces the event to be interrupted.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### is\_interrupted

```gdscript
func is_interrupted() -> bool
```

True iff the event has been interrupted.

#### Parameters

None. 
#### Returns

Returns true iff the event has been interrupted. (`bool`)
    
% ...
---
### reset\_interrupt

```gdscript
func reset_interrupt() -> void
```

Resets the "is interrupted" flag.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### emit\_finished

```gdscript
func emit_finished(rc: int) -> void
```

Emits the `finished` signal along with the indicated return code (`rc`).

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|rc|`int`|Return code emitted when the statement signals completion.|yes|

#### Returns

Returns nothing.
    
% ...
---
### accept

```gdscript
func accept(visitor: Variant) -> Variant
```

Method to invoke visitor-specific code.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|visitor|`Variant`|Visitor instance invoked to process this statement.|yes|

#### Returns

Returns nothing.

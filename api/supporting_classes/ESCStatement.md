
  (ESCStatement)=
# ESCStatement

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Abstract base class representing a "statement" that has been interpreted from an ASHES script file and is used to carry out its execution in Escoria.

NOTE: This class is legacy code related to the ESCScript language that precedes the newer ASHES scripting language used by Escoria. Although this class is extended to facilitate the execution of actual commands and dialogs, the name may be a bit misleading and may eventually be renamed or refactored.

## Members
    
### statements

```gdscript
var statements: Array
```

The list of command to be executed.
    
### source

```gdscript
var source: String
```

The source of this statement, e.g. an ASHES script or a class.
    
### is\_completed

```gdscript
var is_completed: bool
```

Indictates whether this statement has completed.
    
### current\_statement

```gdscript
var current_statement: ESCStatement
```

The currently running statement.
    
### from\_statement\_id

```gdscript
var from_statement_id: Variant
```

Value from which to start assigning the IDs of statements to be executed. Defaults to 0.
    
### bypass\_conditions

```gdscript
var bypass_conditions: Variant
```

Determines whether conditions will be checked during execution or skipped.
    
### parsed\_statements

```gdscript
var parsed_statements: Variant
```

TODO: Can probably delete.

## Signals

### finished

```gdscript
signal finished(event: ESCStatement, statement: ESCStatement, return_code: int)
```

Emitted when the event has finished running.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|event|`Variant`|`ESCStatement` representing the event whose execution completed.|yes|
|statement|`Variant`|`ESCStatement` that was running when the signal fired.|yes|
|return_code|`Variant`|Execution result code produced by the statement.|yes|



### interrupted

```gdscript
signal interrupted(event: ESCStatement, statement: ESCStatement, return_code: int)
```

Emitted if the event has been interrupted

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|event|`Variant`|`ESCStatement` representing the event whose execution was interrupted.|yes|
|statement|`Variant`|`ESCStatement` that was executing when the interruption occurred.|yes|
|return_code|`Variant`|Execution result code describing the interruption outcome.|yes|



## Methods
    
% ...
---
### exported

```gdscript
func exported() -> Dictionary
```

A `Dictionary` containing relevant data for serialization.

#### Parameters

None. 
#### Returns

Returns a `Dictionary` containing relevant data for serialization. (`Dictionary`)
    
% ...
---
### is\_valid

```gdscript
func is_valid() -> bool
```

`true` iff the statement is valid.

#### Parameters

None. 
#### Returns

Returns `true` iff the statement is valid. (`bool`)
    
% ...
---
### run

```gdscript
func run() -> int
```

Execute this statement and return its return code.

#### Parameters

None. 
#### Returns

Returns a `int` value. (`int`)
    
% ...
---
### interrupt

```gdscript
func interrupt() -> void
```

Interrupts the statement in the middle of its execution.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### reset\_interrupt

```gdscript
func reset_interrupt() -> void
```

Resets all affected statements' interrupts.

#### Parameters

None. 
#### Returns

Returns nothing.

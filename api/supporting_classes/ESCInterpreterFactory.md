
  (ESCInterpreterFactory)=
# ESCInterpreterFactory

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Factory class for producing an ASHES interpreter.



## Constants

### ESC\_INTERPRETER\_SCRIPT
```gdscript
const ESC_INTERPRETER_SCRIPT = <Object>

```

## Members

## Methods
    
% ...
---
### create\_interpreter

```gdscript
func create_interpreter(channel_name: String) -> ESCInterpreter
```

Produces an interpreter as a singleton.

#### Parameters

None. 
#### Returns

Returns a `ESCInterpreter` value. (`ESCInterpreter`)
    
% ...
---
### create\_utility\_interpreter

```gdscript
func create_utility_interpreter(channel_name: String) -> ESCInterpreter
```

Produces an interpreter for non-runtime utility work such as resolving or evaluating statements outside the event manager.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|channel_name|`String`|Optional channel name to assign to the created interpreter.|no|

#### Returns

Returns a cached-or-reseeded `ESCInterpreter` instance for utility usage. (`ESCInterpreter`)
    
% ...
---
### create\_runtime\_interpreter

```gdscript
func create_runtime_interpreter(channel_name: String) -> ESCInterpreter
```

Produces a fresh interpreter intended for event-manager runtime execution.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|channel_name|`String`|Optional channel name to assign to the created interpreter.|no|

#### Returns

Returns a newly-created `ESCInterpreter` instance for runtime usage. (`ESCInterpreter`)
    
% ...
---
### reset\_interpreter

```gdscript
func reset_interpreter() -> void
```

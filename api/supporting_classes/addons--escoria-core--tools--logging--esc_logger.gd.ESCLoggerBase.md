
  ("addons/escoria-core/tools/logging/esc_logger.gd".ESCLoggerBase)=
# "addons/escoria-core/tools/logging/esc_logger.gd".ESCLoggerBase

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Base class of all logger types.



## Constants

### LOG\_FILE\_FORMAT
```gdscript
const LOG_FILE_FORMAT = "log_%s_%s.log"

```
Log filename format
## Members
    
### dont\_assert

```gdscript
var dont_assert: bool
```

If true, assert() functions will not be called, thus the program won't exit or error. Resets to false after an assert() call was ignored once. Useful for console calls.

## Signals

### perform\_emergency\_savegame

```gdscript
signal perform_emergency_savegame()
```

Signal sent when Escoria requires performing an emergency savegame.

#### Parameters

None. 


### error\_message\_signal

```gdscript
signal error_message_signal(message: Variant)
```

Signal sent when an error or warning happened.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|message|`Variant`|Error or warning message emitted through the logger.|yes|



## Methods
    
% ...
---
### formatted\_message

```gdscript
func formatted_message(context: String, msg: String, letter: String) -> String
```

Formats a message depending on context, message and letter, then returns it. The formatted string

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|context|`String`|usually, the escoria file that sent the message.|yes|
|msg|`String`|logged message.|yes|
|letter|`String`|letter to add to the formatted log (I for Info, W for Warning...)|yes|

#### Returns

Returns a `String` value. (`String`)
    
% ...
---
### trace

```gdscript
func trace(owner: Object, msg: String) -> void
```

Trace log

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|owner|`Object`|caller object (usually, `self`)|yes|
|msg|`String`|logged message.|yes|

#### Returns

Returns nothing.
    
% ...
---
### debug

```gdscript
func debug(owner: Object, msg: String) -> void
```

Debug log

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|owner|`Object`|caller object (usually, `self`)|yes|
|msg|`String`|logged message.|yes|

#### Returns

Returns nothing.
    
% ...
---
### info

```gdscript
func info(owner: Object, msg: String) -> void
```

Info log

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|owner|`Object`|caller object (usually, `self`)|yes|
|msg|`String`|logged message.|yes|

#### Returns

Returns nothing.
    
% ...
---
### warn

```gdscript
func warn(owner: Object, msg: String) -> void
```

Warning log

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|owner|`Object`|caller object (usually, `self`)|yes|
|msg|`String`|logged message.|yes|

#### Returns

Returns nothing.
    
% ...
---
### error

```gdscript
func error(owner: Object, msg: String) -> void
```

Error log

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|owner|`Object`|caller object (usually, `self`)|yes|
|msg|`String`|logged message.|yes|

#### Returns

Returns nothing.

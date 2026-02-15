
  ("addons/escoria-core/tools/logging/esc_logger.gd".ESCLoggerFile)=
# "addons/escoria-core/tools/logging/esc_logger.gd".ESCLoggerFile

**Extends:** {ref}`"addons/escoria-core/tools/logging/esc_logger.gd".ESCLoggerBase <"addons/escoria-core/tools/logging/esc_logger.gd".ESCLoggerBase>`
        
## Description

A logger that logs to the terminal and to a log file.



## Members
    
### log\_file

```gdscript
var log_file: FileAccess
```

Log file handler

## Methods
    
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
    
% ...
---
### close\_logs

```gdscript
func close_logs() -> void
```

Close the log file cleanly

#### Parameters

None. 
#### Returns

Returns nothing.

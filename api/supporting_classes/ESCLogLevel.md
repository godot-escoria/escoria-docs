
  (ESCLogLevel)=
# ESCLogLevel

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Log levels for ESCLogger.



## Constants

### LOG\_ERROR
```gdscript
const LOG_ERROR = 0 # enum

```

### LOG\_WARNING
```gdscript
const LOG_WARNING = 1 # enum

```

### LOG\_INFO
```gdscript
const LOG_INFO = 2 # enum

```

### LOG\_DEBUG
```gdscript
const LOG_DEBUG = 3 # enum

```

### LOG\_TRACE
```gdscript
const LOG_TRACE = 4 # enum

```

### LEVEL\_MAP
```gdscript
const LEVEL_MAP = {"DEBUG": 3, "ERROR": 0, "INFO": 2, "TRACE": 4, "WARNING": 1}

```
A map of log level names to log level ints
## Methods
    
% ...
---
### determine\_escoria\_log\_level

```gdscript
func determine_escoria_log_level() -> int
```

Static function to determine the int log level value defined in Project Settings (Escoria>Debug>Log Level)

#### Parameters

None. 
#### Returns

Returns a `int` value. (`int`)

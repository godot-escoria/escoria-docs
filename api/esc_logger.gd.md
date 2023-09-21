<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# esc\_logger.gd

## Sub\-classes

### ESCLoggerBase

#### Constants Descriptions

### LOG\_DEBUG

```gdscript
const LOG_WARNING: int = 1
```

Valid log levels

### LOG\_ERROR

```gdscript
const LOG_WARNING: int = 1
```

Valid log levels

### LOG\_FILE\_FORMAT

```gdscript
const LOG_FILE_FORMAT: String = "log_%s_%s.log"
```

Log file format

### LOG\_INFO

```gdscript
const LOG_WARNING: int = 1
```

Valid log levels

### LOG\_TRACE

```gdscript
const LOG_WARNING: int = 1
```

Valid log levels

### LOG\_WARNING

```gdscript
const LOG_WARNING: int = 1
```

Valid log levels

#### Method Descriptions

### formatted\_message

```gdscript
func formatted_message(context: String, msg: String, letter: String) -> String
```

### trace

```gdscript
func trace(owner: Object, msg: String)
```

### debug

```gdscript
func debug(owner: Object, msg: String)
```

Debug log

### info

```gdscript
func info(owner: Object, msg: String)
```

### warn

```gdscript
func warn(owner: Object, msg: String)
```

Warning log

### error

```gdscript
func error(owner: Object, msg: String)
```

Error log

### get\_log\_level

```gdscript
func get_log_level() -> int
```

### ESCLoggerFile

#### Property Descriptions

### log\_file

```gdscript
var log_file: File
```

Log file handler

#### Method Descriptions

### trace

```gdscript
func trace(owner: Object, msg: String)
```

### debug

```gdscript
func debug(owner: Object, msg: String)
```

Debug log

### info

```gdscript
func info(owner: Object, msg: String)
```

### warn

```gdscript
func warn(owner: Object, msg: String)
```

Warning log

### error

```gdscript
func error(owner: Object, msg: String)
```

Error log

### close\_logs

```gdscript
func close_logs()
```

Close the log file cleanly

### ESCLoggerVerbose

#### Method Descriptions

### debug

```gdscript
func debug(owner: Object, msg: String)
```


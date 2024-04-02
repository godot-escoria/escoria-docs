<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# esc\_logger.gd

## Sub\-classes

### ESCLoggerBase

#### Constants Descriptions

### LOG\_DEBUG

```gdscript
const LOG_ERROR: int = 0
```

Valid log levels

### LOG\_ERROR

```gdscript
const LOG_ERROR: int = 0
```

Valid log levels

### LOG\_FILE\_FORMAT

```gdscript
const LOG_FILE_FORMAT: String = "log_%s_%s.log"
```

Log file format

### LOG\_INFO

```gdscript
const LOG_ERROR: int = 0
```

Valid log levels

### LOG\_TRACE

```gdscript
const LOG_ERROR: int = 0
```

Valid log levels

### LOG\_WARNING

```gdscript
const LOG_ERROR: int = 0
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

Trace log

### trace\_message

```gdscript
func trace_message(context: String, msg: String)
```

Direct message trace log (requiring a string for the context)

### debug

```gdscript
func debug(owner: Object, msg: String)
```

Debug log

### debug\_message

```gdscript
func debug_message(context: String, msg: String)
```

Static debug log (requiring a string for the context)

### info

```gdscript
func info(owner: Object, msg: String)
```

### info\_message

```gdscript
func info_message(context: String, msg: String)
```

Static info log (requiring a string for the context)

### warn

```gdscript
func warn(owner: Object, msg: String)
```

Warning log

### warn\_message

```gdscript
func warn_message(context: String, msg: String)
```

Static warning log (requiring a string for the context)

### error

```gdscript
func error(owner: Object, msg: String)
```

Error log

### error\_message

```gdscript
func error_message(context: String, msg: String)
```

Static error log (requiring a string for the context)

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

Trace log

### trace\_message

```gdscript
func trace_message(context: String, msg: String)
```

Static trace log

### debug

```gdscript
func debug(owner: Object, msg: String)
```

Debug log

### debug\_message

```gdscript
func debug_message(context: String, msg: String)
```

Static debug log

### info

```gdscript
func info(owner: Object, msg: String)
```

Info log

### info\_message

```gdscript
func info_message(context: String, msg: String)
```

Static info log

### warn

```gdscript
func warn(owner: Object, msg: String)
```

Warning log

### warn\_message

```gdscript
func warn_message(context: String, msg: String)
```

Static warning log

### error

```gdscript
func error(owner: Object, msg: String)
```

Error log

### error\_message

```gdscript
func error_message(context: String, msg: String)
```

Static eror log

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


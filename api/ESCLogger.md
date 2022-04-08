<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCLogger

**Extends:** [Object](../Object)

## Description

Logging framework for Escoria

## Constants Descriptions

### LOG\_DEBUG

```gdscript
const LOG_INFO: int = 2
```

Valid log levels

### LOG\_ERROR

```gdscript
const LOG_INFO: int = 2
```

Valid log levels

### LOG\_FILE\_FORMAT

```gdscript
const LOG_FILE_FORMAT: String = "log_%s_%s.log"
```

Log file format

### LOG\_INFO

```gdscript
const LOG_INFO: int = 2
```

Valid log levels

### LOG\_TRACE

```gdscript
const LOG_INFO: int = 2
```

Valid log levels

### LOG\_WARNING

```gdscript
const LOG_INFO: int = 2
```

Valid log levels

## Property Descriptions

### warning\_path

```gdscript
var warning_path: String
```

The path of the ESC file that was reported last (used for removing
duplicate warnings

### log\_file

```gdscript
var log_file: File
```

Log file handler

### crash\_savegame\_filename

```gdscript
var crash_savegame_filename
```

Crash save filename

### crashed

```gdscript
var crashed
```

Did we crash already?

### globals\_regex

```gdscript
var globals_regex: RegEx
```

Regex to match globals in debug strings

## Method Descriptions

### trace

```gdscript
func trace(string: String, args)
```

Log a trace message

Global variables can be substituted into the text by wrapping the global
name in braces.
e.g. trace "There are {coin_count} coins remaining".

#### Parameters

* string: Text to log
* args: Additional information

### debug

```gdscript
func debug(string: String, args)
```

Log a debug message

Global variables can be substituted into the text by wrapping the global
name in braces.
e.g. debug "There are {coin_count} coins remaining".

#### Parameters

* string: Text to log
* args: Additional information

### info

```gdscript
func info(string: String, args)
```

Log an info message

Global variables can be substituted into the text by wrapping the global
name in braces.
e.g. info "There are {coin_count} coins remaining".

#### Parameters

* string: Text to log
* args: Additional information

### warning

```gdscript
func warning(string: String, args)
```

Log a warning message

Global variables can be substituted into the text by wrapping the global
name in braces.
e.g. warning "There are {coin_count} coins remaining".

#### Parameters

* string: Text to log
* args: Additional information

### error

```gdscript
func error(string: String, args, do_savegame: bool = true)
```

Log an error message

Global variables can be substituted into the text by wrapping the global
name in braces.
e.g. error "There are {coin_count} coins remaining".

#### Parameters

* string: Text to log
* args: Additional information

### report\_warnings

```gdscript
func report_warnings(p_path: String, warnings: Array, report_once = false) -> void
```

Log a warning message about an ESC file

#### Parameters

* p_path: Path to the file
* warnings: Array of warnings to put out
* report_once: Additional messages about the same file will be ignored

### report\_errors

```gdscript
func report_errors(p_path: String, errors: Array) -> void
```

Log an error message about an ESC file

#### Parameters

* p_path: Path to the file
* errors: Array of errors to put out

### close\_logs

```gdscript
func close_logs()
```

Close the log file cleanly
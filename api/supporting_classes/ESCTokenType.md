
  (ESCTokenType)=
# ESCTokenType

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Defines all possible token types for ASHES.

Note that this way of representing enums is a holdover from Godot 3.x, and should be updated to the Godot 4 paradigm at some point.

## Constants

### INDENT
```gdscript
const INDENT = 0 # enum "TokenType"

```

### DEDENT
```gdscript
const DEDENT = 1 # enum "TokenType"

```

### NEWLINE
```gdscript
const NEWLINE = 2 # enum "TokenType"

```

### COLON
```gdscript
const COLON = 3 # enum "TokenType"

```

### COMMA
```gdscript
const COMMA = 4 # enum "TokenType"

```

### DOT
```gdscript
const DOT = 5 # enum "TokenType"

```

### LEFT\_PAREN
```gdscript
const LEFT_PAREN = 6 # enum "TokenType"

```

### LEFT\_SQUARE
```gdscript
const LEFT_SQUARE = 7 # enum "TokenType"

```

### RIGHT\_PAREN
```gdscript
const RIGHT_PAREN = 8 # enum "TokenType"

```

### RIGHT\_SQUARE
```gdscript
const RIGHT_SQUARE = 9 # enum "TokenType"

```

### MINUS
```gdscript
const MINUS = 10 # enum "TokenType"

```

### PIPE
```gdscript
const PIPE = 11 # enum "TokenType"

```

### PLUS
```gdscript
const PLUS = 12 # enum "TokenType"

```

### SLASH
```gdscript
const SLASH = 13 # enum "TokenType"

```

### STAR
```gdscript
const STAR = 14 # enum "TokenType"

```

### BANG
```gdscript
const BANG = 15 # enum "TokenType"

```

### BANG\_EQUAL
```gdscript
const BANG_EQUAL = 16 # enum "TokenType"

```

### BANG\_QUESTION
```gdscript
const BANG_QUESTION = 17 # enum "TokenType"

```

### EQUAL
```gdscript
const EQUAL = 18 # enum "TokenType"

```

### EQUAL\_EQUAL
```gdscript
const EQUAL_EQUAL = 19 # enum "TokenType"

```

### GREATER
```gdscript
const GREATER = 20 # enum "TokenType"

```

### GREATER\_EQUAL
```gdscript
const GREATER_EQUAL = 21 # enum "TokenType"

```

### LESS
```gdscript
const LESS = 22 # enum "TokenType"

```

### LESS\_EQUAL
```gdscript
const LESS_EQUAL = 23 # enum "TokenType"

```

### QUESTION
```gdscript
const QUESTION = 24 # enum "TokenType"

```

### QUESTION\_BANG
```gdscript
const QUESTION_BANG = 25 # enum "TokenType"

```

### IDENTIFIER
```gdscript
const IDENTIFIER = 26 # enum "TokenType"

```

### STRING
```gdscript
const STRING = 27 # enum "TokenType"

```

### NUMBER
```gdscript
const NUMBER = 28 # enum "TokenType"

```

### ACTIVE
```gdscript
const ACTIVE = 29 # enum "TokenType"

```

### AND
```gdscript
const AND = 30 # enum "TokenType"

```

### BREAK
```gdscript
const BREAK = 31 # enum "TokenType"

```

### DONE
```gdscript
const DONE = 32 # enum "TokenType"

```

### ELIF
```gdscript
const ELIF = 33 # enum "TokenType"

```

### ELSE
```gdscript
const ELSE = 34 # enum "TokenType"

```

### FALSE
```gdscript
const FALSE = 35 # enum "TokenType"

```

### GLOBAL
```gdscript
const GLOBAL = 36 # enum "TokenType"

```

### IF
```gdscript
const IF = 37 # enum "TokenType"

```

### IN
```gdscript
const IN = 38 # enum "TokenType"

```

### INVENTORY
```gdscript
const INVENTORY = 39 # enum "TokenType"

```

### IS
```gdscript
const IS = 40 # enum "TokenType"

```

### NIL
```gdscript
const NIL = 41 # enum "TokenType"

```

### NOT
```gdscript
const NOT = 42 # enum "TokenType"

```

### OR
```gdscript
const OR = 43 # enum "TokenType"

```

### PASS
```gdscript
const PASS = 44 # enum "TokenType"

```

### RETURN
```gdscript
const RETURN = 45 # enum "TokenType"

```

### STOP
```gdscript
const STOP = 46 # enum "TokenType"

```

### TRUE
```gdscript
const TRUE = 47 # enum "TokenType"

```

### VAR
```gdscript
const VAR = 48 # enum "TokenType"

```

### WHILE
```gdscript
const WHILE = 49 # enum "TokenType"

```

### EOF
```gdscript
const EOF = 50 # enum "TokenType"

```

## Methods
    
% ...
---
### get\_token\_type\_name

```gdscript
func get_token_type_name(type: int) -> String
```

Translates a given token type into its name.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|type|`int`|TokenType enumeration value to translate to its name.|yes|

#### Returns

Returns a `String` value. (`String`)

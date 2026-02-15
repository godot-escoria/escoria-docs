
  (ESCScanner)=
# ESCScanner

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

ASHES language scanner.

This is the first link in the ASHES compiler toolchain, and takes in ASHES script as text in order to provide a list of tokens to be handled by the ASHES parser.

## Constants

### GLOBAL\_ID\_PREFIX
```gdscript
const GLOBAL_ID_PREFIX = "$"

```
In ASHES, an identifier starting with `$` is interpreted as a lookup in `ESCObjectManager.get_object()` with the value after the `$`.
## Members

## Methods
    
% ...
---
### set\_source

```gdscript
func set_source(source: String) -> void
```

Sets the ASHES source as a string. This is the source that will be scanned and turned into tokens.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|source|`String`|Raw ASHES source text to tokenize.|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_filename

```gdscript
func set_filename(filename: String) -> void
```

Sets the path of the file containing the source to be scanned.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|filename|`String`|Path associated with the source (used for error reporting).|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_filename

```gdscript
func get_filename() -> String
```

The path of the file containing the source to be scanned.

#### Parameters

None. 
#### Returns

Returns the path of the file containing the source to be scanned. (`String`)
    
% ...
---
### scan\_tokens

```gdscript
func scan_tokens() -> Array
```

Entry point for the scanner. Begins scanning the source and returns an array of tokens corresponding to the source. `set_source` must be called prior to calling this method.

#### Parameters

None. 
#### Returns

Returns a `Array` value. (`Array`)

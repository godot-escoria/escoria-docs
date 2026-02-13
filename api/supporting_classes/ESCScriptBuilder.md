
  (ESCScriptBuilder)=
# ESCScriptBuilder

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Convenience class to help build scripts in code for use with the ASHES compiler toolchain. Loosely follows the Builder pattern.



## Members

## Methods
    
% ...
---
### build

```gdscript
func build() -> Variant
```

The script as it currently exists. No building is actually performed and therefore no error checking of any kind is performed.

#### Parameters

None. 
#### Returns

Returns the script as it currently exists. No building is actually performed and therefore no error checking of any kind is performed. (`String`)
    
% ...
---
### add\_event

```gdscript
func add_event(name: String, flags: Array) -> Variant
```

Adds an Escoria event to the script.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Event identifier to add to the script.|yes|
|flags|`Array`|an array of flags for the event, e.g. `TK`|yes|

#### Returns

Returns nothing.
    
% ...
---
### begin\_block

```gdscript
func begin_block() -> Variant
```

Begins a new block/scope for the script.

#### Parameters

None. 
#### Returns

Returns `self` for method chaining. (`ESCScriptBuilder`)
    
% ...
---
### end\_block

```gdscript
func end_block() -> Variant
```

Closes the current block/scope of the script.

#### Parameters

None. 
#### Returns

Returns `self` for method chaining. (`ESCScriptBuilder`)
    
% ...
---
### add\_command

```gdscript
func add_command(name: String, args: Variant) -> Variant
```

Adds a command to be called in the script.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Command name to append to the script.|yes|
|args|`Variant`|the arguments for the command; can be a single argument or an array|yes|

#### Returns

Returns nothing.

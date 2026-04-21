
  (ESCCompiler)=
# ESCCompiler

**Extends:** {ref}`Resource <Resource>`
        
## Description

Compiler for the ASHES language.



## Constants

### COMMAND\_DIRECTORIES
```gdscript
const COMMAND_DIRECTORIES = "escoria/main/command_directories"

```
This must match `ESCProjectSettingsManager.COMMAND_DIRECTORIES`. We do not reference it directly in order to avoid circular dependencies.
## Members
    
### had\_error

```gdscript
var had_error: bool
```

Whether an error has been encountered during the compilation process.

## Methods
    
% ...
---
### load\_commands

```gdscript
func load_commands() -> Array
```

Static method to pre-load all ASHES commands from `ESCProjectSettingsManager.COMMAND_DIRECTORIES`. All commands must extend `ESCBaseCommand`.

#### Parameters

None. 
#### Returns

Returns a `Array` value. (`Array`)
    
% ...
---
### load\_globals

```gdscript
func load_globals() -> Dictionary
```

Static method to load all Escoria reserved objects and reserved globals.

#### Parameters

None. 
#### Returns

Returns a `Dictionary` value. (`Dictionary`)
    
% ...
---
### load\_esc\_file

```gdscript
func load_esc_file(path: String, associated_global_id: String) -> ESCScript
```

Load an ESC file from a file resource. We also accept an optional global ID of whatever object is associated with the ESC file. Note that we don't need to do the same for a room-attached script since the current room's global_id is always available as an Escoria global.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|path|`String`|the path of the script file to load|yes|
|associated_global_id|`String`|global ID of the object/room associated with the script file, if any (may be empty)|no|

#### Returns

Returns a `ESCScript` value. (`ESCScript`)
    
% ...
---
### compile

```gdscript
func compile(script: String, _path: String) -> ESCScript
```

Compiles the passed-in script. TODO: `path` is extraneous and left in for legacy purposes; at some point, this will be removed which will require updating other methods that reference this one to ensure they don't pass in a second argument.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|script|`String`|A `String` containing the entirety of the script to be compiled.|yes|
|path|`String`|NOT USED.|no|

#### Returns

Returns a `ESCScript` value. (`ESCScript`)

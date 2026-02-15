
  (ESCParser)=
# ESCParser

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Class that handles parsing of scanned tokens in order to generate a list of statements for the interpreter to execute.

Note that the vast majority of this class consists of (effectively) private methods in order to facilitate encapsulation, but if you're interested in how the parser is implemented, [check out the class in GitHub](https://github.com/godot-escoria/escoria-demo-game/blob/main/addons/escoria-core/game/core-scripts/esc/compiler/esc_interpreter.gd)

## Members

## Methods
    
% ...
---
### init

```gdscript
func init(compiler: Variant, tokens: Array, associated_object_global_id: String) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|compiler|`Variant`|a reference to the ASHES compiler; used primarily for error tracking|yes|
|tokens|`Array`|an array of tokens produced by the ASHES scanner|yes|
|associated_object_global_id|`String`|string containing the global ID of the associated object/room to be passed on to events|yes|

#### Returns

Returns nothing.
    
% ...
---
### parse

```gdscript
func parse() -> Array
```

Entry point for the parser. Begins parsing the tokens passed in to the `init` method.

#### Parameters

None. 
#### Returns

Returns an array of statements for the interpreter to execute. (`Array`)

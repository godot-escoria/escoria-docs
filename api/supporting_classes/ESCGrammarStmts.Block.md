
  (ESCGrammarStmts.Block)=
# ESCGrammarStmts.Block

**Extends:** {ref}`ESCGrammarStmt <ESCGrammarStmt>`
        
## Description

Represents a block of statements in a script.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(statements: Array) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|statements|`Array`|Statements contained within the block body.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_statements

```gdscript
func get_statements() -> Array
```

The statements contained in this block as an array.

#### Parameters

None. 
#### Returns

Returns the statements contained in this block as an array. (`Array`)
    
% ...
---
### accept

```gdscript
func accept(visitor: Variant) -> Variant
```

Method to invoke visitor-specific code.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|visitor|`Variant`|Visitor instance invoked to process this statement.|yes|

#### Returns

Returns nothing.


  (ESCGrammarStmts.Global)=
# ESCGrammarStmts.Global

**Extends:** {ref}`ESCGrammarStmt <ESCGrammarStmt>`
        
## Description

Represents a global variable declaration and a possible initializer.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(name: ESCToken, initializer: ESCGrammarExpr) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`ESCToken`|Token representing the variable's name.|yes|
|initializer|`ESCGrammarExpr`|Expression used to compute the initial value.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_name

```gdscript
func get_name() -> ESCToken
```

The global variable's name (as an `ESCToken`).

#### Parameters

None. 
#### Returns

Returns the global variable's name (as an `ESCToken`). (`ESCToken`)
    
% ...
---
### get\_initializer

```gdscript
func get_initializer() -> ESCGrammarExpr
```

The initalizer expression.

#### Parameters

None. 
#### Returns

Returns the initalizer expression. (`ESCGrammarExpr`)
    
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


  (ESCGrammarStmts.ESCExpression)=
# ESCGrammarStmts.ESCExpression

**Extends:** {ref}`ESCGrammarStmt <ESCGrammarStmt>`
        
## Description

Represents an expression to be evaluated that is contained within a statement.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(expression: ESCGrammarExpr) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expression|`ESCGrammarExpr`|Expression evaluated by the statement.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_expression

```gdscript
func get_expression() -> ESCGrammarExpr
```

The expression this `ESCExpression` represents.

#### Parameters

None. 
#### Returns

Returns the expression this `ESCExpression` represents. (`ESCGrammarExpr`)
    
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

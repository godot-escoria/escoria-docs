
  (ESCGrammarExprs.Grouping)=
# ESCGrammarExprs.Grouping

**Extends:** {ref}`ESCGrammarExpr <ESCGrammarExpr>`
        
## Description

Represents an expression surrounded by parentheses, imparting a higher precedence. For example, `(1 + 1) * 2`.



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
|expression|`ESCGrammarExpr`|the expression contained inside the parentheses|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_expression

```gdscript
func get_expression() -> ESCGrammarExpr
```

The grouped expression.

#### Parameters

None. 
#### Returns

Returns the grouped expression. (`ESCGrammarExpr`)
    
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
|visitor|`Variant`|Visitor instance invoked to process this expression.|yes|

#### Returns

Returns the result of visiting this grouping expression. (`Variant`)

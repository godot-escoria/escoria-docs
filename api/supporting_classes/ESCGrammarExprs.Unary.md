
  (ESCGrammarExprs.Unary)=
# ESCGrammarExprs.Unary

**Extends:** {ref}`ESCGrammarExpr <ESCGrammarExpr>`
        
## Description

Represents a unary expression; that is, an expression that requires only one operand and an operator that takes the operand as input. Examples include NOT, negative numbers.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(operator: ESCToken, right: ESCGrammarExpr) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|operator|`ESCToken`|Token representing the operator applied to the operands.|yes|
|right|`ESCGrammarExpr`|Right-hand operand expression.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_right

```gdscript
func get_right() -> ESCGrammarExpr
```

The sole operand of the unary expression.

#### Parameters

None. 
#### Returns

Returns the sole operand of the unary expression. (`ESCGrammarExpr`)
    
% ...
---
### get\_operator

```gdscript
func get_operator() -> ESCToken
```

The operator the unary expression.

#### Parameters

None. 
#### Returns

Returns the operator the unary expression. (`ESCToken`)
    
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

Returns the result of visiting this unary expression. (`Variant`)

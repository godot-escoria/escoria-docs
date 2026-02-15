
  (ESCGrammarExprs.Binary)=
# ESCGrammarExprs.Binary

**Extends:** {ref}`ESCGrammarExpr <ESCGrammarExpr>`
        
## Description

Represents a binary expression; that is, an expression that requires two operands (a left-hand side, LHS, and a right-hand side, RHS) and an operator that takes both operands as input. Examples include addition, subtraction.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(left: ESCGrammarExpr, operator: ESCToken, right: ESCGrammarExpr) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|left|`ESCGrammarExpr`|Left-hand operand expression.|yes|
|operator|`ESCToken`|Token representing the operator applied to the operands.|yes|
|right|`ESCGrammarExpr`|Right-hand operand expression.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_left

```gdscript
func get_left() -> ESCGrammarExpr
```

The LHS of the binary expression.

#### Parameters

None. 
#### Returns

Returns the LHS of the binary expression. (`ESCGrammarExpr`)
    
% ...
---
### get\_right

```gdscript
func get_right() -> ESCGrammarExpr
```

The RHS of the binary expression.

#### Parameters

None. 
#### Returns

Returns the RHS of the binary expression. (`ESCGrammarExpr`)
    
% ...
---
### get\_operator

```gdscript
func get_operator() -> ESCToken
```

The operator the binary expression.

#### Parameters

None. 
#### Returns

Returns the operator the binary expression. (`ESCToken`)
    
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

Returns the result of visiting this binary expression. (`Variant`)

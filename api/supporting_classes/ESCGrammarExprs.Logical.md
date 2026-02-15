
  (ESCGrammarExprs.Logical)=
# ESCGrammarExprs.Logical

**Extends:** {ref}`ESCGrammarExpr <ESCGrammarExpr>`
        
## Description

Represents a logical expression. The left-hand side (LHS) is evaluated against the right-hand side (RHS) using a predicate with a determination of truth being returned. Both sides must themselves evaluate to a boolean. Examples include AND, OR.



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

The LHS of the logical expression.

#### Parameters

None. 
#### Returns

Returns the LHS of the logical expression. (`ESCGrammarExpr`)
    
% ...
---
### get\_right

```gdscript
func get_right() -> ESCGrammarExpr
```

The RHS of the logical expression.

#### Parameters

None. 
#### Returns

Returns the RHS of the logical expression. (`ESCGrammarExpr`)
    
% ...
---
### get\_operator

```gdscript
func get_operator() -> ESCToken
```

The operator (predicate) of the logical expression.

#### Parameters

None. 
#### Returns

Returns the operator (predicate) of the logical expression. (`ESCToken`)
    
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

Returns nothing.

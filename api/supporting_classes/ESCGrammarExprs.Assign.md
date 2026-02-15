
  (ESCGrammarExprs.Assign)=
# ESCGrammarExprs.Assign

**Extends:** {ref}`ESCGrammarExpr <ESCGrammarExpr>`
        
## Description

Represents an assignment expression. For example, assigning a value to a variable.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(name: ESCToken, value: ESCGrammarExpr) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`ESCToken`|Token representing the variable's name to assign.|yes|
|value|`ESCGrammarExpr`|the value to assign to the variable; must be an expression itself|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_name

```gdscript
func get_name() -> ESCToken
```

The variables name (as an `ESCToken`).

#### Parameters

None. 
#### Returns

Returns the variables name (as an `ESCToken`). (`ESCToken`)
    
% ...
---
### get\_value

```gdscript
func get_value() -> ESCGrammarExpr
```

The value (as an expression) to be assigned to the variable.

#### Parameters

None. 
#### Returns

Returns the value (as an expression) to be assigned to the variable. (`ESCGrammarExpr`)
    
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

Returns the result of visiting this assignment expression. (`Variant`)

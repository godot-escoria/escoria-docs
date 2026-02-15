
  (ESCGrammarExprs.InInventory)=
# ESCGrammarExprs.InInventory

**Extends:** {ref}`ESCGrammarExpr <ESCGrammarExpr>`
        
## Description

Represents the "in" operator used to check whether the specified identifier currently exists in the user's inventory.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(identifier: ESCGrammarExpr) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|identifier|`ESCGrammarExpr`|Expression that resolves to the identifier being modified.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_identifier

```gdscript
func get_identifier() -> ESCGrammarExpr
```

The identifier to be checked against the user's inventory.

#### Parameters

None. 
#### Returns

Returns the identifier to be checked against the user's inventory. (`ESCGrammarExpr`)
    
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

Returns the result of visiting this inventory check expression. (`Variant`)


  (ESCGrammarExprs.Is)=
# ESCGrammarExprs.Is

**Extends:** {ref}`ESCGrammarExpr <ESCGrammarExpr>`
        
## Description

Represents the "is" operator; used to check whether the object corresponding to the given identifier is 'active' or in an otherwise-specified state. If the identifier is a string literal, the corresponding object must be in the user's inventory.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(identifier: ESCGrammarExpr, state: ESCGrammarExpr, descriptor: ESCToken) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|identifier|`ESCGrammarExpr`|the expression representing the identifier of the object to examine|yes|
|state|`ESCGrammarExpr`|the expression to evaluate that is used when checking the state of the object represented by `identifier`|yes|
|descriptor|`ESCToken`|not currently used|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_identifier

```gdscript
func get_identifier() -> ESCGrammarExpr
```

The identifier expression of the object to be examined.

#### Parameters

None. 
#### Returns

Returns the identifier expression of the object to be examined. (`ESCGrammarExpr`)
    
% ...
---
### get\_state

```gdscript
func get_state() -> ESCGrammarExpr
```

The state expression to be checked against the object corresponding to `identifier`

#### Parameters

None. 
#### Returns

Returns the state expression to be checked against the object corresponding to `identifier`. (`ESCGrammarExpr`)
    
% ...
---
### get\_descriptor

```gdscript
func get_descriptor() -> ESCToken
```

Not currently used.

#### Parameters

None. 
#### Returns

Returns a `ESCToken` value. (`ESCToken`)
    
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

Returns the result of visiting this state check expression. (`Variant`)

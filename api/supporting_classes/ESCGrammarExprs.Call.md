
  (ESCGrammarExprs.Call)=
# ESCGrammarExprs.Call

**Extends:** {ref}`ESCGrammarExpr <ESCGrammarExpr>`
        
## Description

Represents a function call.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(callee: ESCGrammarExpr, paren: ESCToken, arguments: Array) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|callee|`ESCGrammarExpr`|the expression representing the function to be called|yes|
|paren|`ESCToken`|token containing debug information for feedback purposes|yes|
|arguments|`Array`|array containing arguments to be passed to the callee|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_callee

```gdscript
func get_callee() -> ESCGrammarExpr
```

The callee expression.

#### Parameters

None. 
#### Returns

Returns the callee expression. (`ESCGrammarExpr`)
    
% ...
---
### get\_arguments

```gdscript
func get_arguments() -> Array
```

The arguments array.

#### Parameters

None. 
#### Returns

Returns the arguments array. (`Array`)
    
% ...
---
### get\_paren\_token

```gdscript
func get_paren_token() -> ESCToken
```

The paren (debug) token.

#### Parameters

None. 
#### Returns

Returns the paren (debug) token. (`ESCToken`)
    
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

Returns the result of visiting this call expression. (`Variant`)

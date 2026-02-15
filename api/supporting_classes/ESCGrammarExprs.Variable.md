
  (ESCGrammarExprs.Variable)=
# ESCGrammarExprs.Variable

**Extends:** {ref}`ESCGrammarExpr <ESCGrammarExpr>`
        
## Description

Represents a variable in the script.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(name: ESCToken) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`ESCToken`|Token representing the variable's name.|yes|

#### Returns

Returns nothing.
    
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

Returns the result of visiting this variable expression. (`Variant`)
    
% ...
---
### get\_name

```gdscript
func get_name() -> ESCToken
```

The variable's name (as an `ESCToken`).

#### Parameters

None. 
#### Returns

Returns the variable's name (as an `ESCToken`). (`ESCToken`)


  (ESCGrammarExprs.Literal)=
# ESCGrammarExprs.Literal

**Extends:** {ref}`ESCGrammarExpr <ESCGrammarExpr>`
        
## Description

Represents a literal value in the script.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(value: Variant) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|value|`Variant`|the value of the literal|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_value

```gdscript
func get_value() -> Variant
```

The literal's value.

#### Parameters

None. 
#### Returns

Returns the literal's value. (`Variant`)
    
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

Returns the result of visiting this literal expression. (`Variant`)

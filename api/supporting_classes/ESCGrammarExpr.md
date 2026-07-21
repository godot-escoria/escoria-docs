
  (ESCGrammarExpr)=
# ESCGrammarExpr

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Base class that expressions must inherit from as part of the "Visitor" pattern.

All inheriting classes must implement an `accept` method to invoke the visitor. For more information on the "Visitor" pattern, see: (Visitor Pattern)[https://en.wikipedia.org/wiki/Visitor_pattern]

## Methods
    
% ...
---
### accept

```gdscript
func accept(_visitor: Variant) -> void
```

Method that invokes another method in the visitor against this, the implementing class.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|visitor|`Variant`|Visitor instance that exposes a method for handling this expression.|yes|

#### Returns

Returns nothing.

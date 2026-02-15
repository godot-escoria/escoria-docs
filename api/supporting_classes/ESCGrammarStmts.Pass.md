
  (ESCGrammarStmts.Pass)=
# ESCGrammarStmts.Pass

**Extends:** {ref}`ESCGrammarStmt <ESCGrammarStmt>`
        
## Description

Represents the equivalent of the GDScript `pass` statement and behaves exactly the same way.



## Methods
    
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
|visitor|`Variant`|Visitor instance invoked to process this statement.|yes|

#### Returns

Returns nothing.

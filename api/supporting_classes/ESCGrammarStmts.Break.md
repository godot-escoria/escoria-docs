
  (ESCGrammarStmts.Break)=
# ESCGrammarStmts.Break

**Extends:** {ref}`ESCGrammarStmt <ESCGrammarStmt>`
        
## Description

Represents a `break` statement. Can be used to break out of a loop or a dialog. If used to break out of a nested dialog, an optional argument can be given that specifies how many levels of nested dialogs to break out of, including out of all nested dialogs.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(levels: ESCGrammarExpr) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|levels|`ESCGrammarExpr`|an expression whose result will be used to determine how many levels of nested dialogs to break out from; not applicable for loops.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_levels

```gdscript
func get_levels() -> ESCGrammarExpr
```

The expression whose result represents the number of nested dialog levels to break out from.

#### Parameters

None. 
#### Returns

Returns the expression whose result represents the number of nested dialog levels to break out from. (`ESCGrammarExpr`)
    
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

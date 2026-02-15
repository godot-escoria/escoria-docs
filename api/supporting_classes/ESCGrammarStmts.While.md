
  (ESCGrammarStmts.While)=
# ESCGrammarStmts.While

**Extends:** {ref}`ESCGrammarStmt <ESCGrammarStmt>`
        
## Description

Represents a `while` loop. Uses the form:
```
while <condition>:
<block>
```



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(condition: ESCGrammarExpr, body: ESCGrammarStmt) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|condition|`ESCGrammarExpr`|the expression to be evaluated and tested in order for the `while` loop to be entered/continue executing.|yes|
|body|`ESCGrammarStmt`|the block of statements to be executed should `condition` evaluate to `true`.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_condition

```gdscript
func get_condition() -> ESCGrammarExpr
```

The expression/predicate to be evaluated for the `while` block.

#### Parameters

None. 
#### Returns

Returns the expression/predicate to be evaluated for the `while` block. (`ESCGrammarExpr`)
    
% ...
---
### get\_body

```gdscript
func get_body() -> ESCGrammarStmt
```

The block of statements to be executed should `condition` evaluate to `true`.

#### Parameters

None. 
#### Returns

Returns the block of statements to be executed should `condition` evaluate to `true`. (`ESCGrammarStmt`)
    
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


  (ESCGrammarStmts.If)=
# ESCGrammarStmts.If

**Extends:** {ref}`ESCGrammarStmt <ESCGrammarStmt>`
        
## Description

Represents an `if` statement. Uses the form:
```
if <expression>:
<block>
elif <expression>:
<block>
else:
<block>
```

- Can contain multiple `elif` blocks.
- `elif` and `else` blocks are optional.



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(condition: ESCGrammarExpr, then_branch: ESCGrammarStmts.Block, elif_branches: Array, else_branch: ESCGrammarStmts.Block) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|condition|`ESCGrammarExpr`|the expression to be evaluated and tested for the `if` block.|yes|
|then_branch|`ESCGrammarStmts.Block`|the block of statements to be executed should `condition` evaluate to `true`.|yes|
|elif_branches|`Array`|an array containing any desired `elif` branches, with each element corresponding to its own `if` statement.|yes|
|else_branch|`ESCGrammarStmts.Block`|the block of staetments to be executed should `condition` evaluate to `false`.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_condition

```gdscript
func get_condition() -> ESCGrammarExpr
```

The expression/predicate to be evaluated for the `if` block.

#### Parameters

None. 
#### Returns

Returns the expression/predicate to be evaluated for the `if` block. (`ESCGrammarExpr`)
    
% ...
---
### get\_then\_branch

```gdscript
func get_then_branch() -> ESCGrammarStmts.Block
```

The block of statements to be executed should `condition` evaluate to `true`.

#### Parameters

None. 
#### Returns

Returns the block of statements to be executed should `condition` evaluate to `true`. (`ESCGrammarStmts.Block`)
    
% ...
---
### get\_elif\_branches

```gdscript
func get_elif_branches() -> Array
```

The array of `elif` branches to include as part of this `if` statement.

#### Parameters

None. 
#### Returns

Returns the array of `elif` branches to include as part of this `if` statement. (`Array`)
    
% ...
---
### get\_else\_branch

```gdscript
func get_else_branch() -> ESCGrammarStmts.Block
```

The block of statements to be executed should `condition` evaluate to `false`.

#### Parameters

None. 
#### Returns

Returns the block of statements to be executed should `condition` evaluate to `false`. (`ESCGrammarStmts.Block`)
    
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


  (ESCResolver)=
# ESCResolver

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Resolves script variables to ensure that scoping rules are obeyed.

The class will throw errors if scoping rules are broken or otherwise not followed.

## Members

## Methods
    
% ...
---
### resolve

```gdscript
func resolve(statements: Variant) -> void
```

Entry point for the resolver. Begins attempting to resolve one or more statements passed in.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|statements|`Variant`|a single `ESCGrammarStmt`-derived statement or an array of them, representing the statements to be resolved|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_event\_stmt

```gdscript
func visit_event_stmt(stmt: ESCGrammarStmts.Event) -> void
```

Attempts to resolve an Escoria event, e.g. `:look`.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Event`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_block\_stmt

```gdscript
func visit_block_stmt(stmt: ESCGrammarStmts.Block) -> void
```

Attempts to resolve a block statement.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Block`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_expression\_stmt

```gdscript
func visit_expression_stmt(stmt: ESCGrammarStmts.ESCExpression) -> void
```

Attempts to resolve an expression contained in a statement.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.ESCExpression`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_if\_stmt

```gdscript
func visit_if_stmt(stmt: ESCGrammarStmts.If) -> void
```

Attempts to resolve the various parts of an `if` statement, i.e. the predicates and related branches.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.If`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_while\_stmt

```gdscript
func visit_while_stmt(stmt: ESCGrammarStmts.While) -> void
```

Attempts to resolve the predicate of a `while` loop along with the loop body.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.While`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_pass\_stmt

```gdscript
func visit_pass_stmt(_stmt: ESCGrammarStmts.Pass) -> void
```

`pass` statements contain nothing to resolve, so are skipped over.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Pass`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_stop\_stmt

```gdscript
func visit_stop_stmt(_stmt: ESCGrammarStmts.Stop) -> void
```

`stop` statements contain nothing to resolve, so are skipped over.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Stop`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_var\_stmt

```gdscript
func visit_var_stmt(stmt: ESCGrammarStmts.Var) -> void
```

Attempts to resolve a variable declaration statement along with its possible initializer.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Var`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_global\_stmt

```gdscript
func visit_global_stmt(_stmt: ESCGrammarStmts.Global) -> void
```

`global` statements are available at all scoping levels and so require no resolution.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Global`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_dialog\_option\_stmt

```gdscript
func visit_dialog_option_stmt(stmt: ESCGrammarStmts.DialogOption) -> void
```

Attempts to resolve the various parts of a dialog option, i.e. the option expression, the condition (if one exists), and the body of the option.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.DialogOption`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_break\_stmt

```gdscript
func visit_break_stmt(stmt: ESCGrammarStmts.Break) -> void
```

Attempts to resolve a `break` statement if used inside a dialog.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Break`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_done\_stmt

```gdscript
func visit_done_stmt(_stmt: ESCGrammarStmts.Done) -> void
```

`done` statements contain nothing to resolve, so are skipped over.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Done`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_dialog\_stmt

```gdscript
func visit_dialog_stmt(stmt: ESCGrammarStmts.Dialog) -> void
```

Attempts to resolve a dialog's arguments and options.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Dialog`|Statement node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_literal\_expr

```gdscript
func visit_literal_expr(_expr: ESCGrammarExprs.Literal) -> void
```

Literals contain nothing to resolve, so are skipped over.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Literal`|Expression node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_call\_expr

```gdscript
func visit_call_expr(expr: ESCGrammarExprs.Call) -> void
```

Attempts to resolve a function/method call expression, including its name and arguments.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Call`|Expression node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_assign\_expr

```gdscript
func visit_assign_expr(expr: ESCGrammarExprs.Assign) -> void
```

Attempts to resolve an assignment expression.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Assign`|Expression node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_in\_inventory\_expr

```gdscript
func visit_in_inventory_expr(expr: ESCGrammarExprs.InInventory) -> void
```

Attempts to resolve an `in` expression, specifically the item identifier.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.InInventory`|Expression node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_is\_expr

```gdscript
func visit_is_expr(expr: ESCGrammarExprs.Is) -> void
```

Attempts to resolve an `is` expression, including the item identifier and the state (if one is specified).

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Is`|Expression node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_binary\_expr

```gdscript
func visit_binary_expr(expr: ESCGrammarExprs.Binary) -> void
```

Attempts to resolve a binary expression.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Binary`|Expression node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_logical\_expr

```gdscript
func visit_logical_expr(expr: ESCGrammarExprs.Logical) -> void
```

Attempts to resolve a logical expression.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Logical`|Expression node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_get\_expr

```gdscript
func visit_get_expr(expr: ESCGrammarExprs.Get) -> void
```

Attempts to resolve a `get` expression (possibly not used at the moment).

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Get`|Expression node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_set\_expr

```gdscript
func visit_set_expr(expr: ESCGrammarExprs.Set) -> void
```

Attempts to resolve a `set` expression (possibly not used at the moment).

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Set`|Expression node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_grouping\_expr

```gdscript
func visit_grouping_expr(expr: ESCGrammarExprs.Grouping) -> void
```

Attempts to resolve a grouping expression.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Grouping`|Expression node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_unary\_expr

```gdscript
func visit_unary_expr(expr: ESCGrammarExprs.Unary) -> void
```

Attempts to resolve a unary expression.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Unary`|Expression node being resolved.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_variable\_expr

```gdscript
func visit_variable_expr(expr: ESCGrammarExprs.Variable) -> void
```

Attempts to resolve a local variable expression

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Variable`|Expression node being resolved.|yes|

#### Returns

Returns nothing.

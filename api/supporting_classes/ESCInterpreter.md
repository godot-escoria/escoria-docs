
  (ESCInterpreter)=
# ESCInterpreter

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

The actual interpreter that processes a parsed ASHES script.



## Constants

### CURRENT\_PLAYER\_KEYWORD
```gdscript
const CURRENT_PLAYER_KEYWORD = "CURRENT_PLAYER"

```
Used to represent the current player character in scripts.
### CURRENT\_OBJECT
```gdscript
const CURRENT_OBJECT = "THIS"

```

## Members

## Methods
    
% ...
---
### cleanup

```gdscript
func cleanup() -> void
```
    
% ...
---
### get\_global\_values

```gdscript
func get_global_values() -> Dictionary
```

The dictionary containing any and all global variables.

#### Parameters

None. 
#### Returns

Returns the dictionary containing any and all global variables. (`Dictionary`)
    
% ...
---
### reset

```gdscript
func reset() -> void
```

Resets the interpreter, specifically any locally-scoped variables.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### interrupt

```gdscript
func interrupt() -> void
```

Issues an interrupt to the currently-running event, if there is one.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### interpret

```gdscript
func interpret(statements: Variant) -> Variant
```

The main entry point for the interpreter. Takes one or more statements and begins to interpret them. These usually represent the statements at the top level of the script being processed.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|statements|`Variant`|a single `ESCGrammarStmt`-derived statement or an array of them, representing the statements to be interpreted|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_block\_stmt

```gdscript
func visit_block_stmt(stmt: ESCGrammarStmts.Block) -> Variant
```

Executes code relevant to interpreting a statement block.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Block`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_event\_stmt

```gdscript
func visit_event_stmt(stmt: ESCGrammarStmts.Event) -> void
```

Executes code relevant to interpreting an event in ASHES, e.g. `:look`. Emits the statement's `finished` signal upon completion, containing the return code.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Event`|the `ESCGrammarStmt` representing the ASHES event|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_expression\_stmt

```gdscript
func visit_expression_stmt(stmt: ESCGrammarStmts.ESCExpression) -> Variant
```

Executes code relevant to interpreting an expression contained in a statement.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.ESCExpression`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_call\_expr

```gdscript
func visit_call_expr(expr: ESCGrammarExprs.Call) -> Variant
```

Executes code relevant to interpreting a function/method call.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Call`|the expression representing the function/method call to make|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_if\_stmt

```gdscript
func visit_if_stmt(stmt: ESCGrammarStmts.If) -> Variant
```

Executes code relevant to interpreting an `if` statement.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.If`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_while\_stmt

```gdscript
func visit_while_stmt(stmt: ESCGrammarStmts.While) -> Variant
```

Executes code relevant to interpreting a `while` loop.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.While`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_pass\_stmt

```gdscript
func visit_pass_stmt(stmt: ESCGrammarStmts.Pass) -> void
```

Executes code relevant to interpreting a `pass` statement.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Pass`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_stop\_stmt

```gdscript
func visit_stop_stmt(stmt: ESCGrammarStmts.Stop) -> Variant
```

Executes code relevant to interpreting a `stop` statement. Relevant only to dialogs.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Stop`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_var\_stmt

```gdscript
func visit_var_stmt(stmt: ESCGrammarStmts.Var) -> Variant
```

Executes code relevant to interpreting a variable declaration and possible initialization.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Var`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_global\_stmt

```gdscript
func visit_global_stmt(stmt: ESCGrammarStmts.Global) -> Variant
```

Executes code relevant to interpreting a global variable declaration and possible initialization.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Global`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_dialog\_stmt

```gdscript
func visit_dialog_stmt(stmt: ESCGrammarStmts.Dialog) -> Variant
```

Executes code relevant to interpreting a block of dialog.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Dialog`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_dialog\_option\_stmt

```gdscript
func visit_dialog_option_stmt(stmt: ESCGrammarStmts.DialogOption) -> void
```

Executes code relevant to interpreting a dialog option, although this is more of a placeholder to keep the processing of the syntax tree going since dialog options are handled by the overall dialog block.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.DialogOption`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_break\_stmt

```gdscript
func visit_break_stmt(stmt: ESCGrammarStmts.Break) -> Variant
```

Executes code relevant to interpreting a `break` statement.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Break`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_done\_stmt

```gdscript
func visit_done_stmt(stmt: ESCGrammarStmts.Done) -> Variant
```

Executes code relevant to interpreting a `done` statement. Only relevant when processing dialogs.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|stmt|`ESCGrammarStmts.Done`|Statement node to interpret.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_assign\_expr

```gdscript
func visit_assign_expr(expr: ESCGrammarExprs.Assign) -> Variant
```

Executes code relevant to interpreting an expression that assigns a value to a variable. Enforces traditional scoping rules.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Assign`|Expression node to evaluate.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_in\_inventory\_expr

```gdscript
func visit_in_inventory_expr(expr: ESCGrammarExprs.InInventory) -> Variant
```

Executes code relevant to interpreting an `in` statement when checking whether an item in Escoria is in the player's inventory.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.InInventory`|Expression node to evaluate.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_is\_expr

```gdscript
func visit_is_expr(expr: ESCGrammarExprs.Is) -> Variant
```

Executes code relevant to interpreting an `is` statement when checking whether an item in Escoria has a particular state and/or is active.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Is`|Expression node to evaluate.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_binary\_expr

```gdscript
func visit_binary_expr(expr: ESCGrammarExprs.Binary) -> Variant
```

Executes code relevant to interpreting binary expressions, e.g. `==`, `!=`, etc.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Binary`|Expression node to evaluate.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_unary\_expr

```gdscript
func visit_unary_expr(expr: ESCGrammarExprs.Unary) -> Variant
```

Executes code relevant to interpreting unary expressions, e.g. `!`, `-`.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Unary`|Expression node to evaluate.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_variable\_expr

```gdscript
func visit_variable_expr(expr: ESCGrammarExprs.Variable) -> Variant
```

Executes code relevant to interpreting variable expressions. Worth noting is that variables prefixed with a `$` are treated as global IDs, e.g. `$npc_character` is interperted as the global ID `npc_character`.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Variable`|Expression node to evaluate.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_literal\_expr

```gdscript
func visit_literal_expr(expr: ESCGrammarExprs.Literal) -> Variant
```

Executes code relevant to interpreting literal expressions, e.g. `"some string", `1234`, etc.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Literal`|Expression node to evaluate.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_logical\_expr

```gdscript
func visit_logical_expr(expr: ESCGrammarExprs.Logical) -> Variant
```

Executes code relevant to interpreting logical expressions, e.g. `AND`, `OR`, etc.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Logical`|Expression node to evaluate.|yes|

#### Returns

Returns nothing.
    
% ...
---
### visit\_grouping\_expr

```gdscript
func visit_grouping_expr(expr: ESCGrammarExprs.Grouping) -> Variant
```

Executes code relevant to interpreting grouped expressions, e.g. those surrounded by parentheses.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExprs.Grouping`|Expression node to evaluate.|yes|

#### Returns

Returns nothing.
    
% ...
---
### resolve

```gdscript
func resolve(expr: ESCGrammarExpr, depth: int) -> void
```

Performs resolution of the specified expression by specifying its scope depth.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|expr|`ESCGrammarExpr`|the expression requiring access to locally scoped variables|yes|
|depth|`int`|the scope depth of the local variables to be used by the expression|yes|

#### Returns

Returns nothing.
    
% ...
---
### look\_up\_variable

```gdscript
func look_up_variable(name: ESCToken, expr: ESCGrammarExpr) -> Variant
```

Fetches the value of the variable specified by `name` provided it exists within the applicable scope for the expression `expr`.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`ESCToken`|Token representing the variable name to resolve.|yes|
|expr|`ESCGrammarExpr`|the expression containing the variable identified by `name`|yes|

#### Returns

Returns the value stored for the resolved variable. (`Variant`)
    
% ...
---
### look\_up\_global

```gdscript
func look_up_global(name: ESCToken) -> Variant
```

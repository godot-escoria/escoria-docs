
  (ESCScriptAnalyzer)=
# ESCScriptAnalyzer

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description





## Constants

### CURRENT\_PLAYER\_KEYWORD
```gdscript
const CURRENT_PLAYER_KEYWORD = "CURRENT_PLAYER"

```

## Members

## Methods
    
% ...
---
### analyze

```gdscript
func analyze(statements: Array) -> void
```
    
% ...
---
### print\_messages

```gdscript
func print_messages() -> void
```
    
% ...
---
### visit\_block\_stmt

```gdscript
func visit_block_stmt(stmt: ESCGrammarStmts.Block) -> Variant
```
    
% ...
---
### visit\_event\_stmt

```gdscript
func visit_event_stmt(stmt: ESCGrammarStmts.Event) -> void
```
    
% ...
---
### visit\_expression\_stmt

```gdscript
func visit_expression_stmt(stmt: ESCGrammarStmts.ESCExpression) -> Variant
```
    
% ...
---
### visit\_call\_expr

```gdscript
func visit_call_expr(expr: ESCGrammarExprs.Call) -> Variant
```
    
% ...
---
### visit\_if\_stmt

```gdscript
func visit_if_stmt(stmt: ESCGrammarStmts.If) -> Variant
```
    
% ...
---
### visit\_while\_stmt

```gdscript
func visit_while_stmt(stmt: ESCGrammarStmts.While) -> Variant
```
    
% ...
---
### visit\_pass\_stmt

```gdscript
func visit_pass_stmt(stmt: ESCGrammarStmts.Pass) -> void
```
    
% ...
---
### visit\_stop\_stmt

```gdscript
func visit_stop_stmt(stmt: ESCGrammarStmts.Stop) -> Variant
```
    
% ...
---
### visit\_var\_stmt

```gdscript
func visit_var_stmt(stmt: ESCGrammarStmts.Var) -> Variant
```
    
% ...
---
### visit\_global\_stmt

```gdscript
func visit_global_stmt(stmt: ESCGrammarStmts.Global) -> Variant
```
    
% ...
---
### visit\_dialog\_stmt

```gdscript
func visit_dialog_stmt(stmt: ESCGrammarStmts.Dialog) -> Variant
```
    
% ...
---
### visit\_dialog\_option\_stmt

```gdscript
func visit_dialog_option_stmt(stmt: ESCGrammarStmts.DialogOption) -> void
```
    
% ...
---
### visit\_break\_stmt

```gdscript
func visit_break_stmt(stmt: ESCGrammarStmts.Break) -> Variant
```
    
% ...
---
### visit\_done\_stmt

```gdscript
func visit_done_stmt(stmt: ESCGrammarStmts.Done) -> Variant
```
    
% ...
---
### visit\_assign\_expr

```gdscript
func visit_assign_expr(expr: ESCGrammarExprs.Assign) -> Variant
```
    
% ...
---
### visit\_in\_inventory\_expr

```gdscript
func visit_in_inventory_expr(expr: ESCGrammarExprs.InInventory) -> Variant
```
    
% ...
---
### visit\_is\_expr

```gdscript
func visit_is_expr(expr: ESCGrammarExprs.Is) -> Variant
```
    
% ...
---
### visit\_binary\_expr

```gdscript
func visit_binary_expr(expr: ESCGrammarExprs.Binary) -> Variant
```
    
% ...
---
### visit\_unary\_expr

```gdscript
func visit_unary_expr(expr: ESCGrammarExprs.Unary) -> Variant
```
    
% ...
---
### visit\_variable\_expr

```gdscript
func visit_variable_expr(expr: ESCGrammarExprs.Variable) -> Variant
```
    
% ...
---
### visit\_literal\_expr

```gdscript
func visit_literal_expr(expr: ESCGrammarExprs.Literal) -> Variant
```
    
% ...
---
### visit\_logical\_expr

```gdscript
func visit_logical_expr(expr: ESCGrammarExprs.Logical) -> Variant
```
    
% ...
---
### visit\_grouping\_expr

```gdscript
func visit_grouping_expr(expr: ESCGrammarExprs.Grouping) -> Variant
```
    
% ...
---
### resolve

```gdscript
func resolve(expr: ESCGrammarExpr, depth: int) -> void
```
    
% ...
---
### look\_up\_variable

```gdscript
func look_up_variable(name: ESCToken, expr: ESCGrammarExpr) -> Variant
```

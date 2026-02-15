
  (ESCGrammarStmts.DialogOption)=
# ESCGrammarStmts.DialogOption

**Extends:** {ref}`ESCGrammarStmt <ESCGrammarStmt>`
        
## Description

Represents an option contained within a dialog. Usually of the form:

```
- <expression> [condition]
<block>
```

...where:
- The result of `<expression>` is displayed in a dialog choice UI. The player will be able to select the displayed text as a dialog option.
- `[condition]` is optional and, if specified, is used to determine whether the dialog option is displayed.
- `<block>` is a block of statements to be executed and must be indented like a typical block.

E.g.
```
- "Why are you here?" [!option_already_visited]
say("current_player", "Why are you here?")
say("worker", "Because I work here.")
```



## Members

## Methods
    
% ...
---
### init

```gdscript
func init(option: ESCGrammarExpr, condition: ESCGrammarExpr, body: ESCGrammarStmt) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|option|`ESCGrammarExpr`|the expression whose results will be displayed on screen as an option to be selected alongside any other options at the current level|yes|
|condition|`ESCGrammarExpr`|an optional condition to be evaluated that is used to determine whether the option should be displayed at all|yes|
|body|`ESCGrammarStmt`|the block of statements to be executed should this dialog option be selected|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_option

```gdscript
func get_option() -> ESCGrammarExpr
```

The option expression.

#### Parameters

None. 
#### Returns

Returns the option expression. (`ESCGrammarExpr`)
    
% ...
---
### get\_condition

```gdscript
func get_condition() -> ESCGrammarExpr
```

The condition for this option, if one exists.

#### Parameters

None. 
#### Returns

Returns the condition for this option, if one exists. (`ESCGrammarExpr`)
    
% ...
---
### get\_body

```gdscript
func get_body() -> ESCGrammarStmt
```

The statements of the option to be executed should the option be selected.

#### Parameters

None. 
#### Returns

Returns the statements of the option to be executed should the option be selected. (`ESCGrammarStmt`)
    
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

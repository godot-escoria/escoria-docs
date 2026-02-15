
  (ESCGrammarStmts.Dialog)=
# ESCGrammarStmts.Dialog

**Extends:** {ref}`ESCGrammarStmt <ESCGrammarStmt>`
        
## Description

Represents a dialog between characters. Can be nested. Begin each block of dialog with `?!`. Can take up to three optional arguments (detailed in the `init` method).

(A block of dialog follows the same rules as a block of script statements, including the need to use appropriate indentation.)

E.g.
```
?!
- "This is the first dialog option!"
say("current_player", "This is the first dialog option!")
say("worker", "That's nice. Can you show me some other dialog options?")
?!
- "This is a nested dialog option, and appears on its own!"
say("current_player", "This is a nested dialog option, and appears on its own!"
```





## Members

## Methods
    
% ...
---
### init

```gdscript
func init(args: Array, options: Array) -> void
```

Initialization method. Must be called after instantiation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|args|`Array`|the arguments pertaining to this dialog; the array is typically ordered: Path to avatar to be used for this dialog, Timeout (in seconds) until the default option is automatically selected, Timeout option to be selected once the timeout is reached.|yes|
|options|`Array`|the dialog options available to this dialog|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_options

```gdscript
func get_options() -> Array
```

The options available to this dialog.

#### Parameters

None. 
#### Returns

Returns the options available to this dialog. (`Array`)
    
% ...
---
### get\_args

```gdscript
func get_args() -> Array
```

The arguments for this dialog as described in the `init` method.

#### Parameters

None. 
#### Returns

Returns the arguments for this dialog as described in the `init` method. (`Array`)
    
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

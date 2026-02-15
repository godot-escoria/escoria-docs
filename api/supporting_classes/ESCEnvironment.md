
  (ESCEnvironment)=
# ESCEnvironment

**Extends:** {ref}`Object <Object>`
        
## Description

Class to track variables and their associated scopes within a script.

Scoping is implemented using this class, including traditional scoping rules. Scope binding and resolution are handled in this class.

## Members

## Methods
    
% ...
---
### init

```gdscript
func init(enclosing: Variant) -> void
```

Initializes the scope and sets the scope which encloses this one.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|enclosing|`Variant`|Optional parent environment used to resolve lookups outside this scope.|yes|

#### Returns

Returns nothing.
    
% ...
---
### cleanup

```gdscript
func cleanup() -> void
```
    
% ...
---
### is\_valid\_key

```gdscript
func is_valid_key(name: ESCToken) -> Variant
```

Determines whether the specified key (i.e. the script variable's name) is valid either within this scope or an enclosing scope.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`ESCToken`|Token describing the variable name to look up.|yes|

#### Returns

Returns `true` if the variable exists in this scope or an enclosing scope, otherwise `false`. (`bool`)
    
% ...
---
### get\_value

```gdscript
func get_value(name: ESCToken) -> Variant
```

Fetches the value of the specified key (i.e. the script variable) from this scope or an enclosing one. otherwise, an error is produced

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`ESCToken`|Token describing the variable name whose value is requested.|yes|

#### Returns

Returns the value associated with the variable name, or produces an error if undefined. (`Variant`)
    
% ...
---
### assign

```gdscript
func assign(name: ESCToken, value: Variant) -> Variant
```

Assigns a value to the specified key (i.e. the script variable) from this scope or an enclosing one.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`ESCToken`|Token describing the variable name to assign.|yes|
|value|`Variant`|the value to be assigned to the script variable|yes|

#### Returns

Returns nothing on success, or produces an error if the variable is undefined in all scopes.
    
% ...
---
### define

```gdscript
func define(name: String, value: Variant) -> void
```

Defines a script variable in this scope and assigns it a value.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Variable name to register in this scope.|yes|
|value|`Variant`|the value to be assigned to the script variable|yes|

#### Returns

Returns nothing.
    
% ...
---
### ancestor

```gdscript
func ancestor(distance: int) -> Variant
```

Fetches the scope (environment) that is `distance` levels up the enclosing scope chain.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|distance|`int`|The number of levels up the scope chain to traverse. `distance == 0` returns this scope (self); `distance == 1` returns the immediate enclosing scope; `distance == 2` returns the enclosing scope's enclosing scope, etc.|yes|

#### Returns

Returns the environment (scope) at the specified distance up the enclosing scope chain. (`ESCEnvironment`)
    
% ...
---
### get\_at

```gdscript
func get_at(distance: int, name: String) -> Variant
```

Gets the value of the script variable (if it exists) that is at most `distance` levels above this one.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|distance|`int`|The number of scope levels to traverse; e.g. `distance == 0` is this scope, `distance == 1` is the enclosing scope, `distance == 2` is the enclosing scope's enclosing scope, etc.|yes|
|name|`String`|Variable name to resolve at the requested scope depth.|yes|

#### Returns

Returns the value of the variable at the specified scope distance. (`Variant`)
    
% ...
---
### assign\_at

```gdscript
func assign_at(distance: int, name: ESCToken, value: Variant) -> void
```

Assigns the specified value to the script variable (if it exists) that is at most `distance` levels above this one.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|distance|`int`|the number of scope levels to traverse; e.g. `distance == 0` is this scope, `distance == 1` is the enclosing scope, `distance == 2` is the enclosing scope's enclosing scope, etc.|yes|
|name|`ESCToken`|Token describing the variable name to modify at the requested scope depth.|yes|
|value|`Variant`|the value to assign to the script variable|yes|

#### Returns

Returns nothing. (`void`)
    
% ...
---
### get\_enclosing

```gdscript
func get_enclosing() -> Variant
```

The enclosing scope (environment) for this scope.

#### Parameters

None. 
#### Returns

Returns the enclosing scope (environment) for this scope. (`Variant`)
    
% ...
---
### get\_values

```gdscript
func get_values() -> Variant
```

The dictionary storing all script variables and their associated values located at this scope's level.

#### Parameters

None. 
#### Returns

Returns the dictionary storing all script variables and their associated values located at this scope's level. (`Dictionary`)

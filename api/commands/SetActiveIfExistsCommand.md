
  (SetActiveIfExistsCommand)=
# SetActiveIfExistsCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

*** FOR INTERNAL USE ONLY *** `set_active_if_exists(object: String, active: Boolean)`

Changes the "active" state of the object in the current room if it currently exists in the object manager. If it doesn't, then, unlike set_active, we don't fail and we just carry on. Inactive objects are invisible in the room.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`String`|Global ID of the object whose active state should change if it is registered.|yes|
|active|`Boolean`|Whether the object should be marked as active (`true`) or inactive (`false`).|yes|

 

## Methods
    
% ...
---
### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

The descriptor of the arguments of this command.

#### Parameters

None. 
#### Returns

Returns the descriptor of the arguments of this command. The argument descriptor for this command. (`ESCCommandArgumentDescriptor`)
    
% ...
---
### run

```gdscript
func run(command_params: Array) -> int
```

Runs the command.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command_params|`Array`|The parameters for the command.|yes|

#### Returns

Returns the execution result code. (`int`)
    
% ...
---
### interrupt

```gdscript
func interrupt() -> void
```

Function called when the command is interrupted.

#### Parameters

None. 
#### Returns

Returns nothing.

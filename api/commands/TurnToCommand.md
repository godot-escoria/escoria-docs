
  (TurnToCommand)=
# TurnToCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`turn_to(object: String, object_to_face: String[, wait: Number])`

Turns `object` to face another object. Unlike movement commands, `turn_to` will not automatically reference an `ESCLocation` that is a child of an `ESCItem.` To turn towards an `ESCLocation` that is a child of an `ESCItem`, give the `ESCLocation` a `Global ID` and use this value as the `object_to_face` parameter. While turning, the number of directions the item faces will depend on the number of `directions` defined for the object. A 16 direction character for example will display 8 directions of animation while turning to face an object that is 180 degrees away, a 4 direction character would only face 2 directions to make the same turn. As the idle animation will be played for `wait` seconds for each direction the object faces, a 16 direction character would take 8 seconds to rotate 180 degrees with a 1 second `wait` time, whereas a 4 direction character would only take 2 seconds to make the same rotation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`String`|Global ID of the object to be turned|yes|
|object_to_face|`String`|Global ID of the object to turn towards|yes|
|wait|`Number`|Length of time to wait in seconds for each intermediate angle. If set to 0, the turnaround is immediate (default: `0`)|no|

 

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
### validate

```gdscript
func validate(arguments: Array) -> Variant
```

Validates whether the given arguments match the command descriptor.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|arguments|`Array`|The arguments to validate.|yes|

#### Returns

Returns True if the arguments are valid, false otherwise. (`bool`)
    
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

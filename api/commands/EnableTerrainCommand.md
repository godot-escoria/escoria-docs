
  (EnableTerrainCommand)=
# EnableTerrainCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`enable_terrain(node_name: String)`

Enables the `ESCTerrain`'s `NavigationPolygonInstance` specified by the given node name. It will also disable the previously-activated `NavigationPolygonInstance`. Use this to change where the player can walk, allowing them to walk into the next room once a door has been opened, for example.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|node_name|`String`|Name of the `NavigationPolygonInstance` node to activate|yes|

 

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

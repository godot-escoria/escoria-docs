<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# EnableTerrainCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`enable_terrain node_name`

Enables the `ESCTerrain`'s `NavigationPolygonInstance` specified by the given 
node name. Disables the previously-activated `NavigationPolygonInstance`.
Use this to change where the player can walk, allowing them to walk into the
next room once a door has been opened for example.

**Parameters**

- *node_name*: Name of the `NavigationPolygonInstance` node to activate

@ESC

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

### run

```gdscript
func run(command_params: Array) -> int
```

Run the command
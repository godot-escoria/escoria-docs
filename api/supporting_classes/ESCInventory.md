
  (ESCInventory)=
# ESCInventory

**Extends:** {ref}`Control <Control>`
        
## Description

Manages the inventory on the GUI connected to the inventory_ui_container variable.



## Members
    
### inventory\_ui\_container

```gdscript
var inventory_ui_container: NodePath
```

The actual container node to add items as children of. Should be a Container.
    
### items\_ids\_in\_inventory

```gdscript
var items_ids_in_inventory: Dictionary
```

A registry of inventory ESCInventoryItem nodes.

## Methods
    
% ...
---
### add\_new\_item\_by\_id

```gdscript
func add_new_item_by_id(item_id: String) -> void
```

Add item to Inventory UI using its id set in its scene.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item_id|`String`|The id of the item to add|yes|

#### Returns

Returns nothing.
    
% ...
---
### remove\_item\_by\_id

```gdscript
func remove_item_by_id(item_id: String) -> void
```

Remove item from Inventory UI using its id set in its scene.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item_id|`String`|The id of the item to remove|yes|

#### Returns

Returns nothing.
    
% ...
---
### clear

```gdscript
func clear() -> void
```

Clear the inventory UI of all its items.

#### Parameters

None. 
#### Returns

Returns nothing.

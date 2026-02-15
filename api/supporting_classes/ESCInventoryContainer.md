
  (ESCInventoryContainer)=
# ESCInventoryContainer

**Extends:** {ref}`Control <Control>`
        
## Description

Inventory container handler that acts as a base for UIs inventory containers.



## Members
    
### item\_focused

```gdscript
var item_focused: bool
```

Whether any item in the container is currently focused.


## Methods
    
% ...
---
### is\_empty

```gdscript
func is_empty() -> bool
```

Whether the inventory container currently is empty.

#### Parameters

None. 
#### Returns

Returns whether the inventory container currently is empty. Whether the container is empty or not. (`bool`)
    
% ...
---
### add\_item

```gdscript
func add_item(inventory_item: ESCInventoryItem) -> ESCInventoryButton
```

Adds a new item into the container and returns the control generated for it so its events can be handled by the inputs manager.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|inventory_item|`ESCInventoryItem`|Item to add.|yes|

#### Returns

Returns the button generated for the item. (`ESCInventoryButton`)
    
% ...
---
### remove\_item

```gdscript
func remove_item(inventory_item: ESCInventoryItem) -> void
```

Removes an item from the container.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|inventory_item|`ESCInventoryItem`|Item to remove.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_inventory\_button

```gdscript
func get_inventory_button(inventory_item: ESCInventoryItem) -> ESCInventoryButton
```

An Inventory button from the container, using an ESCInventoryItem.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|inventory_item|`ESCInventoryItem`|Inventory item to return the button node from.|yes|

#### Returns

Returns an Inventory button from the container, using an ESCInventoryItem. The inventory button node, or null if not found. (`ESCInventoryButton`)


  (ESCInventoryManager)=
# ESCInventoryManager

**Extends:** {ref}`Resource <Resource>`
        
## Description

A manager for inventory objects. 



## Methods
    
% ...
---
### inventory\_has

```gdscript
func inventory_has(item: String) -> bool
```

Checks whether the player has an inventory item.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`String`|The inventory item's id.|yes|

#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### items\_in\_inventory

```gdscript
func items_in_inventory() -> Array
```

Retrieves all inventory items.

#### Parameters

None. 
#### Returns

Returns a `Array` value. (`Array`)
    
% ...
---
### remove\_item

```gdscript
func remove_item(item: String) -> void
```

Removes an item from the player's inventory.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`String`|The inventory item's id.|yes|

#### Returns

Returns nothing.
    
% ...
---
### add\_item

```gdscript
func add_item(item: String) -> void
```

Adds an item to the player's inventory.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`String`|The inventory item's id.|yes|

#### Returns

Returns nothing.
    
% ...
---
### save\_game

```gdscript
func save_game(p_savegame: ESCSaveGame) -> void
```

Saves the inventory in the specified savegame.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_savegame|`ESCSaveGame`|ESCSaveGame resource that holds all save data.|yes|

#### Returns

Returns nothing.

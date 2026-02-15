
  (ESCInventoryButton)=
# ESCInventoryButton

**Extends:** {ref}`TextureButton <TextureButton>`
        
## Description

The inventory representation of an ESC item if pickable (only used by the inventory components)



## Members
    
### global\_id

```gdscript
var global_id: String
```

Global ID of the ESCItem that uses this ESCInventoryItem.

## Signals

### mouse\_left\_inventory\_item

```gdscript
signal mouse_left_inventory_item(item_id: Variant)
```

Signal emitted when the item was left clicked.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item_id|`Variant`|Global ID of the clicked item|yes|



### mouse\_right\_inventory\_item

```gdscript
signal mouse_right_inventory_item(item_id: Variant)
```

Signal emitted when the item was right clicked.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item_id|`Variant`|Global ID of the clicked item|yes|



### mouse\_double\_left\_inventory\_item

```gdscript
signal mouse_double_left_inventory_item(item_id: Variant)
```

Signal emitted when the item was double clicked.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item_id|`Variant`|Global ID of the clicked item|yes|



### inventory\_item\_focused

```gdscript
signal inventory_item_focused(item_id: Variant)
```

Signal emitted when the item was focused.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item_id|`Variant`|Global ID of the clicked item|yes|



### inventory\_item\_unfocused

```gdscript
signal inventory_item_unfocused()
```

Signal emitted when the item is not focused anymore.

#### Parameters

None. 


## Methods

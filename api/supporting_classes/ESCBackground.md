
  (ESCBackground)=
# ESCBackground

**Extends:** {ref}`TextureRect <TextureRect>`
        
## Description

ESCBackground's purpose is to display a background image and receive input events on the background. More precisely, the TextureRect under ESCBackground does not receive events itself - if it did, it would also eat all events like hotspot focusing and such. Instead, we set the TextureRect mouse filter to MOUSE_FILTER_IGNORE, and we use an Area2D node to receive the input events.

If ESCBackground doesn't contain a texture, it is important that its rect_size is set over the whole scene, because its rect_size is then used to create the Area2D node under it. If the rect_size is wrongly set, the background may receive no input.



## Members
    
### esc\_script

```gdscript
var esc_script: String
```

The ESC/ASH script connected to this background

## Signals

### double\_left\_click\_on\_bg

```gdscript
signal double_left_click_on_bg(position: Variant)
```

The background was double clicked

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|position|`Variant`|The position where the player clicked|yes|



### left\_click\_on\_bg

```gdscript
signal left_click_on_bg(position: Variant)
```

The background was left clicked

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|position|`Variant`|The position where the player clicked|yes|



### right\_click\_on\_bg

```gdscript
signal right_click_on_bg(position: Variant)
```

The background was right clicked

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|position|`Variant`|The position where the player clicked|yes|



### mouse\_wheel\_up

```gdscript
signal mouse_wheel_up()
```

Emitted when the mouse wheel was turned up

#### Parameters

None. 


### mouse\_wheel\_down

```gdscript
signal mouse_wheel_down()
```

Emitted when the mouse wheel was turned down

#### Parameters

None. 


### hovered\_bg

```gdscript
signal hovered_bg()
```

Emitted when the background is hovered.

#### Parameters

None. 


## Methods
    
% ...
---
### get\_full\_area\_rect2

```gdscript
func get_full_area_rect2() -> Rect2
```

Calculate the actual area taken by this background depending on its Texture or set size

#### Parameters

None. 
#### Returns

Returns a `Rect2` value. (`Rect2`)

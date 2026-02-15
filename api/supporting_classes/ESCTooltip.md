
  (ESCTooltip)=
# ESCTooltip

**Extends:** {ref}`RichTextLabel <RichTextLabel>`
        
## Description

Dynamically controlled tooltip



## Constants

### MAX\_WIDTH
```gdscript
const MAX_WIDTH = 200

```
Maximum width of the label
### MIN\_HEIGHT
```gdscript
const MIN_HEIGHT = 30

```
 Minimum height of the label
### MAX\_HEIGHT
```gdscript
const MAX_HEIGHT = 500

```
Maximum height of the label
### ONE\_LINE\_HEIGHT
```gdscript
const ONE_LINE_HEIGHT = 16

```
Height of one line in the label
## Members
    
### color

```gdscript
var color: Color
```

Color of the label
    
### offset\_from\_cursor

```gdscript
var offset_from_cursor: Vector2
```

Vector2 defining the offset from the cursor
    
### debug\_mode

```gdscript
var debug_mode: bool
```

Activates debug mode. If enabled, shows the label with a white background.
    
### current\_action

```gdscript
var current_action: String
```

Infinitive verb
    
### current\_target

```gdscript
var current_target: String
```

Target item/hotspot
    
### current\_prep

```gdscript
var current_prep: String
```

Preposition: on, with...
    
### current\_target2

```gdscript
var current_target2: String
```

Target 2 item/hotspot
    
### waiting\_for\_target2

```gdscript
var waiting_for_target2: Variant
```

True if tooltip is waiting for a click on second target (use x with y)
    
### debug\_texturerect\_node

```gdscript
var debug_texturerect_node: TextureRect
```

Node containing the debug white background

## Methods
    
% ...
---
### set\_color

```gdscript
func set_color(p_color: Color) -> void
```

Set the color of the label

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_color|`Color`|the color to set the label|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_debug\_mode

```gdscript
func set_debug_mode(p_debug_mode: bool) -> void
```

Enable/disable debug mode of the label. If enabled, the label is displayed with a white background.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_debug_mode|`bool`|if true, enable debug mode. False to disable|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_target

```gdscript
func set_target(target: String, needs_second_target: bool) -> void
```

Set the first target of the label. #### Parameters

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|target|`String`|String the target to add to the label|yes|
|needs_second_target|`bool`|if true, the label will prepare for a second target|no|

#### Returns

Returns nothing.
    
% ...
---
### set\_target2

```gdscript
func set_target2(target2: String) -> void
```

Set the second target of the label #### Parameters

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|target2|`String`|String the second target to add to the label|yes|

#### Returns

Returns nothing.
    
% ...
---
### update\_tooltip\_text

```gdscript
func update_tooltip_text() -> void
```

Update the tooltip text.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### update\_size

```gdscript
func update_size() -> void
```

Update the tooltip size according to the text.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### tooltip\_distance\_to\_edge\_top

```gdscript
func tooltip_distance_to_edge_top(position: Vector2) -> Variant
```

Return the tooltip distance to top edge. #### Parameters

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|position|`Vector2`|the position to test|yes|

#### Returns

Returns nothing.
    
% ...
---
### tooltip\_distance\_to\_edge\_bottom

```gdscript
func tooltip_distance_to_edge_bottom(position: Vector2) -> Variant
```

Return the tooltip distance to bottom edge. #### Parameters

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|position|`Vector2`|the position to test|yes|

#### Returns

Returns nothing.
    
% ...
---
### tooltip\_distance\_to\_edge\_left

```gdscript
func tooltip_distance_to_edge_left(position: Vector2) -> Variant
```

Return the tooltip distance to left edge. #### Parameters

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|position|`Vector2`|the position to test|yes|

#### Returns

Returns nothing.
    
% ...
---
### tooltip\_distance\_to\_edge\_right

```gdscript
func tooltip_distance_to_edge_right(position: Vector2) -> Variant
```

Return the tooltip distance to right edge. #### Parameters

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|position|`Vector2`|the position to test Return* The distance to the edge.|yes|

#### Returns

Returns nothing.
    
% ...
---
### clear

```gdscript
func clear() -> void
```

Clear the tooltip targets texts

#### Parameters

None. 
#### Returns

Returns nothing.

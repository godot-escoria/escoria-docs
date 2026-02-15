
  (ESCDependencyInjector)=
# ESCDependencyInjector

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Escoria dependency injector.

Holds factory methods for replacing non-singleton Escoria core classes.
If you wish to replace any Escoria core classes with your own derived classes,
follow these steps:
1. Create a class in your project that extends `ESCDependencyInjector`:
`extends ESCDependencyInjector`
2. Override the methods that create the classes that you want to replace.
3. In your game initialization, replace the `escoria.di` instance variable
with your new dependency injector: `escoria.di = MyDependencyInjector.new()`

For more details see: https://docs.godotengine.org/en/stable/tutorials/best_practices/scene_organization.html



## Methods
    
% ...
---
### esc\_inventory\_item

```gdscript
func esc_inventory_item(p_item: ESCItem) -> Variant
```

Factory method for creating an ESCInventoryItem from an ESCItem.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_item|`ESCItem`|The ESCItem to wrap in an ESCInventoryItem|yes|

#### Returns

Returns nothing.

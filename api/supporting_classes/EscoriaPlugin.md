
  (EscoriaPlugin)=
# EscoriaPlugin

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Base class for Escoria plugins.



## Methods
    
% ...
---
### register\_ui

```gdscript
func register_ui(plugin: EditorPlugin, game_scene: String) -> bool
```

Register a user interface. This should be called in a deferred way from the addon's _enter_tree.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|plugin|`EditorPlugin`|the plugin that registers|yes|
|game_scene|`String`|Path to the game scene extending ESCGame|yes|

#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### deregister\_ui

```gdscript
func deregister_ui(game_scene: String) -> void
```

Deregister a user interface.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|game_scene|`String`|Path to the game scene extending ESCGame|yes|

#### Returns

Returns nothing.
    
% ...
---
### register\_dialog\_manager

```gdscript
func register_dialog_manager(plugin: EditorPlugin, manager_class: String) -> bool
```

Register a dialog manager addon. This should be called in a deferred way from the addon's _enter_tree.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|plugin|`EditorPlugin`|the plugin that registers|yes|
|manager_class|`String`|Path to the manager class script|yes|

#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### deregister\_dialog\_manager

```gdscript
func deregister_dialog_manager(manager_class: String) -> void
```

Deregister a dialog manager addon.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|manager_class|`String`|Path to the manager class script|yes|

#### Returns

Returns nothing.

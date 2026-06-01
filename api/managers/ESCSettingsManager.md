
  (ESCSettingsManager)=
# ESCSettingsManager

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Escoria settings manager. 



## Constants

### SETTINGS\_TEMPLATE
```gdscript
const SETTINGS_TEMPLATE = "settings.tres"

```
Template for settings filename.
## Members
    
### settings\_folder

```gdscript
var settings_folder: String
```

Variable containing the settings folder obtained from Project Settings.
    
### custom\_settings

```gdscript
var custom_settings: Dictionary
```

Dictionary containing specific settings that gamedev wants to save in settings. This variable is access-free. Getting its content is gamedev's duty. It is saved with other Escoria settings data when save_settings() is called.

## Methods
    
% ...
---
### apply\_settings

```gdscript
func apply_settings() -> void
```

Apply the loaded settings.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### save\_settings\_resource\_to\_project\_settings

```gdscript
func save_settings_resource_to_project_settings(settings: ESCSaveSettings) -> void
```

Save the settings resource to project settings.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|settings|`ESCSaveSettings`|ESCSaveSettings resource to save.|yes|

#### Returns

Returns nothing.
    
% ...
---
### load\_settings

```gdscript
func load_settings() -> void
```

Load the game settings from the settings file.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### get\_settings

```gdscript
func get_settings() -> ESCSaveSettings
```

Load the game settings from the settings file.

#### Parameters

None. 
#### Returns

Returns a `ESCSaveSettings` value. (`ESCSaveSettings`)
    
% ...
---
### load\_settings\_from\_dict

```gdscript
func load_settings_from_dict(settings_dict: Dictionary) -> void
```

Load the game settings from a dictionary.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|settings_dict|`Dictionary`|Dictionary containing the settings to load.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_settings\_dict

```gdscript
func get_settings_dict() -> Dictionary
```

Get the game settings as a dictionary.

#### Parameters

None. 
#### Returns

Returns a `Dictionary` value. (`Dictionary`)
    
% ...
---
### save\_settings

```gdscript
func save_settings() -> void
```

Save the game settings in the settings file.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### get\_custom\_setting

```gdscript
func get_custom_setting(key: String, default_value: Variant) -> Variant
```

Returns a custom setting by key or an optional default value. Returns null if not found and no default value is defined.

<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCSettingsManager

## Constants Descriptions

### SETTINGS\_TEMPLATE

```gdscript
const SETTINGS_TEMPLATE: String = "settings.tres"
```

Template for settings filename

## Property Descriptions

### settings\_folder

```gdscript
var settings_folder: String
```

Variable containing the settings folder obtained from Project Settings

### custom\_settings

```gdscript
var custom_settings: Dictionary
```

Dictionary containing specific settings that gamedev wants to save in settings
This variable is access-free. Getting its content is gamedev's duty.
It is saved with other Escoria settings data when save_settings() is called.

## Method Descriptions

### apply\_settings

```gdscript
func apply_settings() -> void
```

Apply the loaded settings

### save\_settings\_resource\_to\_project\_settings

```gdscript
func save_settings_resource_to_project_settings(settings: ESCSaveSettings)
```

### load\_settings

```gdscript
func load_settings()
```

Load the game settings from the settings file

### get\_settings

```gdscript
func get_settings() -> ESCSaveSettings
```

### save\_settings

```gdscript
func save_settings()
```

Save the game settings in the settings file.
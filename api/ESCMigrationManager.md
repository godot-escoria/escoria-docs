<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCMigrationManager

**Extends:** [Object](../Object)

## Description

Class that handles migrations between different game or escoria versions

## Constants Descriptions

### VERSION\_REGEX

```gdscript
const VERSION_REGEX: String = "^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"
```

Regular expression that matches a simple semver version string

## Property Descriptions

### version\_regex

```gdscript
var version_regex: RegEx
```

Compiled regex

## Method Descriptions

### migrate

```gdscript
func migrate(savegame: ESCSaveGame, from: String, to: String, versions_directory: String) -> ESCSaveGame
```


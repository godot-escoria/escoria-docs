
  (ESCMigrationManager)=
# ESCMigrationManager

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Class that handles migrations between different game or escoria versions 



## Constants

### VERSION\_REGEX
```gdscript
const VERSION_REGEX = "^(?<major>\\d+)\\.(?<minor>\\d+)\\.(?<patch>\\d+)$"

```
Regular expression that matches a simple semver version string
## Members
    
### version\_regex

```gdscript
var version_regex: RegEx
```

Compiled regex

## Methods
    
% ...
---
### migrate

```gdscript
func migrate(savegame: ESCSaveGame, from: String, to: String, versions_directory: String) -> ESCSaveGame
```

Migrates the specified savegame from a specified version to another version based on a directory of migration scripts. The migration manager searches for scripts from after the given version up to the target version in this directory, loads them and applies the version. Each migration will return a modified version of the given savegame. The migrated savegame.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|savegame|`ESCSaveGame`|The `ESCSaveGame` object to migrate.|yes|
|from|`String`|The source version string (e.g., "1.0.0").|yes|
|to|`String`|The target version string (e.g., "1.1.0").|yes|
|versions_directory|`String`|Directory path containing version migration scripts.|yes|

#### Returns

Returns a `ESCSaveGame` value. (`ESCSaveGame`)

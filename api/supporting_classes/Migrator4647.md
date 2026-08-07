
  (Migrator4647)=
# Migrator4647

**Extends:** {ref}`Node <Node>`
        
## Description





## Constants

### UPGRADE\_4\_7
```gdscript
const UPGRADE_4_7 = 0 # enum "MigrationAction"

```

### DOWNGRADE\_4\_6
```gdscript
const DOWNGRADE_4_6 = 1 # enum "MigrationAction"

```

### DO\_NOTHING
```gdscript
const DO_NOTHING = 2 # enum "MigrationAction"

```

### MIGRATION\_DONE
```gdscript
const MIGRATION_DONE = "migration_done"

```

### GODOT\_4\_7\_HEX
```gdscript
const GODOT_4_7_HEX = 263936

```

## Methods
    
% ...
---
### check\_need\_upgrade\_or\_downgrade\_scripts

```gdscript
func check_need_upgrade_or_downgrade_scripts(engine_version: Dictionary) -> int
```
    
% ...
---
### prepare\_specific\_godot\_version

```gdscript
func prepare_specific_godot_version(target_hex: int) -> void
```
    
% ...
---
### save\_migration\_file

```gdscript
func save_migration_file(migration_done: bool) -> void
```
    
% ...
---
### read\_migration\_file

```gdscript
func read_migration_file() -> Dictionary
```

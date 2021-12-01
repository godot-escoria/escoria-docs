<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCMigration

**Extends:** [Object](../Object)

## Description

Base class for all migration version scripts. Extending scripts should be
named like the version they migrate the savegame to. (e.g. 1.0.0.gd, 1.0.1.gd)

## Method Descriptions

### set\_savegame

```gdscript
func set_savegame(savegame: ESCSaveGame)
```

Set the savegame

#### Parameters
- savegame: Savegame to modify

### get\_savegame

```gdscript
func get_savegame()
```

Get the savegame
**Returns** Savegame

### migrate

```gdscript
func migrate()
```

Override this function in the version script with
the things that need to be applied to the savegame

  (ESCMigration)=
# ESCMigration

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Base class for all migration version scripts. Extending scripts should be named like the version they migrate the savegame to. (e.g. 1.0.0.gd, 1.0.1.gd)



## Members

## Methods
    
% ...
---
### set\_savegame

```gdscript
func set_savegame(savegame: ESCSaveGame) -> void
```

Set the savegame

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|savegame|`ESCSaveGame`|Savegame to modify|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_savegame

```gdscript
func get_savegame() -> ESCSaveGame
```

Get the savegame.

#### Parameters

None. 
#### Returns

Returns a `ESCSaveGame` value. (`ESCSaveGame`)
    
% ...
---
### migrate

```gdscript
func migrate() -> void
```

Override this function in the version script with the things that need to be applied to the savegame

#### Parameters

None. 
#### Returns

Returns nothing.

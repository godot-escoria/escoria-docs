
  (ESCResourceCache)=
# ESCResourceCache

**Extends:** {ref}`Node <Node>`
        
## Description

A cache for resources



## Members
    
### queue

```gdscript
var queue: Array
```
    
### pending

```gdscript
var pending: Dictionary
```

## Signals

### resource\_loading\_progress

```gdscript
signal resource_loading_progress(path: Variant, progress: Variant)
```



### resource\_loading\_done

```gdscript
signal resource_loading_done(path: Variant)
```



### resource\_queue\_progress

```gdscript
signal resource_queue_progress(queue_size: Variant)
```



## Methods
    
% ...
---
### queue\_resource

```gdscript
func queue_resource(path: String, p_in_front: bool, p_permanent: bool) -> void
```
    
% ...
---
### cancel\_resource

```gdscript
func cancel_resource(path: Variant) -> void
```
    
% ...
---
### clear

```gdscript
func clear() -> void
```
    
% ...
---
### get\_progress

```gdscript
func get_progress(path: Variant) -> Variant
```
    
% ...
---
### is\_ready

```gdscript
func is_ready(path: Variant) -> Variant
```
    
% ...
---
### get\_resource

```gdscript
func get_resource(path: Variant) -> Variant
```
    
% ...
---
### print\_progress

```gdscript
func print_progress(p_path: Variant, p_progress: Variant) -> void
```
    
% ...
---
### res\_loaded

```gdscript
func res_loaded(p_path: Variant) -> void
```
    
% ...
---
### print\_queue\_progress

```gdscript
func print_queue_progress(p_queue_size: Variant) -> void
```

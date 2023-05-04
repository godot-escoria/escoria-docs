<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCResourceCache

**Extends:** [Node](../Node)

## Description

A cache for resources

## Property Descriptions

### queue

```gdscript
var queue: Array
```

### pending

```gdscript
var pending: Dictionary
```

## Method Descriptions

### queue\_resource

```gdscript
func queue_resource(path: String, p_in_front: bool = false, p_permanent: bool = false)
```

### cancel\_resource

```gdscript
func cancel_resource(path)
```

### clear

```gdscript
func clear()
```

### get\_progress

```gdscript
func get_progress(path)
```

### is\_ready

```gdscript
func is_ready(path)
```

### get\_resource

```gdscript
func get_resource(path)
```

### print\_progress

```gdscript
func print_progress(p_path, p_progress)
```

### res\_loaded

```gdscript
func res_loaded(p_path)
```

### print\_queue\_progress

```gdscript
func print_queue_progress(p_queue_size)
```

### start

```gdscript
func start()
```

## Signals

- signal resource_loading_progress(path, progress): 
- signal resource_loading_done(path): 
- signal resource_queue_progress(queue_size): 

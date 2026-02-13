
  (ESCUtils)=
# ESCUtils

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

A set of common utilities.



## Methods
    
% ...
---
### get\_deg\_from\_rad

```gdscript
func get_deg_from_rad(rad_angle: float) -> Variant
```

Convert radians to degrees.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|rad_angle|`float`|Angle in radians.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_re\_group

```gdscript
func get_re_group(re_match: RegExMatch, group: String) -> String
```

Get the content of a reg exp group by name.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|re_match|`RegExMatch`|The RegExMatch object.|yes|
|group|`String`|The name of the group.|yes|

#### Returns

Returns a `String` value. (`String`)
    
% ...
---
### get\_typed\_value

```gdscript
func get_typed_value(value: String, type_hint: Variant) -> Variant
```

Return a string value in the correct inferred type.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|value|`String`|The original value.|yes|
|type_hint|`Variant`|The type it should be.|no|

#### Returns

Returns nothing.
    
% ...
---
### sanitize\_whitespace

```gdscript
func sanitize_whitespace(value: String) -> String
```

Sanitize use of whitespaces in a string. Removes double whitespaces and converts tabs into space.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|value|`String`|String to work on.|yes|

#### Returns

Returns a `String` value. (`String`)

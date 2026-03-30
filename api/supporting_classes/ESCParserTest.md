
  (ESCParserTest)=
# ESCParserTest

**Extends:** {ref}`GdUnitTestSuite <GdUnitTestSuite>`
        
## Description





## Methods
    
% ...
---
### test\_done\_statement\_does\_not\_consume\_tokens\_on\_partial\_match

```gdscript
func test_done_statement_does_not_consume_tokens_on_partial_match() -> void
```
    
% ...
---
### test\_parser\_synchronizes\_after\_invalid\_done\_and\_keeps\_following\_event

```gdscript
func test_parser_synchronizes_after_invalid_done_and_keeps_following_event() -> void
```
    
% ...
---
### test\_parser\_synchronizes\_after\_invalid\_if\_and\_keeps\_following\_event

```gdscript
func test_parser_synchronizes_after_invalid_if_and_keeps_following_event() -> void
```
    
% ...
---
### test\_dialog\_option\_missing\_right\_square\_returns\_parse\_error

```gdscript
func test_dialog_option_missing_right_square_returns_parse_error() -> void
```
    
% ...
---
### test\_dialog\_option\_missing\_indented\_body\_returns\_parse\_error

```gdscript
func test_dialog_option_missing_indented_body_returns_parse_error() -> void
```
    
% ...
---
### test\_grouping\_missing\_right\_paren\_returns\_parse\_error

```gdscript
func test_grouping_missing_right_paren_returns_parse_error() -> void
```
    
% ...
---
### test\_var\_grouping\_missing\_right\_paren\_returns\_parse\_error

```gdscript
func test_var_grouping_missing_right_paren_returns_parse_error() -> void
```
    
% ...
---
### test\_var\_declaration\_missing\_newline\_returns\_parse\_error

```gdscript
func test_var_declaration_missing_newline_returns_parse_error() -> void
```
    
% ...
---
### test\_global\_declaration\_missing\_newline\_returns\_parse\_error

```gdscript
func test_global_declaration_missing_newline_returns_parse_error() -> void
```
    
% ...
---
### test\_while\_error\_does\_not\_leak\_loop\_level\_into\_later\_event

```gdscript
func test_while_error_does_not_leak_loop_level_into_later_event() -> void
```
    
% ...
---
### test\_dialog\_error\_does\_not\_leak\_dialog\_level\_into\_later\_event

```gdscript
func test_dialog_error_does_not_leak_dialog_level_into_later_event() -> void
```
    
% ...
---
### test\_happy\_path\_full\_language\_fixture\_parses\_without\_errors

```gdscript
func test_happy_path_full_language_fixture_parses_without_errors() -> void
```
    
% ...
---
### test\_keyword\_prefixed\_names\_scan\_as\_identifiers

```gdscript
func test_keyword_prefixed_names_scan_as_identifiers() -> void
```
    
% ...
---
### test\_hyphenated\_global\_identifier\_scans\_as\_single\_identifier

```gdscript
func test_hyphenated_global_identifier_scans_as_single_identifier() -> void
```
    
% ...
---
### test\_blank\_lines\_in\_nested\_blocks\_do\_not\_break\_later\_events

```gdscript
func test_blank_lines_in_nested_blocks_do_not_break_later_events() -> void
```
    
% ...
---
### test\_blank\_lines\_before\_dedent\_do\_not\_hide\_block\_termination

```gdscript
func test_blank_lines_before_dedent_do_not_hide_block_termination() -> void
```

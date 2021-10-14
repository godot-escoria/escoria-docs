.. Escoria settings

Escoria settings
================

Review Escoria's settings
-------------------------

When you open theProjects Settings window, down below the parameters list in the General tab, you can find an Escoria section with 5 settings categories which we'll review in detail in following sub-sections:

- Main
- Debug
- Ui
- Sound
- Platform

Main
~~~~

Allows you to set some base settings, paths and versions number of your game.

This category defines the following settings:

+---------------------+-------------------------------------------------------+
| Setting             | Description                                           | 
+=====================+=======================================================+
| Game version        | The version of your game. This setting is important   |
|                     | forsavegames management between your game versions.   |
+---------------------+-------------------------------------------------------+
| Start game script   | The ESC script that Escoria will run immediately as   |
|                     | you start the game.                                   |
+---------------------+-------------------------------------------------------+
| Force quit          | (unused) Defines whether Godot will force quit the    |
|                     | game on closing attempt.                              |
+---------------------+-------------------------------------------------------+
| Command directories | Array of paths containing the ESC scripting language  |
|                     | commands. If you need to define one or more custom    |
|                     | ESC commands, you must put their implementations in   |
|                     | a folder of your project and append this path into    |
|                     | this setting array.                                   |
+---------------------+-------------------------------------------------------+
| Text lang           | Game base text language's ICU code                    |
+---------------------+-------------------------------------------------------+
| Voice lang          | Game base voice language's ICU code                   |
+---------------------+-------------------------------------------------------+
| Savegames path      | Path to the savegames folder. Defaults to             |
|                     | user://saves/                                         |
+---------------------+-------------------------------------------------------+
| Settings path       | Path to user's settings. Defaults to user://          |
+---------------------+-------------------------------------------------------+

Debug
~~~~~

Allows you to define the behavior of Godot when Escoria triggers an error or a warning, as well as log level.

This category defines the following settings:

+-----------------------+----------------------------------------------------+
| Setting               | Description                                        |
+=======================+====================================================+
| Terminate on warnings | If checked, the execution will stop when a warning |
|                       | is logged by Escoria.                              |
+-----------------------+----------------------------------------------------+
| Terminate on errors   | If checked, the execution will stop when an error  |
|                       | is logged by Escoria.                              |
+-----------------------+----------------------------------------------------+
| Development lang      | Game development language's ICU code               |
+-----------------------+----------------------------------------------------+
| Log level             | Log level (can be INFO, WARNING or ERROR)          |
+-----------------------+----------------------------------------------------+

Ui
~~

Allows you to define the paths to some primordial scenes required by Escoria to run correctly. These scenes have to be created by the game developer.

This category defines the following settings:

+-------------------------+--------------------------------------------------+
| Setting                 | Description                                      |
+=========================+==================================================+
| Tooltip follows mouse   | If checked, the tooltip is not fixed to the UI   |
|                         | and will instead follow the mouse cursor         |
+-------------------------+--------------------------------------------------+
| Default dialog scene    | Path to the default scene to be used as dialog   |
|                         | scene                                            |
+-------------------------+--------------------------------------------------+
| Game scene              | Path to the Game scene                           |
+-------------------------+--------------------------------------------------+
| Items autoregister path | Path to the folder containing items of the game, |
|                         | so that Escoria will autoregister them           |
+-------------------------+--------------------------------------------------+
| Dialogs chooser         | Path to the dialog chooser scene                 |
+-------------------------+--------------------------------------------------+

Sound
~~~~~

Allows you to define the base volumes for each sound channel managed by Escoria.

This category defines the following settings:

+------------------+------------------------------------------------------+
| Setting          | Description                                          |
+==================+======================================================+
| Music volume     | Default volume of the music (float between 0 and 1)  |
+------------------+------------------------------------------------------+
| Sfx volume       | Default volume of the sound (float between 0 and 1)  |
+------------------+------------------------------------------------------+
| Speech volume    | Default volume of the speech (float between 0 and 1) |
+------------------+------------------------------------------------------+
| Master volume    | Default master volume (float between 0 and 1)        |
+------------------+------------------------------------------------------+
| Speech enabled   | If true, Escoria will attempt to find speeches for   |
|                  | each encountered dialog key                          |
+------------------+------------------------------------------------------+
| Speech folder    | Folder to the speech files                           |
+------------------+------------------------------------------------------+
| Speech extension | File extension of speech files. Must be a resource   |
|                  | type that can be imported by Godot, natively or      |
|                  | through an import plugin                             |
+------------------+------------------------------------------------------+

Platform
~~~~~~~~

Allows you to define some specific behaviors for cache management (regarding to resources loading), for desktop and mobile.

This category defines the following settings:

+-------------------+----------------------------------------------------+
| Setting           | Description                                        |
+===================+====================================================+
| Skip cache        | If true, Escoria will not use the cache memory to  |
|                   | load resources (on desktop)                        |
+-------------------+----------------------------------------------------+
| Skip cache.mobile | If true, Escoria will not use the cache memory to  |
|                   | load resources (on mobile devices where memory is  |
|                   | usually lower or restricted)                       |
+-------------------+----------------------------------------------------+
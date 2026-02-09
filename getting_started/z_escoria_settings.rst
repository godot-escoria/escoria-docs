.. _escoria_settings:

Escoria settings
================

Review Escoria's settings
-------------------------

When you open the Project Settings window and look below the list of parameters
in the "General" tab, you can find an "Escoria" section with 5 settings categories
which we'll review in detail in the following sub-sections:

- Main
- Debug
- UI
- Sound
- Platform

.. hint::

  You may need to click the "Advanced Settings" slider in order for the "Escoria"
  settings branch to appear in the settings navigation panel.

Main
~~~~

Allows you to set some base settings, paths, and the version number of your
game.

This category defines the following settings:

+-----------------------+-------------------------------------------------------+
| Setting               |   Description                                         |
+=======================+=======================================================+
| Game Version          | The version of your game. This setting is important   |
|                       | for savegame management between your game versions.   |
+-----------------------+-------------------------------------------------------+
| Game Start Script     | The ASHES script that Escoria will run immediately    |
|                       | when you start the game.                              |
+-----------------------+-------------------------------------------------------+
| Force Quit            | (unused) Defines whether Godot will force quit the    |
|                       | game on a closing attempt.                            |
+-----------------------+-------------------------------------------------------+
| Command Directories   | Array of paths containing the ASHES scripting language|
|                       | commands. If you need to define one or more custom    |
|                       | ASHES commands, you must put their implementations in |
|                       | a folder of your project and append this path to      |
|                       | this array.                                           |
+-----------------------+-------------------------------------------------------+
| Text Lang             | Game base text language's ICU code                    |
+-----------------------+-------------------------------------------------------+
| Voice Lang            | Game base voice language's ICU code                   |
+-----------------------+-------------------------------------------------------+
| Savegames Path        | Path to the savegames' folder. Defaults to            |
|                       | "user://saves/".                                      |
+-----------------------+-------------------------------------------------------+
| Settings Path         | Path to user's settings. Defaults to "user://".       |
+-----------------------+-------------------------------------------------------+
| Action Default Script | Optional path to ASHES script containing default      |
|                       | actions to take if a particular event can't be found. |
|                       | This is useful for avoiding having to implement every |
|                       | "invalid" interaction, e.g. trying to pick up a house.|
+-----------------------+-------------------------------------------------------+
| Game Migration Path   | Path containing version migration scripts.            |
+-----------------------+-------------------------------------------------------+

Debug
~~~~~

Allows you to define the behavior of Godot when Escoria triggers an error or a
warning, as well as the log level.

This category defines the following settings:

+------------------------+-----------------------------------------------------+
| Setting                | Description                                         |
+========================+=====================================================+
| Terminate on Warnings  | If checked, execution will stop when a warning      |
|                        | is logged by Escoria.                               |
+------------------------+-----------------------------------------------------+
| Terminate on Errors    | If checked, execution will stop when an error       |
|                        | is logged by Escoria.                               |
+------------------------+-----------------------------------------------------+
| Development Lang       | Game development language's ICU code.               |
+------------------------+-----------------------------------------------------+
| Log Level              | Log level (can be TRACE, DEBUG, INFO, WARNING,      |
|                        | or ERROR).                                          |
+------------------------+-----------------------------------------------------+
| Log File Path          | Path where Esscoria logs are to be stored.          |
+------------------------+-----------------------------------------------------+
| Crash Message          | User-friendly message to display if the game should |
|                        | crash during execution.                             |
+------------------------+-----------------------------------------------------+
| Enable Room Selector   | Shows or hides the a selector in the UI to allow    |
|                        | the developer to quickly start a specific room.     |
+------------------------+-----------------------------------------------------+
| Room Selector Room Dir | The directory containing the list of rooms to       |
|                        | selector from the room selector. Rooms must be      |
|                        | Godot scenes.                                       |
+------------------------+-----------------------------------------------------+
| Perform Script         | Performs static analysis of ASHES scripts as        |
| Analysis at Runtime    | encountered at runtime.                             |
+------------------------+-----------------------------------------------------+


UI
~~

Allows you to define the paths to scenes required by Escoria to run correctly
as well as other settings relevant to the UI.

These scenes have to be created by the game developer.

This category defines the following settings:

+-------------------------+--------------------------------------------------+
| Setting                 | Description                                      |
+=========================+==================================================+
| Game Scene              | Path to the main Game scene.  Typially found as  |
|                         | part of the UI implementation.                   |
+-------------------------+--------------------------------------------------+
| Default Transition      | The transition type to use if none is specified  |
|                         | when called for.                                 |
+-------------------------+--------------------------------------------------+
| Transition Paths        | Array of paths containing transitions that can   |
|                         | be used by Escoria.                              |
+-------------------------+--------------------------------------------------+
| Inventory Items Path    | Path to the folder containing inventory items    |
+-------------------------+--------------------------------------------------+
| Inventory Items Size    | The dimensions to be used when displaying items  |
|                         | in the player's inventory.                       |
+-------------------------+--------------------------------------------------+
| Dialog Managers         | Array of dialog managers available for use by    |
|                         | Escoria. Each one should be the path to a dialog |
|                         | manager as a GDScript file, not a scene file.    |
|                         | for the game.                                    |
+-------------------------+--------------------------------------------------+
| Default Dialog Type     | Default style of dialog rendering,               |
|                         | e.g. ``floating`` or ``avatar``.                 |
+-------------------------+--------------------------------------------------+

Sound
~~~~~

Allows you to define the base volumes for each sound channel managed by
Escoria.

This category defines the following settings:

+------------------+------------------------------------------------------+
| Setting          | Description                                          |
+==================+======================================================+
| Music Volume     | Default volume of the music (float between 0 and 1). |
+------------------+------------------------------------------------------+
| Sfx Volume       | Default volume of the sound (float between 0 and 1). |
+------------------+------------------------------------------------------+
| Speech Volume    | Default volume of the speech (float between 0 and 1).|
+------------------+------------------------------------------------------+
| Ambient Volume   | Default volume of ambient sounds                     |
|                  | (float between 0 and 1).                             |
+------------------+------------------------------------------------------+
| Master Volume    | Default master volume (float between 0 and 1).       |
+------------------+------------------------------------------------------+
| Speech Enabled   | If true, Escoria will attempt to find speech for     |
|                  | each encountered dialog key.                         |
+------------------+------------------------------------------------------+
| Speech Folder    | Folder to the speech audio files.                    |
+------------------+------------------------------------------------------+
| Speech Extension | File extension of speech files. Must be a resource   |
|                  | type that can be imported by Godot, either natively  |
|                  | or through an import plugin                          |
+------------------+------------------------------------------------------+

Platform
~~~~~~~~

Allows you to define some specific behaviors for cache management (regarding
resource loading), for desktop and mobile.

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

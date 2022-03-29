.. _load_save:

Game and settings load and save system
======================================

Escoria comes with a complete Save and Load manager that takes care of saving a
player's game state so that it's possible to load a previously saved game.

It also allows for the saving and loading of game settings. Both settings and
save game files can optionally contain user-defined settings.

Loading and saving games
------------------------

Escoria manages save games using numbered slots. A save game slot is required
to be provided as part of the save game function call.  If the given slot
already has a save game, that saved game will be overwritten. The
:doc:`ESCSaveManager.load_game() </api/ESCSaveManager>` function can be used to
give the player the opportunity to choose whether to overwrite the existing
save game or not.

There is no limitation on the number of save slots that can be used.

Saving a game is as simple as calling the :doc:`ESCSaveManager.save_game()
</api/ESCSaveManager>` function.

Files are saved to the folder specified in the Godot's Project Settings under
``escoria/main/savegames_path``. If not changed, the default is '<game
folder>/saves'.

Loading a game works the same way, using a slot number to load the
relevant save game. To load a game, simply call
:doc:`ESCSaveManager.load_game() </api/ESCSaveManager>` function.

Attempting to load a saved game that doesn't exist will result in an error
message being displayed ("Save file <id> doesn't exist").

Files are loaded from the folder specified in Godot's Project Settings
under ``escoria/main/savegames_path``. The default is '<game folder>/saves'.

.. code-block:: gdscript

  var slot: int = 1
  var savename: String: "Blocked in room before puzzle"

  # This will save the game in the file /saves/save_001.tres
  escoria.save_manager.save_game(slot, savename)

Loading and saving settings
---------------------------

Game settings are loaded when the game is run. If no settings file exists, a
new one is created with default values.

It is not required to manage settings saving and loading if the player is not
supposed to change any of them. Otherwise, settings should be saved. It is the
duty of the game developer to manage this in a settings UI included in the game
menus.

Settings files are stored in a :doc:`ESCSaveSettings</api/ESCSaveSettings>`
resource file.

The following settings are stored in the settings file:

- ``text_lang``: the language of the text displayed in the game.

- ``voice_lang``: the speech language.

- ``speech_enabled``: a boolean value indicating whether audio speech is
  enabled in the game.

- ``master_volume``: the global volume value (a value between 0 and 100).

- ``music_volume``: the volume of the music (a value between 0 and 100).

- ``sfx_volume``: the  sound effects volume, ie. all sounds that are not music
  or speech (a value between 0 and 100).

- ``speech_volume``: the speech volume (a value between 0 and 100)

- ``fullscreen``: a boolean value indicating whether the game is fullscreen.

- ``skip_dialog``: a boolean value indicating whether dialogue skipping is
  allowed.

- ``custom_settings``: a dictionary containing any custom data to be saved. For
  example, the screen resolution could be added in this field. See `Saving
  custom data in save game and settings files`_.

Saving custom data in save game and settings files
--------------------------------------------------

As indicated above, both save game and settings files provide a specific field
allowing the game developer to add custom data to these files. This section
describes how to use these fields.

Adding custom data to save game files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The :doc:`ESCSaveGame </api/ESCSaveSettings>` data structure provides a
dictionary variable ``custom_data`` which custom data can be added to.

This feature requires a ``get_custom_data()`` function to be implemented in the
``game.gd`` script of the game (extending ``ESCGame``). This function must
return a dictionary value that contains the custom data to be saved.

When the ``ESCSaveManager.save_game()`` function is called, the
``ESCGame.get_custom_data()`` function is automatically called and the returned
dictionary is then saved in the ``custom_data`` field of the save game file.

Adding custom data to settings files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The :doc:`ESCSaveSettings </api/ESCSaveSettings>` data structure contains a
dictionary variable ``custom_settings`` where the developer can add any data
they would like to save.

To save the custom settings, it is simply required to set the values to save
directly in the ``escoria.settings.custom_settings`` Dictionary value. The
``escoria.settings`` parameter is directly saved as-is when the
``ESCSaveManager.save_settings()`` function is called to save the settings.

To make use of this feature, an ``apply_custom_settings()`` function needs to
be implemented in the ``game.gd`` script of the game (extending ``ESCGame``).
This function is automatically called by the ``escoria.apply_settings()``
function when the game starts, which is called right after the settings file is
loaded.

Managing migrations
-------------------

With newer versions of Escoria, certain built-in ESC variables may change their
name. For this reason, upgrading the Escoria version could break older versions
of a save game. In the same way, during the development of the game, an ESC
variable or item id may change. It is then necessary to migrate old savegames
that contain the old names, replacing them with the new ones.

When a save game file is loaded, Escoria will automatically initiate the
migration between both Escoria and game versions.

While Escoria migrations are automatically managed, migrations between Game
versions must be managed by the game developer. See `Game version migration`_
for details.

Escoria migration
~~~~~~~~~~~~~~~~~

This section of the documentation is for informational purposes only. No
developer interaction is required.

During the loading of a save game, Escoria automatically performs a version
check: if the Escoria version listed in the save game file is older than the
current Escoria version used by the game, the
:doc:`ESCMigrationManager.migrate() </api/ESCMigrationManager>` function is
automatically called to convert the save game file to match the newer Escoria
version.

Game version migration
~~~~~~~~~~~~~~~~~~~~~~

To make use of automated version migration, the game must have a version
defined in Godot's Project Settings under ``escoria/main/game_version``. This
game version number is saved in the save game file. The version follows a
``x.y.z`` pattern where:

- ``x`` is the *major* version number.
- ``y`` is the *minor* version number.
- ``z`` is the *patch* version number.

Let's suppose that a save game file was created using game version ``1.0.0``
and is then loaded in game version ``1.1.0``. Upon loading the ``1.0.0``
savegame, Escoria will migrate it through every intermediary version (if any)
before migrating it to the ``1.1.0`` version. Where migrations are required,
all versions requiring a migration must have an associated migration script.

All game migration scripts must be located in a migration scripts folder. This
folder is configured in Godot's Projects Settings, under
``escoria/main/game_migration_path``.

A migration script filename must follow the version number pattern:
``x.y.z.gd``.

Any migration script must extend the :doc:`ESCMigration </api/ESCMigration>`
class and implement the ``migrate()`` function. This function modifies the save
game content to move the former variables to the newer ones. To do so, the
``self`` object contains a member ``_savegame`` that allows access to the save
game data described in the `Loading and saving games`_ section.

.. code-block:: gdscript

    # File 1.1.0.gd # Migrate to version 1.1.0 of the game. # This version
    changes the name of the "tets" global to "test".

    extends ESCMigration

    function migrate():
        # Copy the "tets" global value into the "test" global value.
        self._savegame.globals["test"] = self._savegame.globals["tets"]

        # Remove the now useless global "tets"
        self._savegame.globals.erase("tets")

Save game data
--------------

This section of the documentation is for informational purposes only.

Save games hold data that are listed and explained here for a better
understanding.

Header data
~~~~~~~~~~~

Save games hold "header" data:

- Version of Escoria being used: this is used to manage the automated migration
  of save games between Escoria versions. See `Managing migrations`_.

- Version of the game: this is additional information used for the automated
  migration of save games between different versions of the game. See `Managing
  migrations`_.

- Name that describes the savegame: This can be either provided by the player
  or managed by the game (and thus transparent to the player).

- Date: the saved game's creation date.

Game data
~~~~~~~~~

These data are split into 3 dictionaries:

- ``main``: contains internal information such as the last visited scene
  ID, and the scene where the player is currently located.

- ``globals``: the contents of all the global variables at the time of saving.

- ``objects``: data about all objects registered in Escoria. These data include
  the object's state, position, orientation, etc. Any object that the player
  has yet to encounter in the game is not registered, so these objects will
  have their values set to their default settings on loading.

- ``custom_data``: a dictionary containing custom data to be saved. See `Saving
  custom data in save game and settings files`_.

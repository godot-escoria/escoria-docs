.. _load_save:

Game and settings load and save system
======================================

Escoria comes with a complete Save and Load manager that takes care of saving a
player's game state so that it's possible to load a previously saved game.

It also allows saving and loading settings of the game. Both settings and
savegames can also contain user-defined settings.

Loading and saving games
------------------------

Escoria manages savegames as numbered slots. A savegame requires a slot number
to be used; if the given slot already has a savegame, it is possible to
overwrite it. There is no limitation on the number of slots that can be used.
Saving a game is as simple as calling :doc:`ESCSaveManager.save_game()
</api/ESCSaveManager>` function.

Loading a game works the same way by providing a slot number to load the
attached savegame. To load a game, simply call :doc:`ESCSaveManager.load_game()
</api/ESCSaveManager>` function.

Savegames hold multiple "header" data:

- Version of Escoria being used: this is used to manage migration of savegames
  between Escoria versions. See `How to manage migrations`_.

- Version of the game: this is equally used to manage migrations of savegames
  between the versions of the game. See `How to manage migrations`_.

- Name that describes the savegame: this can be either provided by the player
  or managed by the game (and thus transparent for the player).

- Date: the date of creation of the savegame.

And of course, savegames contain the game data. These data are split in 3
dictionaries:

- ``main``: contains some internal information, such as the last visited scene
  ID and the current scene the player is located in.

- ``globals``: all the global variables values at the moment of saving.

- ``objects``: all data about objects registered in Escoria. These data include
  the state, the position, the orientation, etc. Any object that the player
  never encountered in his game is not registered so it will be set at its
  default value on loading.

- ``custom_data``: a Dictionary structure containing custom data to be saved.
  See `Save custom data in savegames and settings`_.


Loading and saving settings
---------------------------

Settings file are saved in a :doc:`ESCSaveSettings</api/ESCSaveSettings>`
resource file.

Default data included in settings files are:

- ``text_lang``: language of displayed text in the game.

- ``voice_lang``: speech language.

- ``speech_enabled``: boolean value indicating whether speech is enabled in the
  game.

- ``master_volume``: global volume (value between 0 and 100).

- ``music_volume``: volume of the music (between 0 and 100).

- ``sfx_volume``: volume of sound effects, ie. all sounds that are not music
  nor speech (value between 0 and 100).

- ``speech_volume``: volume of speech (value between 0 and 100)

- ``fullscreen``: boolean value indicating whether the game is fullscreen or
  not.

- ``skip_dialog``: boolean value indicating whether dialogs skipping is allowed
  or not.

- ``custom_settings``: a Dictionary structure containing custom data to be
  saved. For example, the screen resolution could be added in this field. See
  `Save custom data in savegames and settings`_.

Save custom data in savegames and settings
------------------------------------------

As indicated above, both savegames and settings provide a specific field
allowing the game developer to add custom data to be saved in these files. This
section describes how to use these fields.

In savegames
~~~~~~~~~~~~

The :doc:`ESCSaveGame </api/ESCSaveSettings>` data structure provides a
dictionary variable ``custom_data`` allowing saving any data in it.

This feature comes with a ``get_custom_data()`` function that needs to be
implemented in the ``game.gd`` script of the game (extending ``ESCGame``). This
function must return a Dictionary value that contains the custom data to be
saved.

When the ``ESCSaveManager.save_game()`` function is called,
``ESCGame.get_custom_data()`` function is automatically called and the returned
Dictionary is then saved in the ``custom_data`` field of the savegame.


In settings
~~~~~~~~~~~

The :doc:`ESCSaveSettings </api/ESCSaveSettings>` data structure contains a
Dictionary variable ``custom_settings`` allowing saving any data in it.

To save the custom settings, it is simply required to set the values to save,
directly in ``escoria.settings.custom_settings`` Dictionary value. The
``escoria.settings`` parameter is directly saved as-is when the
``ESCSaveManager.save_settings()`` function is called to save the settings.

This feature also comes with a ``apply_custom_settings()`` function that needs
to be implemented in the ``game.gd`` script of the game (extending
``ESCGame``). This function is automatically called by the
``escoria.apply_settings()`` function, which is called right after the settings
file is loaded.

How to manage migrations
------------------------

With new versions of Escoria, certain built-in ESC variables may change their
name. For this reason, upgrading the Escoria version could break older versions
of a savegame. In the same way, along the development of the game, an ESC
variable or item id may change. It is then necessary to migrate old savegames
that contain old names to replace them with new names.

Upon a savegame loading, Escoria automatically manages migrations between
Escoria versions as well as migrations between game versions.

Escoria migrations are automatically managed. This migration process is only
described for exhaustivity purpose. Game versions migrations are obviously
managed by the game developer.

Escoria migration
~~~~~~~~~~~~~~~~~

At savegame loading, Escoria automatically performs a version check: if the
Escoria version of the savegame is older than current Escoria version used by
the game, the :doc:`ESCMigrationManager.migrate() </api/ESCMigrationManager>`
function is automatically called to convert the savegame to newer Escoria
version.

Game version migration
~~~~~~~~~~~~~~~~~~~~~~

The game must have a defined version set in Project Settings
``escoria/main/game_version``. This game version number is saved in the
savegame file. A version follows a ``x.y.z`` pattern where:

- ``x`` is the *major* version number
- ``y`` is the *minor* version number
- ``z`` is the *patch* version number

Let's suppose that a savegame was created with game version ``1.0.0`` and is
loaded in game version ``1.1.0``. Upon loading a ``1.0.0`` savegame, Escoria
will migrate it to every intermediar version before migrating it to ``1.1.0``
version. If required, all versions requiring a migration must have a migration
script.

All game migration scripts are located in a given folder that Escoria will look
into for migration scripts. This folder is set in Projects Settings, under
``escoria/main/game_migration_path``.

A migration script filename must follow the version number pattern:
``x.y.z.gd``.

Any migration script must extend :doc:`ESCMigration </api/ESCMigration>` class
and implement the ``migrate()`` function. This function modifies the savegame
content to move the former variables to the newer ones. To do so, ``self``
object contains a member ``_savegame`` that allows the access to the savegame
data described in `Loading and saving games`_ section.

.. code-block:: gdscript

    # File 1.1.0.gd
    # Migrate to version 1.1.0 of the game.
    # This version changes the name of the "tets" global to "test".

    extends ESCMigration

    function migrate():
        # Copy the "tets" global value into the "test" global value.
        self._savegame.globals["test"] = self._savegame.globals["tets"]

        # Remove the now useless global "tets"
        self._savegame.globals.erase("tets")

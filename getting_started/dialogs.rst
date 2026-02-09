Writing dialogs
================

Dialogs are an essential part of narrative games. Whether it's about world
building, fleshing out characters or presenting puzzles, dialogs are usually
found in every narrative game.

Escoria supports a feature-rich dialog system integrated in the
`ASHES language`_.

Dialog concept
--------------

Dialogs in Escoria are based on two parts:

- The :doc:`say </api/commands/SayCommand>` command to display text, show speech
  animations and play voice files for a character.
- A dialog chooser that displays a list of options for the player to choose from
  while engaged in a dialog.

A simple dialog
---------------

The following code from an ASHES script attached to a character called "worker"
shows a simple dialog:

.. code-block::

    #1
    :talk

      say($player, "Hello!")
      say($worker, "How can I help you?")

      #2
      ?!

        #3
        - "I sell fine leather jackets."
          say worker "Aha. Well, I don't like leather."

        #4
        - "Can you tell me where the train station is?"
          say($worker, "Sure. You just go right, then righ againt...")
          say($player, "Okay...")
          say($worker ,"...then right and then right...")
          say($player, "Aha...")
          say($worker, "...and then you ask somebody else.")
      #5
      !?

.. hint::

    The lines marked with # are simply comments and are not required for the
    dialog.

Let's break it down:

- The ASHES event starts at ``#1`` for when the player uses the "talk" verb. The
  dialog starts with two ``say`` commands that will display the specified text
  for the player and the worker respectively.
- At ``#2`` the dialog chooser is introduced by a ``?!`` string on its own line
  that is appropriately indented.
- ``#3`` and ``#4`` show the different available options for the dialog. They will both
  be displayed on screen and the player can select either one of them.
  An option starts with a ``-`` along with the text that should be displayed.
  Depending on the chosen option, the respective ``say`` commands are played,
  creating a complete dialog.
- The line at ``#5`` concludes the dialog chooser; it is a ``!?`` string on its own
  line that is appropriately indented.

Conditional options
-------------------

Like every command in ASHES, conditions can also be added to dialog options to
only show them under specific conditions.

Dialog option conditions are a comma-separated list enclosed in brackets and appear
after the option.

.. code-block::

    (...)
    ?!

        - "Can you tell me where the train station is?" [!knows_way]

    (...)

In this example, the option will only be shown if the ASHES variable ``knows_way``
is either ``false`` or isn't set. The developer can set the state to ``true`` once
the player knows the way to the train station so they don't ask for directions
again.

.. note::

    Dialog option conditions are unique and differ from ordinary conditions in ASHES.
    See :ref:`the ASHES reference <conditions>` for more
    details about conditions.

Recorded speech
---------------

Escoria features voice support as well.

To use it, just pass a key into the ``say`` command, like this:

.. code-block::

    say($player, "Hello!", "worker_hello")

The name of the audio file serves as a key for the `say` command so it
knows which audio file to play. The name of the file (without any extension)
**must** be the same as the key. As an example, the above `say` command would play
the audio file "worker_hello.mp3" (or any other supported audio format file,
like "worker_hello.ogg").

.. hint::

    It is very important to ensure that any audio speech files are imported into
    Godot with the import flag `loop` set to `false`. If `loop` is set to `true`,
    in certain conditions (such as changing the sound volume while a speech
    audio file is being played), Escoria's speech player will loop the speech
    even if the line has already been spoken.

    To configure this, select the audio files in Godot editor's Filesystem. In the
    Import panel, untick the `loop` import parameter and click the `Reimport`
    button.

.. hint::

    Once you add a key to the `say` command's arguments, the text in
    quotes will be ignored. Escoria will instead use
    Godot's translation system to determine the text (translated and
    untranslated) to display based on the key provided.
    It is recommended you use some descriptive text so you
    know what text the command is referring to.

The audio formats that Godot supports are listed here: (https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_audio_samples.html#supported-audio-formats).

Escoria uses a configuration parameter to specify where in your directory
structure to find your game's audio files. This setting can be found in
``Project/Project Settings/Escoria/Sound/Speech Folder`` (note that you may need to
selected ``Advanced Settings`` to reveal the "Escoria" settings branch). Set this
to a location appropriate for your game - e.g. ``res://game/speech``.

See :doc:`here </api/commands/SayCommand>` for further details on the ``say`` command.

Translations
------------

The detail below serves only as a high-level overview of Internationalization support
in Godot. For more information, please see Godot's translation documentation here: (https://docs.godotengine.org/en/stable/tutorials/i18n/internationalizing_games.html).

Creating text translations
~~~~~~~~~~~~~~~~~~~~~~~~~~

Escoria takes advantage of Godot's built-in translation functionality for
providing language support. Translation information is found in Godot's
``Project/Project Settings/Localization`` menu (text in ``Translations``; audio in
``Remaps``).

Text translation relies on CSV files, an example of which is::
  keys,en,es
  ROOM1_greeting,"Hello, friend!","Hola, amigo!"

Once the CSV file containing the translation text has been created, use
Godot's importer to import it (under
``Project/Project Settings/Localization/Tranlations/Add``).

For further details on creating and importing translations click here: (https://docs.godotengine.org/en/stable/tutorials/assets_pipeline/importing_translations.html).

Godot's built-in translation features can be found here: (https://docs.godotengine.org/en/stable/tutorials/i18n/internationalizing_games.html).

Using text translations in your game
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The key (``"ROOM1_greeting"`` in the above example) is used in the ``say``
command to tell Escoria which translation to use. This is exactly the same key as
the one used for playing a corresponding audio file with the command::

  :look
    say($player, "Hello, friend!", "ROOM1_greeting")

.. hint::

    Once you add a key to the `say` command's arguments, the text in
    quotes will be ignored. Escoria will instead use
    Godot's translation system to determine the text (translated and
    untranslated) to display based on the key provided.
    It is recommended you use some descriptive text so you
    know what text the command is referring to.

Creating audio translations
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create your audio files to match the ones in the game's original language.
Store these files in the same location as your original recordings.

While the files can be called whatever you like, keeping the same name as the
original file and adding a language identifier is an easy way to keep track of
your files; e.g. a file called ``hello.ogg`` might have matching files called
``hello_de.ogg`` for the German translation, and ``hello_fr.ogg`` for the French.

Using audio translations in your game
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following is a high-level overview of the language remapping functionality
provided by Godot. For more in-depth documentation, please follow this link: (https://docs.godotengine.org/en/stable/tutorials/i18n/internationalizing_games.html#localizing-resources).

Godot provides a mechanism to map files between the different languages you
provide for your game. The mapping function can be found under
``Project/Project Settings/Localization/Remaps``.

Use the ``Add`` button in the ``Resources`` part of the window, choosing the audio
file you wish to provide a translation for (e.g. ``hello.ogg``). Once you've
added the file, highlight it, and use the ``Add`` button in the ``Remaps by
Locale`` section of the window. In the file browser that appears, find the
matching audio file in the new language (e.g. ``hello_fr.ogg``). Next to this
file, use the ``Locale`` pulldown menu to tell Godot which language that file
features. Add more remaps if you are supporting additional languages.

Repeat this process for every source file and every translated
version you have for it.

Changing the language being used by your game
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

How the player chooses the language they wish to play your game in is entirely
up to you. You may provide them with flags or a pulldown menu, for example, to
choose from as part of your game menu. Once a language has been chosen, your
game menu needs to run the following commands to tell Godot to use the
selected language::

  TranslationServer.set_locale(language)
  escoria.settings["text_lang"] = language

Dialog presentation
-------------------

Displaying lines on screen or presenting options to the player is the task of
"**Dialog managers**". Escoria supports custom dialog managers using
Godot addons and provides a very simple stock dialog manager to get users
started.

.. hint::

    More information about creating custom dialog managers can be
    found :doc:`in this document </advanced/create_dialog_manager>`.


.. _`ASHES language`: /scripting/z_ashes_reference.html

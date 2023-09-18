Writing Dialogs
================

Dialogs are an essential part of narrative games. Whether it's about world
building, fleshing out characters or presenting puzzles, dialogs are usually
found in every narrative game.

Escoria supports a feature-rich dialog system integrated in the
:doc:`ESC language </scripting/z_esc_reference>`.

Dialog concept
--------------

Dialogs in Escoria are based on two parts:

- The :doc:`say command </api/SayCommand>` to display text, show speech
  animations and play voice files for a character
- A dialog chooser that displays a list of options for the player to choose
  while engaged in a dialog.

A simple dialog
---------------

The following code from an ESC script attached to a character called "worker"
shows a simple dialog:

.. code-block::

    #1
    :talk

    say player "Hello!"
    say worker "How can I help you?"

    #2
    ?
        #3
        - "I sell fine leather jackets."

            say worker "Aha. Well, I don't like leather."
            stop

        #4
        - "Can you tell me where the train station is?"

            say worker "Sure. You just go right, then right."
            say player "Okay?"
            say worker "Then right and then right."
            say player "Aha?"
            say worker "And then you ask somebody else."
            stop
    #5
    !

.. hint::

    The lines marked with # are simply comments and are not required for the
    dialog.

Let's break it down.

- The ESC event starts at #1. The player uses the "talk" verb. The dialog
  starts with two ``say`` commands that will display the specified text for the
  player and the worker respectively.
- At #2 the dialog chooser is introduced by a single "?" on its own line.
- #3 and #4 show the different available options for the dialog. They will both
  be displayed on screen and the player can select from one of them.
  An option starts with a "-" along with the text that should be displayed.
  Depending on the chosen option, the respective ``say`` commands are played,
  creating a complete dialog.
- The line at #5 concludes the dialog chooser; it is a single "!" on its own
  line.

Conditional options
-------------------

Like every command in ESC, conditions can also be added to dialog options to
only show them under specific conditions.

Conditions are a comma-separated list enclosed in brackets and appear after the
option.

.. code-block::

    (...)
    ?

        - "Can you tell me where the train station is?" [!knows_way]

    (...)

In this example, the option will only be shown if the global state "knows_way"
is either *false* or isn't set. The developer can set the state to *true* once
the player knows the way to the train station so they don't ask for directions
again.

.. hint::

    See `the ESC reference </scripting/z_esc_reference#conditions>` for
    details about conditions.

Recorded Speech
---------------

Escoria features voice support as well.

To use it, every line that should support a voice file requires an
additional text key (i.e. a name, followed by a colon, followed by the text to
say), like this:

.. code-block::

    say player worker_hello:"Hello!"

The name of the audio file serves as a key for the `say` command so it
knows which audio file to play. The name of the file (without any extension)
must be the same as the key. As an example, the above `say` command would play
the audio file "worker_hello.mp3" (or any other supported audio format file
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

    Once you add a key to the `say` command's text parameter, the text in
    quotes will be ignored. Escoria will instead use
    Godot's translation system to determine the text (translated and
    non-translated) to display. As the command requires some text inside
    the quotes to be valid, it is recommended you use the original text so you
    know what text the label refers to.

The audio formats that Godot supports are listed here :
`https://docs.godotengine.org/en/3.5/tutorials/assets_pipeline/importing_audio_samples.html?highlight=ogg#supported-files`

Escoria uses a configuration parameter to specify where in your directory
structure to find your game's audio files. This setting can be found in
`Project/Project Settings/Escoria/Sound/Speech Folder`. Set this to a
location appropriate for your game - e.g. `res://game/speech`.

See `https://docs.escoria-framework.org/en/devel/scripting/z_esc_reference.html#say-player-text-type-api-doc`
for further details on the `say` command.

Translations
------------

The detail below is only a high-level overview of Internationalization support
in Godot. For more information, please see Godot's translation documentation
`https://docs.godotengine.org/en/3.5/tutorials/i18n/internationalizing_games.html`

Creating text translations
~~~~~~~~~~~~~~~~~~~~~~~~~~

Escoria takes advantage of Godot's built-in translation functionality for
providing language support. Translation information is found in Godot's
`Project/Project Settings/Localization` menu (text in `Translations`, audio in
`Remaps`).

Text translation relies on CSV files, an example of which is::
  keys,en,es
  ROOM1_greeting,"Hello, friend!","Hola, amigo!"

Once the CSV file containing the translation text has been created, use
Godot's importer to import it (under
`Project/Project Settings/Localization/Tranlations/Add`).

For further details on creating and importing translations see
`https://docs.godotengine.org/en/3.5/tutorials/assets_pipeline/importing_translations.html`

Godot's built-in translation features: `https://docs.godotengine.org/en/3.5/tutorials/i18n/internationalizing_games.html`

Using text translations in your game
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The key ("ROOM1_greeting" in the above example) is used in the `say` script
command to tell Escoria which translation to look for. Place this key with
a colon prior to the text in your script file::

  :look
  say player ROOM1_greeting:"Hello, friend!"

.. hint::

    Once you add a key to the `say` command's text parameter, the text in
    quotes will be ignored. Escoria will instead use
    Godot's translation system to determine the text (translated and
    non-translated) to display. As the command requires some text inside
    the quotes to be valid, it is recommended you use the original text so you
    know what text the label refers to.

Creating audio translations
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create your audio files to match the ones in the game's original language.
Store these files in the same location as your original recordings.

While the files can be called whatever you like, keeping the same name as the
original file and adding a language identifier is an easy way to keep track of
your files. e.g. A file called `hello.ogg` might have matching files called
`hello_de.ogg` for the German translation, and `hello_fr.ogg` for the French.

Using audio translations in your game
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following is a high-level overview of the language remapping functionality
provided by Godot. For more in-depth documentation, please see
`https://docs.godotengine.org/en/3.5/tutorials/i18n/internationalizing_games.html?highlight=remaps#localizing-resources`

Godot provides a mechanism to map files between the different languages you
provide for your game. The mapping function can be found under
Project/Project Settings/Localization/Remaps.

Use the `Add` button in the `Resources` part of the window, choosing the audio
file you wish to provide a translation for (e.g. `hello.ogg`). Once you've
added the file, highlight it, and use the `Add` button in the `Remaps by
Locale` section of the window. In the file browser that appears, find the
matching audio file in the new language (e.g. `hello_fr.ogg`). Next to this
file, use the `Locale` pulldown menu to tell Godot what language that file
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
"Dialog managers". Escoria supports custom dialog managers using
Godot addons and provides a very simple stock dialog manager to get users
started.

.. hint::

    More information about creating custom dialog managers can be
    found :doc:`in this document </advanced/create_dialog_manager>`




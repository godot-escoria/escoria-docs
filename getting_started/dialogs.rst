Writing Dialogs
================

Dialogs are an essential part of narrative games. Wether it's about world
building, fleshing out characters or presenting puzzles, dialogs are usually
found in every narrative game.

Escoria supports a feature rich dialog system integrated in the
:doc:`ESC language </scripting/z_esc_reference>`.

Dialog concept
~~~~~~~~~~~~~~

Dialogs in Escoria are based on two parts:

- The :doc:`say command </api/SayCommand>` to display text, show speech
  animations and play voice files for a character
- A dialog chooser that displays a list of options for the player to choose in
  a dialog.

A simple dialog
~~~~~~~~~~~~~~~

The following code shows a simple dialog:

.. code-block::

    #1
    :talk worker

    say player "Hello!"
    say worker "How can I help you?"

    #2
    ?
        #3
        - "I sell this fine leather jackets."
        
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

- The ESC event starts at #1. The player used the "talk" verb on the "worker"
  character. The dialog starts with two ``say`` commands that will display the
  specified text for the player and the worker respectively.
- At #2 the dialog chooser is introduced by a single "?" on a line.
- #3 and #4 show the different available options for the dialog. They both will
  be displayed on screen and the player can select from one of them.
  An option starts with a "-" and the text that should be displayed.
  Depending on the chosen option, the respective ``say`` commands are played,
  creating a complete dialog.
- The line at #5 concludes the dialog chooser. It is a single "!" on a line.

Conditional options
~~~~~~~~~~~~~~~~~~~

Like every command in ESC, conditions can also be added to dialog options to
only show them on specific conditions.

Conditions are a comma separated list enclosed in brackets after the option.

.. code-block::

    (...)
    ?

        - "Can you tell me where the train station is?" [!knows_way]

    (...)

In this example, the option will only be shown, if the global state "knows_way"
is either not set or false. The developer can set the state to true once the
player knows the way to the train station so they don't have to ask for it
anymore.

.. hint::

    See :doc:`the ESC reference </scripting/z_esc_reference#conditions>` for
    details about conditions.

Speech
~~~~~~

Escoria features voice support as well.

To use it, every line that should support a voice file as well, requires an
additional text key, like this:

.. code-block::

    say player WORKER_HELLO:"Hello!"

If Escoria encounters this line, it will look in a specific folder for a file
named like the key with a specific sound file extension like .ogg, .wav or
.mp3.

The folder and extension can be set using the
:doc:`Escoria settings </getting_started/z_escoria_settings>` "Speech folder"
and "Speech extension" in the "Sound" category.

Translation
~~~~~~~~~~~

The text key has another feature. If a game is produced for multiple languages,
the text key can be used for `Godot's built-in translation features`_.

Therefore a CSV file is required that uses the text key in the first column
followed by the different translations for each target language.

Dialog presentation
~~~~~~~~~~~~~~~~~~~

Displaying lines on screen or presenting options to the player is the task of
the "Dialog managers". Escoria supports implementing dialog managers using
Godot addons and provides a very simple stock dialog manager.

.. hint::

    More information about creating custom dialog managers can be
    found :doc:`in this document </advanced/create_dialog_manager>`


.. _`Godot's built-in translation features`: https://docs.godotengine.org/en/stable/tutorials/i18n/internationalizing_games.html

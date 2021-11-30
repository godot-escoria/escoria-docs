Handling audio
==============

No narrative game can exist without background music that creates the
appropriate atmosphere or sound effects that underline certain actions.
As well, speech is very often used to bring characters to life in such
games.

All of this is supported by Escoria.

.. note::

    Escoria supports all audio formats `officially supported by Godot`_

Playing music and sound effects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Escoria features three built-in audio players which are accessible by their
ESC global IDs:

- ``_music``: Used for looping background music
- ``_sound``: Used for playing sound files
- ``_speech``: Used for voice support

Playing audio is done by using the
:doc:`play_snd </api/PlaySndCommand>` ESC command. It expects the path to the
specific audio resource to be played and the global ID of the desired audio
player.

If the audio player is unspecified, it defaults to ``_sound``.

Examples
--------

- ``play_snd res://music/happy.ogg _music``

    Plays the background music ``res://music/happy.ogg``

- ``play_snd res://sound/door_open.wav``

    Plays the sound effect ``res://sound/door_open.wav``

.. note::

    Escoria takes care of the looping setting itself. Music is looped
    by default; sound effects are not.

You can stop the currently-playing audio using the
:doc:`stop_snd </api/StopSndCommand>` ESC command. It expects the global ID of
the audio player as its only argument.

If the audio player is not specified, ``_music`` is used as the default value.

Voice support
~~~~~~~~~~~~~

See the :doc:`documentation about dialogs </getting_started/dialogs>` for more
details on using voice files.

.. _`officially supported by Godot`: https://docs.godotengine.org/en/stable/getting_started/workflow/assets/importing_audio_samples.html

Handling audio
==============

No narrative game can exist without background music that sets the background
atmosphere or sound effects that underline certain actions or even speech
files that bring characters to life.

All of this is supported by Escoria.

.. note::

    Escoria supports all audio formats `officially supported by Godot`_

Playing music and sound effects
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Escoria features three built-in audio players, which are accessible by their
ESC global IDs:

- _music: Used for looping background music
- _sound: Used for playing sound files
- _speech: Used for voice support

Playing music and sound effects is done by using the
:doc:`play_snd </api/PlaySndCommand>` ESC command. It expects the path to the
sound effect or music ressource and the global id of the audio player.

If the audio is unspecified, it defaults to ``_sound``.

Examples
--------

- ``play_snd res://music/happy.ogg _music``

  Plays the background music ``res://music/happy.ogg``

-  ``play_snd res://sound/door_open.wav``

   Plays the sound effect ``res://sound/door_open.wav``

.. note:: 

    Escoria takes care about the looping setting itself. Music is looped
    by default, sound effects are not.

You can stop the currently playing sound using the
:doc:`stop_snd </api/StopSndCommand>` ESC command. It expects the global ID of
the sound player as the second argument.

If not specified, ``_music`` is used as a default value.

Voice support
~~~~~~~~~~~~~

See the :doc:`documentation about dialogs </getting_started/dialogs>` for more
details about using voice files.

.. _`officially supported by Godot`: https://docs.godotengine.org/en/stable/getting_started/workflow/assets/importing_audio_samples.html
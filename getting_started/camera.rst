The game camera
===============

Escoria uses an advanced camera system to allow different effects in a room.

It is possible to have rooms bigger than the selected display size, in which
the camera will pan to always keep track of the player character. Additionally,
you can use the camera for highlighting specific parts of the scene, zooming
in and out, and more.

Camera limits
~~~~~~~~~~~~~

Usually the camera follows the player character as the character moves through
the rooms. If the background is larger than the viewport, the camera will also
pan the room to keep track of the player character.

Sometimes this behaviour is not desired, though. Some rooms are designed so
that, at first, one part of the room is active and, later, another part of the
room becomes active. Elevators are a good example: The player character starts
at the ground floor, enters the elevator, and moves up. After the elevator
leaves the screen, the view switches to the first floor with the elevator
opening.

To support this, Escoria rooms use a "Camera Limits" parameter. This is a list
of rectangular limits that can be activated and deactivated using the ESC
command :doc:`camera_set_limits </api/CameraSetLimitsCommand>`  with the
index of the camera limits to set.

If no camera limits are set, the size of the background texture is used as the
default camera limit.

Camera control
~~~~~~~~~~~~~~

There are various ESC commands that can be used to control the camera to
achieve theatrical effects:

* :doc:`camera_push </api/CameraPushCommand>` push the camera to point at the
  given target
* :doc:`camera_set_pos </api/CameraSetPosCommand>` move the camera to the
  given position in a linear fashion
* :doc:`camera_set_target </api/CameraSetTargetCommand>` set the target that
  the camera should follow
* :doc:`camera_set_zoom </api/CameraSetZoomCommand>` zoom the camera by the
  specified magnitude
* :doc:`camera_set_zoom_height </api/CameraSetZoomHeightCommand>` zoom the
  camera to achieve a certain pixel height
* :doc:`camera_shift </api/CameraShiftCommand>` shift the camera to the
  given location

All commands support a ``speed`` parameter that defines in seconds how long
the camera animation should take to reach the target.

Targets
~~~~~~~

Commands that support a ``target`` object allow the following target types:

* An ``ESCItem`` that has set the parameter ``camera_node`` to a node whose
  position should be used to position the camera
* If the parameter is not set, the position of the ``ESCItem`` is used instead

Additionally, the API commands used for the ESC commands support these two
additional targets:

* ``Vector2D``: The target is a position described by the given vector
* An array of ``Vector2D`` objects: The target is the average of all items of
  the array

Follow targets are only nodes that have been set to be "movable".

Transitions
~~~~~~~~~~~

Some commands support transtions. These can make use of different types of
animation interpolations.

The transitions that are supported are the names of the values used in the
``TransitionType`` enum of the `Tween type`_.

When specifying the ``TransitionType``, leave off the ``TRANS_`` prefix for
any such parameters.

:: _`Tween type` https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

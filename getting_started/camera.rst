The game camera
===============

Escoria uses an advanced camera system to allow different effects in a room.

It is possible to have rooms bigger than the selected display size, in which
the camera will pan to always keep track of the player character. Additionally,
you can use the camera for highlighting specific parts of the scene, zooming
in and out and more.

Camera limits
~~~~~~~~~~~~~

Usually the camera follows the player character as it moves through the rooms.
If the background is larger than the screen size, the camera will also pan
the room to keep track of the player character.

Sometimes, this is not desired, though. Some rooms are designed so that first
one part of the room is active and later another part of the room. Elevators
are a good example. The player character starts at the ground floor, enters
the elevator and moves up. After the elevator left the screen, the view
switches to the first floor with the elevator opening.

To support this, Escoria rooms use a "Camera Limits" parameter. This is a list
of rectangular limits that can be activated and deactivated using the ESC
command :doc:`camera_set_limits </api/CameraSetLimitsCommand>`  with the
index of the camera limits to set.

If no limits are set, the size of the background texture is used as a default
camera limit.

Camera control
~~~~~~~~~~~~~~

There are various ESC commands that can be used to control the camera to
achieve theatrical effects:

* :doc:`camera_push </api/CameraPushCommand>` push the camera to point to the
  given target
* :doc:`camera_set_pos </api/CameraSetPosCommand>` move the camera to the
  given position in a linear fashion
* :doc:`camera_set_target </api/CameraSetTargetCommand>` set the camera target
  to follow
* :doc:`camera_set_zoom </api/CameraSetZoomCommand>` zoom the camera by a
  magnitude
* :doc:`camera_set_zoom_height </api/CameraSetZoomHeightCommand>` zoom the
  camera to achieve a certain pixel height

All commands support a ``speed`` parameter that defines how long the camera
animation should take to reach the target in seconds.

Targets
~~~~~~~

Commands that support a ``target`` object, allow the following target types:

* An ESCItem that has set the parameter ``camera_node`` to a node whose
  position should be used to position the camera
* If the parameter is not set, the position of the ESCItem is used instead

Additionally, the API commands used for the ESC commands support these two
additional targets:

* Vector2D: The target is directly a position described by the given vector
* An array of Vector2D types: The target is the average of all items of the
  array

Follow targets are only nodes, that are movable.

Transitions
~~~~~~~~~~~

Some commands support transtions. These allow for different types of animation
interpolations.

The transitions, that are supported are the names of the values used in the
TransitionType enum of the `Tween type`_.

For simplicity, the ``TRANS_`` prefix is removed in the transition parameters.

:: _`Tween type` https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

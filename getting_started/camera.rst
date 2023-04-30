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
that, at first, one part of the room is available to the player and later,
another part of the room becomes available.
Elevators are a good example: The player character starts
at the ground floor, enters the elevator, and moves up. After the elevator
leaves the screen, the view switches to the first floor with the elevator
opening.

To support limiting the parts of the room the player can see, Escoria rooms use
"Camera Limits". The limits are a list of
rectangles which define the boundaries that the camera is allowed to move
within. The rectangle is defined using a top-left coordinate limit for the
camera's movement, along with an accompanying width and height.
The array of limits is found under the `Camera limits` parameter within the
room's `ESCroom` node.

The active limit rectangle for the camera can be changed during gameplay using
the ESC command :doc:`camera_set_limits </api/CameraSetLimitsCommand>` with the
index of the camera limit to enforce.

If no camera limits are set, the size of the background texture is used as the
default camera limit.

As only one limit is active at a time, limits can overlap. This means, for
example, that if you had a large room with a locked door in the middle, you
could have the initial limit as one half of the room, and the second limit -
for when the door is unlocked - overlapping it as the whole room.

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

.. hint::

   Some camera commands may not work as expected if you have camera limits
   defined. Ensure that the position the camera is told to point at is
   within the room's active camera limit. e.g. If you were making a game in
   320 x 200 resolution, and your room limits were [100,100,1000,1000], the
   top left coordinate the camera could reach would be [420,300], while the
   bottom right coordinate it could reach would be [680,800].

.. hint::

   The coordinates passed in camera script commands refer to where the centre of
   the camera will point.

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

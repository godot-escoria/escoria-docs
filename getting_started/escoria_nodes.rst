Common Escoria Nodes
====================

To make games in Escoria, it's handy to understand the relationship between
Godot's scenes and nodes. These are [documented here](https://docs.godotengine.org/en/stable/getting_started/step_by_step/nodes_and_scenes.html).

Every location the game character can go to in the game will be its own Godot
scene, and each of these scenes is referred to as an Escoria **room**.
An Escoria **room** might be a bedroom or bathroom, but might also be the
roadway on a bridge or a forest clearing. All of the objects in the room
are Godot nodes.

There are several different types of Godot nodes. Their names and a brief
overview of their uses are detailed below. For further information on each
configurable parameter for each node, what it is and what it is used for,
see the associated API page.

.. hint::

    Where an API page says `Extends: <sometype>`, this means that the
    particular Escoria node has inherited all the features of the node type
    "sometype" and builds on them. Any additional features it has will be
    described in the "Property Description" of the node on the API page.)

    For example, ``ESCRoom extends Node2D``. This means it has all of Node2D's
    features, like a "position" and a "scale". The API page also tells you
    in its "Property Description" that it has (among other things) an
    associated "player_scene" and "camera_limits" which can be configured.

    This is known as "inheritance" to developers.

Most node types referenced in the API are intended to be used internally by
Escoria. The ones of most use to game makers are:

`ESCRoom`_
~~~~~~~~~~

An `ESCRoom`_ is the root node of your room scene. This is responsible for
telling Escoria which character you'll control in the room, the script to use
to configure the room before use, and the area of the room the camera is
allowed to see.

.. _`ESCRoom`: /api/supporting_classes/ESCRoom.html

`ESCItem`_
~~~~~~~~~~

An `ESCItem`_ is an object that the player can interact with in some way: a
window or a phone, for example. You associate an ASHES script with the item
to tell Escoria what to do when the player interacts with the object (what
happens when they "look at" or "use" the object, for example).

An `ESCItem`_ is accessible in ASHES scripts by the name provided in the
`Global ID` field. This name should be unique to your whole game.

You will typically assign a few child nodes to each ESCItem:

* ``Sprite`` / ``Animated Sprite`` : This is an image of the object that will be
  displayed on the screen for the player.
* ``CollisionPolygon2D`` : This is a shape that tells Escoria when the mouse is
  over the object. Set this up to cover the ``Sprite``.
* ``ESCLocation`` : If you make an ``ESCLocation`` the child of an ``ESCItem``,
  whenever you interact with the item the character will automatically walk to this
  position to perform the interaction. As an example, place an ``ESCLocation``
  underneath a "window" `ESCItem`_ and the player will walk to the window
  when you "look" at it.

.. note::

  There are different subtypes of ``ESCLocation``, including ``ESCInteractionLocation``.
  Either should be fine for the purpose describved above.

.. _`ESCItem`: /api/supporting_classes/ESCItem.html

`ESCBackground`_
~~~~~~~~~~~~~~~~

This is the background image for your room. Any `ESCItem`_ **will be drawn over the
top of this**. Assign the background image for the room to the `ESCBackground`_
"texture".

.. _`ESCBackground`: /api/supporting_classes/ESCBackground.html

`ESCTerrain`_
~~~~~~~~~~~~~

An `ESCTerrain`_ tells Escoria where in the scene the character is allowed to
walk. When clicking within the game window, the character will automatically
walk to the clicked spot (or as close to it as it can) while staying
within the terrain.

The game allows for multiple terrains to be configured, but only one can be
active at a time. A good use for multiple terrains would be a hallway with a
closed door in the middle: The initial terrain would cover the floor on the
side of the hallway where the player currently stands up to the doorway. This
would allow the player to walk up to the door, but not pass through or
beyond it.

A second terrain would include the area covered by the inital terrain, as well
as the floor through the doorway and the far side of the hallway.

In the script attached to the door `ESCItem`_, when the player
opens the door, you would disable the first terrain and enable the
second, allowing the game character to walk through the entire
hallway.

Terrains contain a ``NavigationPolygon`` node under a ``NavigationRegion2D`` node
and are referenced in code by their name rather than a `Global ID`.

.. _`ESCTerrain`: /api/supporting_classes/ESCTerrain.html

`ESCLocation`_
~~~~~~~~~~~~~~

An `ESCLocation`_ is a location within your game that the character will walk to
under certain conditions.

* You may use a scripted ``walk`` command to force the character to walk to a
  certain location. This is handy for cutscenes as part of telling your game's
  story.
* If the `ESCLocation`_ is a child of an `ESCItem`_, the character will
  automatically walk to the location when you interact with the item.
* If you call an `ESCLocation`_ ``"player_start"``, Escoria will automatically place
  the player there when it loads a room (unless otherwise instructed by the
  script attached to the `ESCRoom`_).

.. note::

  There are two subtypes of `ESCLocation`_: ``ESCDialogLocation`` and ``ESCInteractionLocation``.
  You are not required to use the subtypes, however, so `ESCLocation`_ can be used
  if it helps avoid potential confusion.

.. _`ESCLocation`: /api/supporting_classes/ESCLocation.html

`ESCExit`_
~~~~~~~~~~

An "exit" to your room (i.e. the method by which your player moves from one
`ESCRoom`_ to the next) can be made by enabling the ``Is Exit`` option on an
`ESCItem`_. This, however, requires an associated script to be created and
attached telling Escoria how to interact with the `ESCItem`_ (exit).

For an exit that is just an exit and doesn't require any scripting, use an
`ESCExit`_. All that it requires to be configured to make it work are the
``target_scene`` to change to and, optionally, a ``switch sound`` (the sound to
play when changing rooms).

.. _`ESCExit`: /api/supporting_classes/ESCExit.html

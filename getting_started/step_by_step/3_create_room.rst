Create a room
=============

A room, in Escoria terminology, is an environment where the player moves around
without changing the point of view or the background. You can think of it as
a "shot" in filmmaking.

In the **rooms** folder, create a new folder to contain the files of the
room scene we'll now create: Let's call it "pub".

.. image:: img/create_room_pub.png
   :alt: The file explorer with a newly created folder pub.

Create a new scene and set ``ESCRoom`` as its root node. Save the scene as
"pub.tscn".

* Note that you could call the scene something other than "park.tscn" -
  "room1.tscn" for example. Make sure you name things in a way that makes sense
  to your game.

.. image:: img/create_room_rootnode.png
   :alt: A new scene with ESCRoom as the root node

Like the character, the room also requires a ``global id``, so set the
parameter **Global id** to "pub".

We want to play as Graham in this scene, so select it as the
``player scene`` parameter:

.. image:: img/create_room_playerscene.png
   :alt: The player scene parameter of the room with the graham scene
     selected.

Adding a background to the room
-------------------------------

Now, our room requires an ``ESCBackground`` node. This node is required in
order to capture input events for the background of the room. It can also
display a background image. Add it as a child of the root node.

Currently, the background node is empty. From ``backgrounds.zip``, copy the
file "pub_bg.png" to the **rooms** directory and set it as the ``texture``
parameter in the ``ESCBackground`` node.

This will additionally set the dimensions of the ``ESCBackground`` node to the
size of the image.

.. hint::

    Backgrounds in Escoria can also be bigger than the game display size.
    Escoria will take care of moving the camera around when the character
    reaches the border of the screen.

.. image:: img/create_room_background.png
   :alt: The complete setup with the background

Setting walkable areas for the character
----------------------------------------

Usually, characters aren't allowed to move freely around in the whole room.
There may be walls and other obstacles blocking their paths.

To set the areas in which characters can walk in a room, add an ``ESCTerrain``
node to the ``ESCRoom`` node; it will manage the walkable areas as well as
other functionality such as light and scale mapping.

To setup a walkable area, add a new ``NavigationPolygonInstance`` node to the
new ``ESCTerrain`` node:

.. image:: img/create_room_terrain.png
   :alt: The ESCTerrain and NavigationPolyInstance nodes in the scene tree

Then create a new ``NavPoly`` resource for the Navpoly
parameter in the Inspector panel.

.. image:: img/create_room_terrain_navpoly.png
   :alt: Adding a NavPoly

Use the editor window to draw a polygon. This polygon is the area in which the
character can move around freely.

.. warning::

   Remember that Escoria is using the character's base position when checking
   the walkable areas, so watch out that navigating through the room doesn't
   bring the character too close to the walls, or else it will be drawn overtop
   of the walls.

.. image:: img/create_room_terrain_createdpoly.png
   :alt: View of the completed polygon on the background

.. note::

   Escoria supports having multiple walkable areas (represented by multiple
   ``NavigationPolygonInstance`` instances). These can be switched by an ESC
   command in the game. This is useful for things like blocked passages which
   can be unblocked by pressing a button in the game.

.. hint:: **Light mapping**

   Rooms in adventure games sometimes don't have one fixed global light, but
   instead feature things like lamp shades and darker (or lighter) areas.

   This can be achieved in Escoria by setting up a light map in the
   ``ESCTerrain`` node.

   The light map is a simple texture in which colors are mapped to the
   character's colors as it walks around in the room.

.. hint:: **Scale mapping**

   If the background of the room is a three-dimensional image and the upper
   part of the image appears to be further away, scale mapping is
   used to create a three-dimensional effect when the character moves from the
   top to the bottom of the screen by making it smaller when it's
   on the top of the screen and bigger when it reaches the bottom of the
   screen.

   This is achieved in Escoria by using a grayscale texture. A darker part of
   the texture is considered to be further away from the viewer and a lighter
   part is considered to be more in front of the viewer.

   To fine tune the scaling of the character, use the ``Scale min`` and
   ``Scale max`` parameters of the ``ESCTerrain`` node. The character is
   only scaled between the numbers given in ``Scale min`` and ``Scale max``,
   with 0 meaning the character is scaled down to non-existence and 1
   representing the actual size of the character.

    .. note::

        The scaling can also be bigger than 1, which can result in scaling
        artifacts.

For simplicity's sake, we won't set up a complex scale map right now, but as
the character is currently smaller than it should be when displayed in the
room, let's set ``Scale min`` and ``Scale max`` to 2 so that the character
sprite will be shown at twice its size.

Setting camera limits
---------------------

As was mentioned before, the background can be much bigger than the screen
size, and in this example it really is. The background texture is 3976x956
pixels big!

However, using "Camera limits", we can tell Escoria that it can pan over the
complete background using the game camera.

Select the ``ESCRoom`` node and set the first entry of the
``Camera limits`` parameter to 0, 0, 3975, 956:

.. image:: img/create_room_cameralimits.png
   :alt: The "camera limits" parameter set to x: 0, y: 0, w: 3975, h: 956


Setting a starting location
---------------------------

We have to tell Escoria where our character should start in the new scene.

For pointing out specific locations, we can use the ``ESCLocation`` node type.

Add one and rename it to "start", so we know what this location represents.

.. image:: img/create_room_start.png
   :alt: The node start was added to the scene tree

.. hint::

    It is generally recommended, to give nodes a meaningful name. Especially
    with bigger, complex rooms, this provides to be very helpful.

In its parameters, set the ``global id`` and select the ``Is start location``
checkbox parameter.

.. image:: img/create_room_startparams.png
   :alt: Visualization of the set parameters

That's about it for the setup. Now
:doc:`let's try out our new game for the first time <4_first_run>`.

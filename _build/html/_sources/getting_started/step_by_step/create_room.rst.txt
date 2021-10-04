.. Create a room

Create a room
=============

A room, in Escoria terminology, is an environment where the player evolves without changing the point of view or the background. You can think of it as a "shot" in filmmaking.

Create a ``rooms`` folder which will contain the rooms. This is not mandatory but you'll want to build a coherent folder structure for your project if it grows bigger and bigger with time. In this folder, create a new folder to contain the files of the room scene we'll now create: let's call it ``room01``.

First, you can download `these assets we will use in this guide
<assets/2d_-_backgrounds_-_random_town_locations.zip>`__.

Root node: ESCRoom
------------------

You can now create your first room scene. Create a new Godot scene and set its root node type as ``ESCRoom``.

.. image:: img/create_room_01.png
    :align: center
    :alt: Scene tree at room creation


Don't forget to set a ``global_id`` in the node parameters visible in the Inspector. This is the unique name of your room, which allows Escoria to remember the last room the player was in.
 
ESCBackground
-------------

Now, our room requires an ``ESCBackground`` node. This node is mandatory to capture input events on the background of the room. It can also display a background image, as ``ESCBackground`` extends ``TextureRect``.

Add one as child to the root node.

.. image:: img/create_room_02.png
    :align: center
    :alt: Scene tree at ESCBackground node add

Currently, the node displays no background. In the Inspector panel, set a background texture.


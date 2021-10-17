Adding items
============

So far so good, but walking around in a room is pretty boring, right?

Also, if you move the character to the right side of the room, it walks
over the barrels in the background.

Let's fix that.

Adding an activity
------------------



Making the player walk behind items
-----------------------------------

To add such an obstacle, add a new node to the ``ESCRoom`` node and select
``ESCItem`` as the node type. Add a ``TextureRect`` node to
this new item and set the texture of the obstacle you want to display.

The "Z-Index" parameter of the ``ESCItem`` node is used to determine at which
point the character moves behind or in front of the node. For
this it is connected to the position on the y axis of the character.

For example, if the "Z-Index" parameter is set to 50 and the character is on a
higher position on the screen, its y position will be
lower than 50 and it will be displayed behind the object, if it is on a lower
position on the screen, its y position will be larger than
50 and it will be displayed in front of the object.

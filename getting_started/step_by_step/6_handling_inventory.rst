Handling an inventory
=====================

Most adventure games feature inventory puzzles. Things you pick up, combine
with other things and use them in the game. Especially classic adventure games
used the inventory extensively.

Escoria has features for handling inventory items as well, of course. Let's
embed them for our sample game.

The autoregister path
---------------------

Inventory items are movable. They don't (usually) stick just to one specific
room. This poses a problem for Escoria, because when rooms are changed,
the previous room is removed from Godot's scene tree, together will items
in there.

To workaround this, inventory items must be placed in a special path, where
Escoria can find them again. This path is called the "autoregister path" and
in the game template it defaults to "items".

.. hint::

    You can change it to point somewhere else in
    :doc:`Escoria's settings <../z_escoria_settings>`

Creating an inventory item
--------------------------

Inventory items are also simple ``ESCItem`` s that you know from the previous
chapter.

Start by copying over the ``mug.png`` file to the items directory.

Then, create a new scene and select ``ESCItem`` as the root node. Rename it
to "Beer", set "beer" as its global id and add a ``TextureRect`` node with the
mug picture. Also, add a ``CollisionShape2D`` node to define the interactivity
area like before.

Finally, create a new ESC script called beer.esc and place it in the items
folder as well. Leave it empty for now.

Copy the path to the script and put it in the "ESC script" parameter.

.. image:: img/inventory_mug.png
   :alt: An image of the settings described above

.. hint::

    The parameter "Inventory texture" will automatically be set to the
    texture set in the ``TextureRect`` node. If you want the item to look
    differently when it's in the inventory, you can simply change this
    parameter to use a different texture.

Save the scene as "beer.tscn" in the items folder.

Using the item in the room
--------------------------

To use the item in the pub scene, we can use Godot's "instantiate scene"
feature. Select the ``ESCRoom`` node and click on the "instantiate scene"
button:

.. image:: img/inventory_instantiate.png
   :alt: The button for instantiating a scene, looking like a chain link

Then select the beer item scene.

.. image:: img/inventory_beer.png
   :alt: Searching for "beer" in the scene selection to find the item scene

Now you can place the mug in the scene.

Picking up the mug
------------------

To let Graham pick up the muck, we'll have to create a new event in our
ESC script called "pickup", because that is the verb we'll be using.

To add a new item to the inventory, the command ``inventory_add`` is used.

It expects the global id of the item to add as its only parameter.

Additionally, we need to hide the mug from the scene. We can use the command
``set_active`` for that. Inactive items are not visible in a scene.

To put it all together, this is the code you should add to the ESC file:

.. code-block::

    :pickup

    inventory_add beer
    set_active beer false

Try it out. Graham should now be able to pick up the mug.

Using the mug
-------------

Usually, items are not only picked up, but also used with different items
either in the inventory or in a particular room.

This is also done using events in the ESC script. Apart from the event name
":use", the target object is also specified.

Let's let Graham react to using the mug with the blackboard. For this we
need to make the beer combineable with other things when it is used from the
inventory and react to it in the ESC script of the blackboard.

So go into the beer item scene again and select the property "Use from
inventory only". This will restrict using the beer from the inventory only, so
the beer mug will not listen to the "use" action anymore.

Additionally, add an item to "Combine If Action Used Among" and set it to
"use". This is required to tell Escoria, that if the verb "use" is used on
the beer mug, another object will be required:

.. image:: img/inventory_use.png
   :alt: The display of the previously described options.

Save the scene and add the following code to the "blackboard.esc" file:

.. code-block::

    :use beer

    say graham "Why should I throw it at the blackboard? I'm not angry!"

Try it out!

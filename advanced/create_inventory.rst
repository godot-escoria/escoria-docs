.. _create_inventory:

Creating an inventory
=====================

The inventory scene is responsible of displaying all items in the player's
inventory, allowing them to perform actions on them. These actions can be 
simple (look, open, close...) or more complex, such as combining them with
another inventory item or also a room item.

Escoria allows you to setup and display the player inventory with great 
flexibility. Therefore, you may build your inventory scene in freedom, 
define the way it shows up and hides (possibly with an animation), etc.

Build the scene
---------------

You may construct the inventory scene so it looks exactly the way you want it.
In this matter, you may use all Godot nodes at your disposal to achieve your
goal freely. It can feature images, sprites, areas, controls that you can 
script using GDScript at your needs.

For example, you may want to display your inventory at all time in a given area
of the screen, or define a clickable button to show it, or hot focus areas 
waiting for the mouse pointer to trigger the inventory. If it is hidden by 
default, you can either pop it on the screen, or define hide and show animations.
This is totally at your hand to be done fully with Godot features.

Escoria is designed to be no barrier - it only requires 2 specific nodes to be
present in the inventory scene tree. These 2 nodes are described in the section
below.

Necessary Escoria nodes
~~~~~~~~~~~~~~~~~~~~~~~

The inventory scene is a special Escoria scene that involves two nodes in 
particular: 

- ``ESCInventory``: this is the root node of the inventory scene. It inherits 
  ``Control`` to allow user inputs (using mouse, keyword or game controller),
  and its role is mainly to act as a Facade to inventory, allowing the 
  addition and removal of items in its defined container.
  
  .. note::

    Note: you may use your own custom script extending ``ESCInventory`` if you 
    need to add more functions to this node.

- ``ESCInventoryContainer``: this is the container node that will display the 
  items present in the inventory. This node has to be  manually created, as it 
  needs to be any of Godot's ``Control/Container/*`` nodes (``HBoxContainer``, 
  ``VBoxContainer``, ``GridContainer``...), and the 
  ``res://addons/escoria-core/ui_library/inventory/esc_inventory_container.gd``
  script attached to it afterwards.

  .. note::
    
    Unfortunately Godot doesn't allow adding an ``ESCInventoryContainer`` 
    node to the scene and changing its type to any of Godot ``Control/Container/*``
    while keeping its attached script. We will provide a simplified way to insert 
    this node to your scene, asking you to choose its actual type.

This is an example of an inventory scene fully composed (part of the simple-mouse
plugin):

..  image:: img/inventory_scene_tree_example.png
    :width: 100%
    :alt: Inventory scene tree example from Escoria simple-mouse plugin

After the ``ESCInventoryContainer`` node is added to the scene, it needs to be 
targeted by the ``ESCInventory`` node. To do so, select the ``ESCInventory`` node,
then in the inspector, select the target ``ESCInventoryContainer`` as Inventory UI
parameter.

..  image:: img/inventory_inspector_example.png
    :width: 100%
    :alt: Inventory scene inspector example from Escoria simple-mouse plugin

The scene can then be saved, either in a plugin or in a new ``res://*/`` folder, 
at your preference.

Inserting/Removing items to/from inventory
------------------------------------------

``ESCItem`` define usable and pickable items. You may select an inventory texture
in the Inspector, that will be used when the item is added to the inventory.

Adding and removing an item to/from the inventory can be performed in two ways:

- in an ASHES script using ``inventory_add`` and ``inventory_remove`` functions. 
  Both functions take the ``global_id`` of the item as parameter.

- in GDScript, using the ``escoria.inventory_manager.add_item(item_id: String)`` 
  and ``escoria.inventory_manager.remove_item(item_id: String)`` functions.
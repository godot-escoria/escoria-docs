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
    this node to your scene, asking you to choose its actual type


- ``ESCInventoryItem``: 

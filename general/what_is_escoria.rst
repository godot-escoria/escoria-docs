.. What is Escoria

What is Escoria?
================

Escoria is a framework made for and with `Godot Engine 
<https://godotengine.org>`__ allowing you to create point and click adventure 
games. 

It provides you various special nodes and features to help you focus on creating
your rooms, items, characters, and puzzles. It will take care of all the common 
tasks that all adventure games need to have: character movements, transitions 
between rooms, items relations, etc. All you'll have to do is create all these 
elements for your game, and script the interactions.

It does not require you to be a Godot Engine specialist: you only need to know 
the basics of Godot scenes and resources.

Base concepts
-------------

Escoria comes with many features designed for point and click adventure games 
development. For this purpose, some concepts need to be clearly defined in order
to create your game scenes.

Rooms
~~~~~

A room is a specific scene defining an environment for the player to walk in. It
is composed of one mandatory elements:

- an ESCRoom root node,
- a background: defines both the background texture and the area that can grab 
  player inputs. 

And some facultative elements:

- a walkable area (called "terrain"): defines the area where the player (if any)
  an walk in,
- items (interactive or not),
- specific location points of the space
- other visible elements in the room that are not managed by Escoria: simple 
  sprites, particles, etc.

Items
~~~~~

Items are central in Escoria. They are multi-purpose, as they can be different
things. All these purposes were merged as one node as they share many details in 
common.

- an interactive item, that can react to scripted actions. It can be part of the 
  background (not pickable) or a pickable item that goes to the inventory.
- an "exit" that triggers rooms transitions,
- a invisible trigger zone that activates a scripted event if an object or the 
  player collides with it,

NPCs (Non Playable Characters) are also considered as items in Escoria. Nothing 
forbids you to create a game where the player can have a discussion with a 
table, a button on the wall or a rock on the floor.

Items can also be defined as "movable", which allow them to move around the room
using defined animations. 

If an item is pickable, it must be associated with another specific scene for it
to be displayed in the inventory. 


Player
~~~~~~

The player is the scene that is controlled by Escoria to perform the actions 
corresponding to the user inputs: walk to a destination and perform events on 
items. This also includes base animations defined for the character for idling, 
walking and talking, and other specific animations as well.

It is not mandatory to define a player scene, if your game is a HOPA (Hidden 
Object Puzzle Adventure) or a Myst-like game. In this kinds of games, the world 
is displayed in the eyes of the protagonist, so there is no player to walk to 
the clicked item's location. In this case, events are immediately started after
user input.

Inventory and inventory items
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Escoria manages the inventory for the game developer. This includes items that
are added or removed to the inventory, and events actions happening on inventory
items (look and use items for example).

Of course, the way the inventory is displayed to the player in terms of UI is 
the game developer's burden. Escoria only provides some base scenes for 
inventory and inventory items, but the way these are displayed it not managed by
Escoria. This way, the game developer has a total control on the inventory.



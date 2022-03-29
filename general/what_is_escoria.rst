What is Escoria?
================

Escoria is a framework made for and with `Godot Engine`_ allowing for the
creation of 3rd person point and click adventure games.

It provides various special nodes and features to help developres focus on
creating rooms, items, characters, and puzzles. It takes care of all the
common tasks that all adventure games need to have: character movements,
transitions between rooms, item relationships, etc. All that is left to do
for a developer is to create all these elements for the game and script
their interactions.

It does not require deep Godot Engine knowledge, only the basics of Godot
scenes and resources.

History
-------

This framework was initially developed in 2016 for the point and click
adventure game `The Interactive Adventures of Dog Mendonça and Pizzaboy`_ and
later streamlined for broader usage and open sourced as promised to the backers
of the Kickstarter campaign.

Because of maintainability issues, to make the framework easier for new
developers, and bring it closer to Godot's standards, the framework was
completely rewritten and optimized in 2020.

Contributors
------------

## Authors

In alphabetical order:

* ArturM
* Sylvain Beucler - beuc
* Fleskevor
* Ariel Manzur - punto (original author)
* Julian Murgia - @StraToN
* Dennis Ploeger - @dploeger
* Markus Törnqvist - mjtorn

Licensing
---------

Like Godot, the Escoria framework is licensed under the MIT license.
See the LICENSE file in any of the Escoria repositories for details.

Logo
----

Escoria Logo created by Livio Fania (https://liviofania.com/)
Licence: CC-BY

Base concepts
-------------

Escoria comes with many features designed for point and click adventure game
development. For this purpose, some concepts need to be clearly defined in
order to create game scenes.

Rooms
~~~~~

A room is a specific scene defining an environment for the player to walk in.
It is composed of these mandatory elements:

- an ``ESCRoom`` root node
- an ``ESCBackground`` that defines both the background texture and the area
  that reacts to player inputs

Additionally, some facultative elements can be added:

- a walkable area (called "terrain"): Defines the area where the player
  (if any) an walk in
- items (interactive or not)
- specific location points in the space
- other visible elements in the room that are not managed by Escoria: Simple
  sprites, particles, etc.

Items
~~~~~

Items are central in Escoria. They are multi-purpose as they can be different
things. All these purposes are combined into one node type as they share many
details in common:

- an interactive item that can react to scripted actions: It can be part of
  the background (not pickable) or a pickable item that goes into the inventory
- an "exit" that triggers rooms transitions
- an invisible trigger zone that activates a scripted event if an object or the
  player collides with it

NPCs (Non Playable Characters) are also considered as items in Escoria.
Nothing forbids you from creating a game where the player can have a discussion
with a table, a button on the wall, or a rock on the floor.

Items can also be defined as "movable", which allows them to move around the
room using defined animations.

If an item is pickable, it must be associated with another specific Godot scene
for it to be displayed in the inventory.


Player
~~~~~~

The player is the scene that is controlled by Escoria to perform the actions
corresponding to the user inputs, e.g. walking to a destination and performing
actions on items. This scene also includes base animations defined for the
character for idling, walking and talking, and other specific animations.

It is not mandatory to define a player scene if your game is a HOPA (Hidden
Object Puzzle Adventure) or a Myst-like game. In these kinds of games, the
world is displayed in the eyes of the protagonist, so there is no player to
walk to the clicked item's location. In this case, events are immediately
started after being triggered by user input.

Inventory and inventory items
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Escoria manages the inventory for the game developer. This includes items that
are added or removed to the inventory and events and actions happening on
inventory items ("look" and "use" items for example).

Of course, the way the inventory is displayed to the player in terms of UI is
the game developer's responsibility. Escoria only provides some base scenes for
inventory and inventory items, but the way these are displayed is not managed
by Escoria. This way, the game developer has total control over the inventory.

.. _`Godot Engine`: https://godotengine.org
.. _`The Interactive Adventures of Dog Mendonça and Pizzaboy`: https://store.steampowered.com/app/330420


ESC Scripts
~~~~~~~~~~~

Escoria uses scripts (a set of Escoria commands that include such actions as
moving an object to a certain location, or playing a sound) to determine the
behavior of the game world and the objects within it. ESC scripts:

* are plain text files
* can be created in any text editor (including the Godot script editor)
* have the file extension ".esc"
* can be stored in any location within your game's filesystem structure

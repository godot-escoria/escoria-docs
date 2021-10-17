Create a player character
=========================

Escoria is a framework optimized for 3rd person point and click adventure
games. These type of games usually feature an animated character that can walk
across a background graphic and operate with items.

A character in Escoria is based on the node type :doc:`/api/ESCPlayer`.

Create a new folder in the **characters** folder for the new character. We will
call our character "Graham".

.. image:: img/character_create_folder.png
   :alt: A view of the folders with a folder created for the new character

Inside the folder, create a new scene and select ``ESCPlayer`` as the root node
type.

.. image:: img/character_create_scene.png
   :alt: The new character scene with an ESCPlayer root node

When we get to making your game more interactive later using the built-in
ESC Scripting language, we need a way of identifying different items and the
character. ESC uses :dfn:`global ids` for this. The global id for the character
can be set with the parameter **Global id** in the inspector panel:

.. image:: img/character_globalid.png
   :alt: The parameter global_id set to "graham"

Adding a walkcycle
------------------

When a character is moved across the screen, usually an animation is played to
mimic the character walking. This is called a "walkcycle".

Escoria can additionally play different animations based on where the character
is moving to. For example it would play a forward walkcycle if the character
moves from the bottom to the top of the screen and a right walkcycle if it
walks from to the left to right side.

Start by copying the spritesheet images into the character folder.

.. hint::

   Spritesheets combine multiple images of a sprite into one big image and
   are a very efficient way of using images in a game engine.


Then add a new ``AnimatedSprite`` node to the ``ESCPlayer`` node.

Add new Animationframes and fill these animations from the spritesheet:

.. image:: img/character_create_animations.png
   :alt: The required animations in the frames configuration.

* back
* backright
* front
* frontleft
* left
* idleback
* idlebackright
* idlefront
* idlefrontleft
* idleleft

Refer to this `AnimatedSprite tutorial in the Godot docs`_ on how to do that.

Telling Escoria about the walkcycle
-----------------------------------

Now that the basic animations exist, we need to tell Escoria when to play
which animation.

To achieve that, create a new ``ESCAnimationResource`` in the ``ESCPlayer``
node's ``animations`` parameter:

.. image:: img/character_create_animations_resource.png
   :alt: Creating a new ESCAnimationResource

Click on the new resource to reveal the relevant settings:

.. image:: img/character_create_animation_settings.png
   :alt: The different animation settings

Escoria does not limit the developer how many walkcycle directions a character
has. It can be 4 (left, right, front, back), 8 (with diagonal directions)
or even more.

To achieve this degree of freedom, Escoria needs to know what directions are
available. It does that by defining angle ranges in a 360° circle.

.. image:: img/angles_visualization.png
   :alt: A visual representation of a circle around the character with angles
     around it

The angle 0° would show the character facing up, 90° right and so forth.

As the possible directions aren't restricted to specific points, a range in
the circle is defined for one side. In the visualization, the green range
would be around 340° and 40° wide, so it will go from 340° to 20°.

Our character supports 8 directions, so we set up the ``Dir angles`` parameter
like this:

Click on it and set the size to 8. For each slot, add an
``ESCDirectionAngle`` resource.

.. image:: img/character_create_animation_dirangles.png
   :alt: Setting the Dir angles array

Click on each resource and set them to the following:

* 0:

  * Angle Start: 340
  * Angle Size: 40

* 1:

  * Angle Start: 20
  * Angle Size: 50

* 2:

  * Angle Start: 70
  * Angle Size: 40

* 3:

  * Angle Start: 110
  * Angle Size: 50

* 4:

  * Angle Start: 160
  * Angle Size: 40

* 5:

  * Angle Start: 200
  * Angle Size: 50

* 6:

  * Angle Start: 250
  * Angle Size: 40

* 7:

  * Angle Start: 290
  * Angle Size: 50

This will define 40° ranges for the upper, left, right and back animations and
50° ranges for the diagonal directions, which will result in a very smooth
animation.

.. warning::

   Make sure that you always define the complete 360° circle with the direction
   angles!


Now that we have defined where we want Escoria to play character animations
we just need to connect the individual animations with the direction angles.

The additional parameters of the ``ESCAnimationResource`` now define the
specific views for the character for each direction angle.

* ``Directions``: Walk animation
* ``Idle``: Idle animations
* ``Speak``: Speaking animations

.. hint::

   The ``Speak`` animations are only required if the game needs a speak
   animation at all.

For each direction angle, the name of the animation to play and wether that
animation should be played mirrored have to be set up.

So these are the settings for the ``Directions`` parameter:

.. image:: img/character_create_animation_directions.png
   :alt: The settings required for the Direction parameter

Try to set up the ``Directions`` and ``Idle`` animations by yourself.

.. hint::

   If you ever get stuck in designing your game, why not check out
   the community on our `Discord`_ server? We're always happy to help.

   .. image:: https://img.shields.io/discord/884336424780984330.svg?label=Join%20our%20Discord&logo=Discord&colorB=7289da&style=for-the-badge
      :alt: Join our Discord
      :target: https://discord.com/invite/jMxJjuBY5Z

That concludes creating a player character. Let's
:doc:`create a room <3_create_room>`.

.. _AnimatedSprite tutorial in the Godot docs: https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html
.. _Discord: https://discordapp.com

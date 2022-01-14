Handling backgrounds
====================

Backgrounds are the building block art assets for each room in an adventure
scene. They give depth and set the mood.

Escoria supports multiple features for background.

The main node type for backgrounds is ``ESCBackground``, additionally certain
features of ``ESCTerrain`` add more feature to the background.

Backgrounds can come in all sizes. They may have the exact size as the screen,
they may be smaller or even bigger. Escoria uses its
:doc:`Camera features </getting_started/camera>` to handle backgrounds of all
sizes. Camera limits define how the camera follows the player and pans
it over the background. The developer can enable and disable camera limits
in the game to temporarily hide and show parts of the scene.

Parallax backgrounds
--------------------

Parallax layering is a technique used to add depth to a two dimensional
graphic by moving different layers at diffferent speed when then camera
pans over them.

Godot has that functionality built-in in the `ParallaxBackground`_ and
`ParallaxLayer`_ node types.

`This tutorial`_ shows their basic functionality. Basically, after adding
both a ``ParralaxBackground`` and at least one ``ParallaxLayer`` node to the
scene, the ``ParallaxLayer``'s parameter ``motion_scale`` specifies how
fast the movement of the additional layer in contrast to the static
background will be moved.

Additionally, the ``layer`` parameter of the ``ParallaxBackground`` should be
set to 0 to allow the character moving behind the layer.

Scaling
-------

Another addition to the Parallax technique to add depth to a two dimensional
scene is to change the size of the player character as it walks from
front to the back of the scene.

In Escoria, this is achieved using the different parameters of the
``ESCTerrain`` node in the scene.

The ``scales`` parameter uses a texture. Darker areas of the texture result
in a smaller sprite, lighter areas scale the sprite up. ``scale_min`` and
``scale_max`` limit the scaling.

Lighting
--------

Another feature to make rooms more lively is to give them dynamic lighting,
so that certain parts of the screen tint the character sprite to make it
react to different light sources in the show picture.

The parameter ``lightmap`` expects a texture that is laid over the scene
and tints the character according to the position of the character in the
scene.

The parameter ``lightmap_modulate`` can be used to additionally tint
the ``lightmap`` texture.

.. _`ParallaxBackground`: https://docs.godotengine.org/en/stable/classes/class_parallaxbackground.html
.. _`ParallaxLayer`: https://docs.godotengine.org/en/stable/classes/class_parallaxlayer.html
.. _`This tutorial`: https://www.youtube.com/watch?v=f8z4x6R7OSM

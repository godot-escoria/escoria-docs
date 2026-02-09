.. _custom_ashes_commands:

Creating custom ASHES commands
==============================

Escoria is designed to abstract and streamline the most basic (and common)
features for game developers and at the same time give them a lot of freedom
so they can design the game they have in mind.

"**ASHES**" (formerly "**ESC**") is the domain specific language (DSL) used by Escoria
to make very basic features of narrative and point and click games as easy as
possible.

(For those interested, an overview of ASHES and its design can be found in
`the GitHub repository`_).

There are `a lot of commands`_ already included in Escoria core. If the game
developer requires more commands for their specific game, it is very easy to
create new commands with just a bit of `GDScript`_ knowledge.

What is an ASHES command?
-------------------------

ASHES commands consist of two things: a name and a group of zero or more
parameters.

The following example shows the ``say`` command which requires two parameters:

+--------+----------------+---------------+
| say    | ($player     , | "Hello!")     |
+--------+----------------+---------------+
| <name> | <parameter 1>  | <parameter 2> |
+--------+----------------+---------------+

**<name>** only allows the following characters:

* Lowercase characters a-z
* Numbers from 0-9
* Underscores _

Commands are called like you would a function in Python or GDScript; that is,
you call the function by its name and pass in arguments inside of a set of
parentheses, e.g. ``say($player, "Hello!")``

When compiling an ASHES script, Escoria checks each command to see if it matches
a defined set of parameters and also if the parameters have the right data
type(s).

Additionally, a command can include a function which can test the given
parameters for validity in depth.

How are ASHES commands integrated?
----------------------------------

When the ASHES compiler encounters a line that it identifies as an ASHES command
in an ASHES script, it searches for a GDScript file with the same name as the
command in a list of directories (according to the
`Project setting`_ "Command directories" in the main category).

It will load the first file it finds and validate the given parameters. If
everything works out fine, the command is added to the event and executed by
the event manager later.

How is an ASHES command structured?
-----------------------------------

Let's look at the source code of the command ``camera_set_limits``. It can be
found in the directory ``addons/escoria_core/game/core-scripts/esc/commands``, a
directory included in the "Command directories" setting by default. The file
name is "camera_set_limits.gd"

.. code-block:: python

  ## `camera_set_limits(camlimits_id: Integer)`
  ##
  ## Limits the current camera's movement to a limit defined in the `ESCRoom`'s
  ## definition. A limit is defined as an upper-left (x, y) coordinate, a width
  ## and a height that the camera must stay within. Multiple limits can be
  ## defined for a room, allowing for new areas to be seen once they have
  ## been 'unlocked'.[br]
  ##[br]
  ## **Parameters**[br]
  ##[br]
  ## - *camlimits_id*: Index of the camera limit defined in the `camera limits`
  ##   list of the current `ESCRoom`[br]
  ##[br]
  ## For more details see: https://docs.escoria-framework.org/camera
  ##
  ## @ASHES
  ## @COMMAND
  extends ESCCameraBaseCommand
  class_name CameraSetLimitsCommand


  ## The descriptor of the arguments of this command.[br]
  ## [br]
  ## #### Parameters[br]
  ## [br]
  ## None.
  ## [br]
  ## #### Returns[br]
  ## [br]
  ## Returns the descriptor of the arguments of this command. The argument descriptor for this command. (`ESCCommandArgumentDescriptor`)
  func configure() -> ESCCommandArgumentDescriptor:
    return ESCCommandArgumentDescriptor.new(
      1,
      [TYPE_INT],
      [null]
    )


  ## Validates whether the given arguments match the command descriptor.[br]
  ## [br]
  ## #### Parameters[br]
  ## [br]
  ## | Name | Type | Description | Required? |[br]
  ## |:-----|:-----|:------------|:----------|[br]
  ## |arguments|`Array`|The arguments to validate.|yes|[br]
  ## [br]
  ## #### Returns[br]
  ## [br]
  ## Returns True if the arguments are valid, false otherwise. (`bool`)
  func validate(arguments: Array):
    if not super.validate(arguments):
      return false

    if escoria.main.current_scene.camera_limits.size() < arguments[0]:
      raise_error(self, "Invalid limits id. Camera limit id (%d) is larger than the number of limits defined in this scene (%d)."
          % [
            arguments[0],
            escoria.main.current_scene.camera_limits.size()
          ]
        )
      return false

    return true


  ## Runs the command.[br]
  ## [br]
  ## #### Parameters[br]
  ## [br]
  ## | Name | Type | Description | Required? |[br]
  ## |:-----|:-----|:------------|:----------|[br]
  ## |command_params|`Array`|The parameters for the command.|yes|[br]
  ## [br]
  ## #### Returns[br]
  ## [br]
  ## Returns the execution result code. (`int`)
  func run(command_params: Array) -> int:
    var camera: ESCCamera = escoria.object_manager.get_object(escoria.object_manager.CAMERA).node as ESCCamera
    camera.clamp_to_viewport_limits()
    escoria.main.set_camera_limits(command_params[0])

    return ESCExecution.RC_OK


  ## Function called when the command is interrupted.[br]
  ## [br]
  ## #### Parameters[br]
  ## [br]
  ## None.
  ## [br]
  ## #### Returns[br]
  ## [br]
  ## Returns nothing.
  func interrupt():
    escoria.logger.debug(
      self,
      "[%s] interrupt() function not implemented." % get_command_name()
    )


Documentation
~~~~~~~~~~~~~

The command starts with a documentation block which is used to create the API
documentation for the command. The ``@ASHES`` and ``@COMMAND`` tags are used
to build up the ASHES reference.

It is recommended that all custom ASHES commands include a similar documentation
section.

.. note::

   The double hashmarks indicate to Godot 4 that the comments that follow the
   hashmarks can be used by `Godot 4's docgen facilities`_ to create autodocs.
   Escoria also recognizes basic Markdown used in comments, but does use
   `[br]` to render proper line breaks.

Class definition
~~~~~~~~~~~~~~~~

Every ASHES command must extend the class ``ESCBaseCommand`` (or a class that
already extends ``ESCBaseCommand``) and include a ``class_name`` statement.
The class name is a PascalCase variant of the comamnd name with an additional
"Command" suffix. So the file `my_custom.gd` would have a class name of
"MyCustomCommand".

Configuration function
~~~~~~~~~~~~~~~~~~~~~~

The function ``configure`` is used by the ASHES compiler to return an
``ESCCommandArgumentDescriptor`` instance which describes the command
structure. The parameters to the ``ESCCommandArgumentDescriptor`` constructor
are:

- The number of mandatory parameters
- A list of the types of all possible parameters. The
  data types correspond to the `GDScript enum Variant.Type`_
- A list of default values for each parameter. Mandatory parameters should use
  ``null`` as the default value.

Validation function
~~~~~~~~~~~~~~~~~~~

The function ``validate`` is called by the event manager prior to running the
command. It can check the given parameters and validate them against the
current state of the game (e.g. registered objects, active/inactive state,
etc.)

In the example, the command checks if the given camera limits ID is valid. It
should run the validate function from ``ESCBaseCommand``, which will validate
the parameters according to the ``ESCCommandArgumentDescriptor`` returned by
the ``configure`` function.

The ``run`` function
~~~~~~~~~~~~~~~~~~~~

Finally, the ``run`` function is executed by the event manager when the
command is successfully validated. The function should return an
:doc:`ESCExecution value </api/supporting_classes/ESCExecution>`, which
informs the event manager whether the command was run successfully.

The ``interrupt`` function
~~~~~~~~~~~~~~~~~~~~~~~~~~

This function is implemented if the command is interrupted and needs
specialized handling past the base implementation in ``ESCBaseCommand``.

An example custom command
-------------------------

Bringing the different parts together, below is a complete example of a custom
command which the developer can place in a custom directory. The custom
directory should then be added to the list of "Command directories".

.. code-block:: python

    ## `my_custom(object)`
    ##
    ## Runs a custom command on the given object.
    ##
    ## @ASHES
    ## @COMMAND
    extends ESCBaseCommand
    class_name MyCustomCommand

    ## The descriptor of the arguments of this command.[br]
    ## [br]
    ## #### Parameters[br]
    ## [br]
    ## None.
    ## [br]
    ## #### Returns[br]
    ## [br]
    ## Returns the descriptor of the arguments of this command. The argument descriptor for this command. (`ESCCommandArgumentDescriptor`)
    func configure() -> ESCCommandArgumentDescriptor:
        return ESCCommandArgumentDescriptor.new(
            1,
            [TYPE_STRING],
            [null]
        )


    ## Validates whether the given arguments match the command descriptor.[br]
    ## [br]
    ## #### Parameters[br]
    ## [br]
    ## | Name | Type | Description | Required? |[br]
    ## |:-----|:-----|:------------|:----------|[br]
    ## |arguments|`Array`|The arguments to validate.|yes|[br]
    ## [br]
    ## #### Returns[br]
    ## [br]
    ## Returns True if the arguments are valid, false otherwise. (`bool`)
    func validate(arguments: Array):
        if not escoria.object_manager.has(arguments[0]):
            escoria.logger.report_errors(
                "my_custom: invalid object",
                ["Object %s not registered" % arguments[0]]
            )
            return false

        return .validate(arguments)


    ## Runs the command.[br]
    ## [br]
    ## #### Parameters[br]
    ## [br]
    ## | Name | Type | Description | Required? |[br]
    ## |:-----|:-----|:------------|:----------|[br]
    ## |command_params|`Array`|The parameters for the command.|yes|[br]
    ## [br]
    ## #### Returns[br]
    ## [br]
    ## Returns the execution result code. (`int`)
    func run(command_params: Array) -> int:
        # Do something with the object
        return ESCExecution.RC_OK

Using Escoria classes
---------------------

Please refer to the API documentation on how to use the specific classes provided
by Escoria. The classes are usually available in the
:doc:`Escoria main singleton </api/supporting_classes/escoria>`.
(e.g. ``escoria.object_manager`` to access the
:doc:`ESCObjectManager </api/managers/ESCObjectManager>`)

.. _`GDScript`: https://docs.godotengine.org/en/3.5/getting_started/scripting/gdscript/gdscript_basics.html
.. _`GDScript enum Variant.Type`: https://docs.godotengine.org/en/3.5/classes/class_@globalscope.html#enumerations
.. _`the GitHub repository`: https://github.com/godot-escoria/escoria-demo-game/tree/main/addons/escoria-core/game/core-scripts/esc
.. _`a lot of commands`: /scripting/z_ashes_reference.html#commands
.. _`Project setting`: /getting_started/z_escoria_settings.html#main
.. _`Godot 4's docgen facilities`: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html

.. _custom_esc_commands:

Creating custom ESC commands
============================

Escoria is designed to abstract and streamline the most basic features for
game developers and at the same time give them a lot of freedom so they can
design the game they have in mind.

ESC is the domain specific language (DSL) used by Escoria to make very basic
features of narrative and point and click games as easy as possible.

There are
:doc:`a lot of commands </getting_started/esc_reference.html#commands>` already
included in Escoria core. If the game developer requires more commands for
their specific game, it is very easy to create new commands with just a bit
of `GDScript`_ knowledge.

What is an ESC command?
-----------------------

ESC commands consist of two things: a name and a group of one or more
parameters.

    say     player        "Hello!"
    <name>  <parameter 1> <parameter 2> <...>

*name* only allows the following characters:

* Lowercase characters a-z
* Numbers from 0-9
* Underscore _

The parameters are separated from the *name* and other parameters by
whitespace.

If a parameter is surrounded by quotation marks, the parameter may include
whitespace as well:

    say player Hello!

    (2 parameters)

    say player "Hello! How are you doing?"

    (2 parameters)

    say player Hello how are you doing?

    (6 parameters)

When compiling an ESC script, Escoria checks each command to see if it matches
a defined set of parameters and also if the parameters have the right data
type.

Additionally, a command can include a function which can test the given
parameters for validity in depth.

How are ESC commands integrated?
--------------------------------

When the ESC compiler encounters a line that it identifies as an ESC command in
an ESC script, it searches for a GDScript file with the same name as the
command in a list of directories (according to the
::doc:`Project setting </getting_started/escoria_settings.html#main>`
"Command directories" in the main category).

It will load the first file it finds and validate the given parameters. If
everything works out fine, the command is added to the event and executed by
the event manager later.

How is an ESC command structured?
---------------------------------

Let's look at the source code of the command `camera_set_limits`. It can be
found in the directory `addons/escoria_core/game/core-scripts/esc/commands`, a
directory included in the "Command directories" setting by default. The file
name is "camera_set_limits.gd"

.. code-block:: python

    # `camera_set_limits camlimits_id`
    #
    # Sets the camera limits to the one defined under `camlimits_id` in
    # ESCRoom's camera_limits array.
    # - camlimits_id: int: id of the camera limits to apply (defined in
    # ESCRoom's camera_limits array)
    #
    # @ESC
    extends ESCBaseCommand
    class_name CameraSetLimitsCommand


    # Return the descriptor of the arguments of this command
    func configure() -> ESCCommandArgumentDescriptor:
        return ESCCommandArgumentDescriptor.new(
            1,
            [TYPE_INT],
            [null]
        )


    # Validate wether the given arguments match the command descriptor
    func validate(arguments: Array):
        if not escoria.main.current_scene.camera_limits.size() < arguments[0]:
            escoria.logger.report_errors(
                "camera_set_limits: invalid limits id",
                [
                    "Limit id %d is bigger than limits array size %d" % [
                        arguments[0],
                        escoria.main.current_scene.camera_limits.size()
                    ]
                ]
            )
            return false

        return .validate(arguments)


    # Run the command
    func run(command_params: Array) -> int:
        escoria.main.set_camera_limits(command_params[0])
        return ESCExecution.RC_OK

Documentation
~~~~~~~~~~~~~

The command starts with a documentation block which is used to create the API
documentation for the command. The "@ESC" tag is used to build up the ESC
reference.
It is recommended that all custom ESC commands include a similar documentation
section.

Class definition
~~~~~~~~~~~~~~~~

Every ESC command has to extend the class ``ESCBaseCommand`` and include a
``class_name`` statement. The class name is a PascalCase variant of the comamnd
name with an additional "Command" suffix. So the file `my_custom.gd` would have
a class name of "MyCustomCommand".

Configuration function
~~~~~~~~~~~~~~~~~~~~~~

The function ``configure`` is used by the ESC compiler to return an
``ESCCommandArgumentDescriptor`` instance which describes the command
structure. The parameters to the ``ESCCommandArgumentDescriptor`` constructor
are:

- The number of mandatory parameters
- A list of the types of all possible parameters. If the command is called with
  more parameters, the data type of the last element of the list is used. The
  data types
  correspond to the `GDScript enum Variant.Type`_
- A list of default values for each parameter. Mandatory parameters should use
  `null`` as the default value.

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

The run function
~~~~~~~~~~~~~~~~

Finally, the ``run`` function is executed by the event manager when the
command is successfully validated. The function should return an
:doc:`ESCExecution value </api/ESCExecution>`, which informs the event manager
whether the command was run successfully.

An example custom command
-------------------------

Bringing the different parts together, below is a complete example of a custom
command which the developer can place in a custom directory. The custom
directory should then be added to the list of "Command directories".

.. code-block:: python

    # `my_custom object`
    #
    # Runs a custom command on the given object.
    #
    # @ESC
    extends ESCBaseCommand
    class_name MyCustomCommand

    # Return the descriptor of the arguments of this command
    func configure() -> ESCCommandArgumentDescriptor:
        return ESCCommandArgumentDescriptor.new(
            1,
            [TYPE_STRING],
            [null]
        )


    # Validate wether the given arguments match the command descriptor
    func validate(arguments: Array):
        if not escoria.object_manager.has(arguments[0]):
            escoria.logger.report_errors(
                "my_custom: invalid object",
                ["Object %s not registered" % arguments[0]]
            )
            return false

        return .validate(arguments)


    # Run the command
    func run(command_params: Array) -> int:
        # Do something with the object
        return ESCExecution.RC_OK

Using Escoria classes
---------------------

Please refer to the API documentation on how to use the specific classes used
by Escoria. The classes are usually available in the
:doc:`Escoria main singleton </api/escoria>`.
(e.g. ``escoria.object_manager`` to access the
:doc:`ESCObjectManager </api/ESCObjectManager>`)

.. _`GDScript`: https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_basics.html
.. _`GDScript enum Variant.Type`: https://docs.godotengine.org/en/stable/classes/class_@globalscope.html#enumerations

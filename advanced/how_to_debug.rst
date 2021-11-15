.. _how_to_debug:

How to debug
============

Console and debugger
--------------------

When game made with Escoria needs testing, some errors and warnings may appear
in the console. These information can be very useful to debug the issue.

If Escoria encounters an error or a crash, it will stop the execution of the
game and return to the editor, showing you the line that broke. Usually, this
line will be located in Escoria's logger class, as this class is in charge of
showing the errors before stopping the execution.

Godot also shows the debugger panel, but it is advised to check the output log
first.

.. image:: img/crash-error-console.png
    :align: center
    :alt: Crash error: console

The console shows many lines, depending on the log level defined in Project
Settings (from finest to highest-level: TRACE, DEBUG, INFO, WARNING, ERROR).

In the example above, the error is explained in the line starting with ``(E)``
("E" for "Error", "D" for "Debug", "I" for "Info", "T" for "Trace"). The reason
of this error is that Escoria attempted to load an inexisting file. The (E)rror
line provides the path to the file that was expected. At this point, fixing the
issue is easy: either create the missing file, or remove the references to this
inexisting file in the scenes that use it.

This example is straightforward, of course. Sometimes, the issue can be
trickier. In this case, the Debugger panel will be of use.

.. image:: img/crash-error-debugger.png
    :align: center
    :alt: Crash error: debugger panel

We will not cover the use of the debugger panel in this documentation
(information can be found on the official `Debugger panel documentation
page`_). The Stack Frames can be used to go back to the line that initiated the
crash.

Escoria data
------------

Finding the current state of the data held by Escoria during the execution of
the game or at the moment of a crash is often necessary. This data can be
easily accessed, which can be helpful to understand why the game does not react
the way it is supposed to.

Find current Escoria data during the game execution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

While the game is running, switch to the Godot Engine editor. In the "Scene"
tab, the "Remote" button reveals the actual state of the scene tree in the game
currently being executed. The ``escoria`` object is located under the root
node, where it can be selected.

.. image:: img/remote-scene-tree.png
    :align: center
    :alt: Crash error: escoria object in debugger panel

Find current Escoria data when a crash occurs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In case of crash, the ``escoria`` object can easily be accessed in the
bottom-right corner section of the debugger panel, by clicking the ``escoria``
variable in the "Globals" section (framed in yellow in the following
screenshot):

.. image:: img/crash-error-debugger-escoria.png
    :align: center
    :alt: Crash error: escoria object in debugger panel

Access managers from the Escoria object
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When the ``escoria`` object is selected in the Remote scene tree or in the
debugger panel, its content is displayed in the Inspector:

.. image:: img/crash-escoria-inspector.png
    :align: center
    :alt: Crash error: Escoria object in inspector

Each manager object can be accessed by clicking the "Object ID" button next to
its label. As an example, here is the result for the Objects manager:

.. image:: img/crash-objects-manager-inspector.png
    :align: center
    :alt: Crash error: Objects Manager in inspector

From there, every object can be accessed and checked. Same for Globals Manager:

.. image:: img/crash-globals-manager-inspector.png
    :align: center
    :alt: Crash error: Globals manager in inspector

.. _Debugger panel documentation page: http://www.python.org/
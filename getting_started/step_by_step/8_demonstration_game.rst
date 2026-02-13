
Demonstration game
==================

The demonstration game provides examples to help you understand some how to
implement some common adventure game concepts with Escoria. Have a look through
the implementation of the rooms using the Godot editor and how their Escoria
scripts work. The rooms show examples of the following:

+------+----------------------------------------------------------------------------+
| Room | Demonstration topics                                                       |
+======+============================================================================+
| 1    | - Automatic, interruptable player movement at room first entering          |
|      | - ``say`` command - both with speech above the character and speech boxes  |
|      | - Text translation                                                         |
|      | - Recorded (audio) speech                                                  |
|      | - Trigger zone                                                             |
+------+----------------------------------------------------------------------------+
| 2    | - Navmeshes - Changing where the player is allowed to walk                 |
|      | - Simple interaction with an ESCItem                                       |
+------+----------------------------------------------------------------------------+
| 3    | - Different interactions with a single ESCItem                             |
+------+----------------------------------------------------------------------------+
| 4    | - Height maps to scale player height                                       |
|      | - Colour maps to change player shading (shadows / turning on lights)       |
+------+----------------------------------------------------------------------------+
| 5    | - Inventory objects: picking up; using them for puzzles                    |
+------+----------------------------------------------------------------------------+
| 6    | - Inventory objects: combining them to solve puzzles                       |
|      | - Non-player-characters (NPCs)                                             |
+------+----------------------------------------------------------------------------+
| 7    | - Camera: limits                                                           |
|      | - Camera commands (push/shift/zoom/set-pos)                                |
|      | - Trigger zones of different kinds (in, out)                               |
|      | - Calling functions in GDscript from ASHES script                          |
+------+----------------------------------------------------------------------------+
| 8    | - Instancing a Godot scene puzzle not involving Escoria                    |
|      | - Calling functions in GDscript from ASHES script and changing game        |
|      |   state                                                                    |
+------+----------------------------------------------------------------------------+
| 9    | - Dynamic puzzles                                                          |
|      | - Complex rooms with game states that are restored when you return to      |
|      |   the room                                                                 |
+------+----------------------------------------------------------------------------+
| 10   | - Playing sounds and music                                                 |
|      | - Cutscenes (making things happen while stopping player input)             |
|      | - Forcing characters to move / change direction                            |
+------+----------------------------------------------------------------------------+
| 11   | - Flags on ``ESCItem`` events                                              |
|      | - Running a manual tranisition when you leave a room                       |
+------+----------------------------------------------------------------------------+
| 12   | - Transition types                                                         |
|      | - Running a manual transition when you enter a room                        |
+------+----------------------------------------------------------------------------+
| 13   | - Rooms without a visible character (Myst / Riven style games)             |
+------+----------------------------------------------------------------------------+
| 14   | - Transitions to menus                                                     |
|      | - Multiple NPC in the room moving on room entering                         |
+------+----------------------------------------------------------------------------+
| 15   | - Changing character costumes                                              |
|      | - Long character speech test (checks that dialogs don't display out of     |
|      |   the screen when it's close to the border)                                |
|      | - Missing ``player_start`` ``ESCItem`` demonstration                       |
+------+----------------------------------------------------------------------------+
| 16   | - Escoria variables in logic checks                                        |
|      |   (``ESC_CURRENT_SCENE``, ``ESC_LAST_SCENE``)                              |
+------+----------------------------------------------------------------------------+
| 17   | - Empty scene with 2 exits (ready to implement a new test)                 |
+------+----------------------------------------------------------------------------+
| 18   | - Superimposed items, undiscovering the one underneath (test for hover     |
|      |   stack): Forces using each item, one after the other.                     |
+------+----------------------------------------------------------------------------+
| 19   | - Superimposed items, but all are initially visible (test for hover        |
|      |   stack). Allows using all items in preferred order.                       |
+------+----------------------------------------------------------------------------+
| 20   | - Parallax on wide rooms                                                   |
+------+----------------------------------------------------------------------------+

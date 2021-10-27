Create an Escoria project
=========================

Escoria's main design is centred around its core addon, which supports the
developer with very basic functionality and features to make developing games
as easy and streamlined as possible.

At the same time, Escoria tries to give a lot of freedom to the developer in
regard to the design of the game and its interface.

Because of this, neither a specific user interface nor a dialog manager is
included into Escoria core for example and can either be installed as
additional addons from the Godot Asset Library or completely done from scratch
for the specific game you're making.

To make starting with Escoria as easy as possible, we provide a Godot Game
Template and stock user interfaces and dialog managers to get you up and
running in no time.

Starting a new Escoria project
------------------------------

Open the Godot project manager, switch to the **Templates** tab and search for
the Escoria game template:

.. image:: img/create_project_search_template.png
   :alt: Searching for Escoria in the template library

Select the template to view more details:

.. image:: img/create_project_template.png
   :alt: Details from the Escoria game template

Click on **Download** to download the fresh template, then click **Install**.

.. image:: img/create_project_downloaded.png
   :alt: "Installing the gamte template"

Enter the project name and the folder for your new game.
Click **Install & Edit**.

.. image:: img/create_project_install.png
   :alt: Creating a new game from the template

The editor will open your new game.

.. warning::
    After the editor loaded the game for the first time, you may need to
    quit to the project manager and reopen the game
    to let Escoria initialize properly.

Adding a stock UI
-----------------

For simplicity sake in this guide, we will add one of the available stock
UIs that Escoria provides. You probably want to
use one of them as a starting point for
:doc:`your own game UI </advanced/create_ui>`.

The stock UIs are distributed as Godot addons. Switch to the asset lib and
search for "escoria*ui" to find all currently available stock UIs.

.. image:: img/create_project_uis.png
   :alt: Available Escoria UIs

Select one UI to view the details.

.. image:: img/create_project_ui_details.png
   :alt: The details of the simplemouse ui addon.

Click on **Download**.

.. image:: img/create_project_ui_downloaded.png
   :alt: The UI addon was downloaded and is ready to install.

Click **Install**. The relevant files should be selected already.

.. image:: img/create_project_ui_install.png
   :alt: View of the files to install.

Open your project settings and switch to the **Addons** tab to enable the UI
addon.

.. image:: img/create_project_ui_enable.png
   :alt: A view of the project settings with the addons tab selected
         and a marker on the enable checkbox.


Adding a stock dialog manager
-----------------------------

Usually, a game made with Escoria uses the ``say`` command or dialogs as a
narrative element. While the basic dialog handling and the ``say`` command is
included in the core, a user interface that *displays* the lines isn't.

Again, for simplicity sake in this guide, we will add the available stock
dialog manager that Escoria provides. You probably want to use it as a starting
point for :doc:`your own dialog manager </advanced/create_dialog_manager>`.

Like the stock UIs, the dialog manager is distributed as a Godot addon. Switch
back to the asset lib and search for "escoria*dialog" to find all currently
available stock dialog managers.

.. image:: img/create_project_dialogs.png
   :alt: Available Escoria UIs

Select one UI to view the details.

.. image:: img/create_project_dialogs_details.png
   :alt: The details of the simplemouse ui addon.

Click on **Download**.

.. image:: img/create_project_dialogs_downloaded.png
   :alt: The UI addon was downloaded and is ready to install.

Click **Install**. The relevant files should be selected already.

.. image:: img/create_project_dialogs_install.png
   :alt: View of the files to install.

Open your project settings and switch to the **Addons** tab to enable the
dialog manager.

.. image:: img/create_project_dialogs_enable.png
   :alt: A view of the project settings with the addons tab selected
         and a marker on the enable checkbox.

Switch to the project settings and go to "Escoria/UI" to set the default
dialog type parameter. The dialog type is the way a line is displayed to the
player. The stock dialog manager supports the following types:

* floating: The text is shown above the player sprite
* avatar: The text is shown in a box with the player avatar next to it

If the type isn't specificed in the ``say`` command, the default type is used.

Let's set it to "floating".

.. image:: img/create_project_dialogs_settings.png
   :alt: Set project settings with "Escoria/UI/Default Dialog Type" set to
         "floating"

Basic configuration
-------------------

In the general project settings, set the resolution of your game in the
Setting **Display/Window**. The Godot default is 1024x600. The included
backgrounds have a height of 956 pixels. For this guide, setup an HD resolution
of 1920x1080 pixels.

Continuing
----------

After this basic setup, let's
:doc:`create a character <2_create_player_character>`.

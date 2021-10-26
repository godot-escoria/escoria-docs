.. _how_to_contribute:

How to contribute to Escoria
============================

Thanks a lot for thinking about contributing to the Escoria project! Please read the guidelines outlined in this document on how to most efficiently add your contribution to the project to make it better.

How do you want to contribute?


- `I have a question about how to make a game using Escoria <#questions>`_
- `Something doesn't work as documented or intended <#bugs>`_
- `I want to do something with Escoria, that isn't possible right now <#feature-requests>`_


Questions
---------

Of course! We'll help you to answer your question as best as possible. Our community uses Discord to communicate and collaborate.

Please simply join our server and state your question in our support channel:

.. image:: https://img.shields.io/discord/884336424780984330.svg?label=Join%20our%20Discord&logo=Discord&colorB=7289da&style=for-the-badge
   :target: https://discord.com/invite/jMxJjuBY5Z


Bugs
----

Oh no! Sorry about that. We guess you encountered a bug. Please file an issue in the `Escoria issue tracker <https://github.com/godot-escoria/escoria-issues/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc>`_.

`I can also send code changes that will fix the bug. <https://github.com/godot-escoria/.github/blob/main/contributions>`_

Feature requests
----------------

Sure. We're always open to new ideas. Please make sure you talked to our community in the Discord support channel first. Maybe somebody else already thought about the same thing and found a solution!

.. image:: https://img.shields.io/discord/884336424780984330.svg?label=Join%20our%20Discord&logo=Discord&colorB=7289da&style=for-the-badge
   :target: https://discord.com/invite/jMxJjuBY5Z

If not, please add a new feature request in the `Escoria issue tracker <https://github.com/godot-escoria/escoria-issues/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc>`_.

Please note, that we're developing Escoria in our free time and can't always implement new features as fast as we would like to. We will usually add a version to your feature request stating when the feature possibly will be added to Escoria. This, however, might change, so don't bet on it.

`I can also send code changes that will implement the new feature. <https://github.com/godot-escoria/.github/blob/main/contributions>`_

Contributions
-------------

That's *awesome*. Thanks a lot. Let's talk about how we implement code in Escoria.

We implement all new code in our demo game. That's our testing ground, if you will. Clone the `demo game's git repository <https://github.com/godot-escoria/escoria-demo-game>`_. Checkout the ``develop`` branch and then create a new branch named "issue-your issue number". (e.g. issue-42)

If you like to submit code for fixing a bug, please recreate the bug in the demo game. If you want to implement a new feature, create a demo for the new feature in the game.

Afterwards, add the required code to fix the bug or implement the feature.

When committing in git, please make sure to format your commit message according to the `semantic-release <https://github.com/semantic-release/semantic-release>`_ standard.

When you're ready, please interactively rebase your branch and remove all non-essential commits from your changes. See `this article <https://dev.to/blakedeboer/beginners-guide-to-interactive-rebasing-1ob>`_ for informations about interactively rebasing.

Afterwards open a pull request on the demo game repository against the ``develop`` branch. Maybe we will kindly ask you to add more changes or otherwise communicate about your changes. Please use the PR ui to answer those questions and resolve the conversations once you have implemented the requested change.

Again, thanks a lot for your contributions. ❤️ 🎁
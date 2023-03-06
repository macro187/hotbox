hotbox
======

My workstation containers, setup automation, and configuration



Setup Automation
================

These work on Linux-ish machines, virtual machines, and containers.


hotbox-setup
------------

Run all setup scripts


hotbox-setup-git
----------------

TODO


hotbox-setup-shell
------------------

TODO


hotbox-setup-shell
------------------

TODO



Workstation Containers
======================

Workstation containers are equipped with:

- Minimal command line tools (including Vim, Git, etc.)
- Host Docker socket so Docker works
- Host X11 socket so X11 applications work
- Host `$TERM` setting
- Non-root user matching the current host user
- Host user's `.git-credentials`
- The *hotbox* tools
- Configured using `hotbox-setup`


Host Setup
----------

Basic setup:

    hotbox-setup

Allow apps in containers to access the host X server.  This can be done manually
each session or prepended to `.xinitrc` (or whatever).

    xhost +

Install Docker.


hotbox-build <distro>
---------------------

TODO


hotbox-run <distro>
-------------------

TODO


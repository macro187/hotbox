hotbox
======

My workstation containers, setup scripts, and config files



Setup Scripts
=============

These set up various aspects of workstations (physical, virtual, or container)
according to my preferences.


hotbox-setup
------------

Run all available setup scripts


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

Workstation container implementations are available based on the following
Linux distros:

- Alpine Linux
- Ubuntu Linux

Containers are equipped with:

- Host Docker socket so Docker works
- Host X11 socket so X11 applications work
- Host `$TERM` setting
- Non-root user matching the current host user
- `doas` with passwordless root permission
- `man` and man pages
- The *hotbox* tools
- Preconfigured using the `hotbox-setup` scripts
- Basic command line tools including `git`, `vim`, etc.
- Host user's `.git-credentials`


Host Requirements
-----------------

Docker.

If X applications are to be run in containers, they must be allowed access to
the host X server.  This can be done manually each session or prepended to
`.xinitrc` (or whatever):

    xhost +


hotbox-build [DISTRO...]
------------------------

Build workstation container images based on the specified DISTROs.

If no DISTROs are specified, build for all available distros.


hotbox-run DISTRO
-----------------

Start and enter a workstation container based on the specified DISTRO.


hotbox-clean
------------

Delete all hotbox container images

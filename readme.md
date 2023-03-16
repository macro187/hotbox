hotbox
======

My workstation containers, setup scripts, and config files



Features
========

Features are scripts that set up various aspects of machines (physical, virtual,
or container), sometimes according to my personal preferences.

They are written in portable posix shell, with specifics for the following Linux
distributions:

- Alpine Linux
- Ubuntu Linux



Containers
==========

Hotbox can build and run containers configured using *Features*.  These
containers are equipped with:

- The *hotbox* tools
- Configured using hotbox feature scripts
- Basic command line tools including `git`, `vim`, etc.
- `man` and man pages
- An unpriviledged user matching the host user's name, uid, and gid
- The host user's `.git-credentials`
- `doas` with passwordless root permission for the host user
- The host Docker socket so Docker works
- The host X11 socket so X11 applications work
- The host `$TERM` setting
- The host startup directory mounted under `/workspace`


Host Machine Requirements
-------------------------

Docker.

If X applications are to be run in containers, they must be allowed access to
the host X server.  This can be done manually each session or prepended to
`.xinitrc` (or whatever):

    xhost +


hotbox-build [SPEC]
-------------------

Build a workstation container image from the specified *SPEC*.



hotbox-run IMAGE
----------------

Enter a workstation container.

There can multiple workstation container instances running at the same time,
distinguishable by name.  The `HOTBOX_NAME` environment variable specifies the
name of the container to start or join (from outside a hotbox container) or
indicates the current container's name (from inside a hotbox container).  The
default container is named `default`.

If the named container is not already running, start it from the specified IMAGE
(prefixed with `hotbox-`) and then enter it in a login shell.

If the named container is already running, enter it in a new login shell.


hotbox-clean
------------

Delete all hotbox container images



License
=======

MIT License <https://github.com/macro187/cook/blob/master/license.txt>



Copyright
=========

Copyright (c) 2023  
Ron MacNeil <https://github.com/macro187>

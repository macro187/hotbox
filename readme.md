hotbox
======

My workstation containers, setup scripts, and config files



Features
========

*Features* are scripts that set up various aspects of machines (physical, virtual,
or container), sometimes according to my personal preferences.

They are written in portable posix shell, with specifics for the following Linux
distributions:

- Alpine Linux
- Ubuntu Linux

Feature scripts are designed to be run directly as normal users.

### Early Features

Features whose names begin with `early-` are designed to be run before regular
features as *root*.



Specs
=====

*Specs* are named specifications of sets of features and other information.


hotbox-setup [--early] SPEC
---------------------------

Set up features from `SPEC`

### Options

`--early` - Set up early features instead of regular ones.  Must be run as
            *root*.

`SPEC` - The spec to set up features from.

### Environment

`HOTBOX_SPEC` - The spec to set up features from.  Overridden by `SPEC` option.



Containers
==========

Hotbox can build and run containers with *Features* configured according to
*Specs*.  These containers are equipped with:

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


hotbox [SPEC]
-------------

Enter a workstation container built from `SPEC`, building it if necessary

### Options

`SPEC` - The spec to build and/or enter.  Default `alpine`.

### Environment

`HOTBOX_SPEC` - The spec to build and/or enter.  Overridden by `SPEC` option.


hotbox-build [SPEC]
-------------------

Build a workstation container image from `SPEC`

### Options

`SPEC` - The spec to build.  Default `alpine`.

### Environment

`HOTBOX_SPEC` - The spec to build.  Overridden by `SPEC` option.


hotbox-run [SPEC]
-----------------

Enter the workstation container built from `SPEC`

There can multiple workstation container instances running at the same time,
distinguishable by name.  The `HOTBOX_ID` environment variable specifies the
unique ID of the container to start or join (from outside a hotbox container) or
indicates the current container's ID (from inside a hotbox container).  The
default container ID is `default`.

If the container with the specified ID is not already running, start it from the
specified SPEC and then enter it in a login shell.

If the container with the specified ID is already running, enter it in a new
login shell.

### Options

`SPEC` - The spec to run.  Default `alpine`.

### Environment

`HOTBOX_SPEC` - The spec to run.  Overridden by `SPEC` option.

`HOTBOX_ID` - Unique identifier of container instance to run.  Default
              `default`.


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

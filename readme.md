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

*Specs* are named sets of features tailored to different workstation use cases.
They are defined in shell scripts in the `specs/` subdirectory.


hotbox-setup
------------

Set up features according to a spec

### Synopsis

```
hotbox-setup [--early] <spec>
```

### Options

```
--early
    Set up early features instead of regular ones.  Must be run as root.

<spec>
    The spec to set up features according to.
```



Containers
==========

Hotbox can build and run containers configured with *features* according to
*specs*.  In addition to functionality provided by the features, these
containers are equipped with:

- The *hotbox* tools mounted at `/hotbox`
- The host Docker socket so Docker works
- The host X11 socket so X11 applications work
- The host user's `.git-credentials`
- The host `$TERM` setting
- The current host directory mounted at (or under) `/workspace` (or a similar
  location)

Hotbox containers are identified primarily by the spec they derive from.  A spec
named *foo* and its related image and containers can all be loosely referred to
as *the foo hotbox* or *a foo hotbox*.

In addition, hotbox attaches names to containers to identify them and to
distinguish amongst multiple containers from the same spec.


Host Requirements
-----------------

Docker.

If X applications are to be run in containers, they must be allowed access to
the host X server.  This can be done manually each session or prepended to
`.xinitrc` (or whatever):

    xhost +


hotbox
------

Enter a hotbox container

### Synopsis

```
hotbox [<spec> [<name>]]
```

### Options

```
<spec>
    The spec of the container to enter.  Default "alpine".

<name>
    The name of the container to enter.  Default same as spec.
```

### Description

If an image for `<spec>` doesn't exist, build it.

If a container with `<name>` is not running, start one in a new login shell.

If a container with `<name>` is already running, join it in a new login shell.


hotbox-build
------------

Build a hotbox container image from a spec

### Synopsis

```
hotbox-build <spec>
```

### Options

```
<spec>
    The spec to build.
```


hotbox-run
----------

Enter a hotbox container

### Synopsis

```
hotbox-run <spec> <name> [<command> [<arg>...]]
```

### Options

```
<spec>
    The hotbox spec to run.

<name>
    The name to assign to the container, or the name of the existing container
    to join.

<command>
    The command to run in the container.  Default the shell specified in the
    <spec>.

<arg>
    Argument(s) to <command>.  Default the shell argument specified in the
    <spec>.
```

### Description

If a container with the name is not running, start it.

If a container with the name is already running, join it.


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

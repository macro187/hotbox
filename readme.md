hotbox
======

My workstation containers, setup scripts, and config files


Introduction
------------

*Features* are uniquely-named, plain old shell scripts that automate the setup
of individual aspects of machines (whether physical, virtual, or container).
They are applied using the `hotbox-apply-feature` command, which basically just
runs the specified feature script.  Features can be used on their own and do not
require the use of any further hotbox functionality.

>   Some features currently implement personal preferences of mine, but this may
>   change in the future.

*Specs* are uniquely-named sets of features defining machine setups for
particular use-cases.  An include mechanism allows deriving new specs from
existing ones.  Specs are applied using the `hotbox-apply-spec` command, which
basically just implements the include mechanism and applies all the features
listed in the specified spec.  Specs can be used on their own (along with
features) and do not require the use of any further hotbox functionality.

Hotbox containers (or just *hotboxes*) are Docker containers built from specs.
They are built using the `hotbox-build` command and run using the `hotbox-run`
or `hotbox` commands.  Although hotboxes can be used in a batch / background
fashion as containers normally are, the hotbox tooling and features are designed
to enable a more lightweight, interactive usage style where users can quickly
jump in and out of different hotbox containers depending on the task at hand.



Features
========

Features consist of one or more related scripts in the `features/` subdirectory,
each of which performs actions at different times:

-   `<feature>.user.feature.sh`

    Performs one-time setup action(s) as the unprivileged user.

    Can perform privileged operations using `doas` (if available).

    Features should be designed to do as much setup as possible at this time.

-   `<feature>.system.feature.sh`

    Performs one-time setup actions as root, usually early in the machine setup
    process, usually before unprivileged users or `doas` have been set up.

    Features should only perform setup at this time if necessary.

-   `<feature>.run.feature.sh` 

    (containers only)

    Performs actions on the host as the unprivileged host user just before
    starting a container, with any stdout output being included in the `docker
    run` command line.

A number of features are included with hotbox itself.  User-defined features can
be used in addition to or instead of the included ones.

Features can support any number of operating systems, but the included features
currently support:

- Alpine Linux

- Ubuntu Linux



Specs
=====

*Specs* are named sets of features tailored to different workstation use cases.
They are defined in shell scripts in the `specs/` subdirectory.



Containers
==========

Hotbox can build and run containers configured with *features* according to
*specs*.

Hotbox includes a number of features that can be used to support interactive
container use.  These include:

- Unprivileged container user matching the unprivileged host user so file
  ownership and permissions work

- Host `$TERM` and `$COLORTERM` environment variables so 256-color and truecolor
  terminals work

- Host user's `~/.git-credentials` so Git works

- Host Docker socket so Docker works

- Host X11 socket and `$DISPLAY` environment variable so X11 applications work

- Shared, persistent caches for various package managers (Alpine APK, Ubuntu
  APT, Nuget, NPM, etc.) so packages only get downloaded once

Hotbox containers are identified primarily by the name of the spec they are
built from.  A spec named *foo* and its related image and containers can all be
loosely referred to as *the foo hotbox* or *a foo hotbox*.

In addition, hotbox attaches names to individual containers to identify them and
to distinguish amongst multiple containers from the same spec.


Host Requirements
-----------------

Docker.

If X applications are to be run in containers, they must be allowed access to
the host X server.  This can be done manually each session or prepended to
`.xinitrc` (or whatever):

    xhost +



Commands
========

hotbox-apply-feature
--------------------

Apply a feature to the running system

### Synopsis

```
hotbox-apply-feature [--system] <feature>
```

### Options

```
--system
    Apply system aspects of the feature.  Must be run as root.

<feature>
    The feature to apply.
```


hotbox-apply-spec
-----------------

Apply all features in a spec to the running system

### Synopsis

```
hotbox-apply-spec [--system] <spec>
```

### Options

```
--system
    Apply system aspects of features.  Must be run as root.

<spec>
    The spec whose features are to be applied.
```


hotbox
------

Enter or join a hotbox container, building it if necessary

### Synopsis

```
hotbox [--volume <volume>] <spec> [<name>] [-- <command> [<arg>...]]
```

### Options

```
--volume <hostpath>:<containerpath>
    Mount the specified <hostpath> into the container at <containerpath>.  Can
    be specified more than once.

<spec>
    The spec of the container to enter.

<name>
    The name of the container to enter.  Default same as <spec>.

<command>
    The command to run in the container instead of a login shell.

<arg>
    Argument to <command>
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

Enter or join a hotbox container

### Synopsis

```
hotbox-run [--volume <volume>] <spec> <name> [<command> [<arg>...]]
```

### Options

```
--volume <hostpath>:<containerpath>
    Mount the specified <hostpath> into the container at <containerpath>.  Can
    be specified more than once.

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

If a container with the specified `<name>` is not running, start it.

If a container with the specified `<name>` is already running, join it.


hotbox-clean
------------

Delete all hotbox container images and associated feature/spec snapshots.



Scripting Language
==================

All hotbox scripts are POSIX shell scripts (https://shellhaters.org/) so they
work in all common Bourne-style shells including Bash, Dash, Ash, etc.



License
=======

MIT License (https://github.com/macro187/cook/blob/master/license.txt)



Copyright
=========

Copyright (c) 2023  
Ron MacNeil (https://github.com/macro187)

hotbox
======

My workstation containers, setup scripts, and config files


Scripting Language
------------------

Scripts are POSIX shell scripts (see https://shellhaters.org/) so they should
work in most common shells including Bash, Dash, Ash, etc.



Features
========

A *feature* is a script (or 2 or 3 related scripts) that sets up a particular
aspect of a machine (whether physical, virtual, or container).

>   Some features currently implement personal preferences of mine, but this may
>   change in the future.

Feature scripts are located in the `features/` subdirectory.

Currently, the scripts work on the following Linux distributions:

- Alpine Linux

- Ubuntu Linux

Each feature is implemented as any combination of a *regular*, *system*, and
*run* script.


Regular Scripts
---------------

Regular feature scripts are what normally set up features.  They:

* Are named according to the feature, e.g. `my-feature`.

* Run as the non-privileged user.

* Run together with other feature scripts.

* Can perform privileged operations using `doas`.


System Scripts
--------------

System scripts set up "system-level" aspects of features which, in this context,
means potentially early in the process of setting up a machine when things like
unprivileged users, doas, etc. may not be available.  These scripts:

* Are named according to the feature plus a .system suffix, e.g.
  `my-feature.system`.

* Run as root.

* Run together with other system scripts before regular scripts run.

* May run early in the machine setup process before e.g. unprivileged users have
  been created.


Run Scripts
-----------

Run scripts contribute `docker run` command line options when hotbox containers
with the feature are started.  They:

* Are named according to the feature plus a .run suffix, e.g.
  `my-feature.run`.

* Run as the non-privileged user.

* Run when hotbox containers are started.

* Contribute `docker run` command line options by echoing them to stdout.


hotbox-setup-feature
--------------------

Set up a feature

### Synopsis

```
hotbox-setup-feature [--system] <feature>
```

### Options

```
--system
    Set up system-level aspects of the feature.  Must be run as root.

<feature>
    The feature to set up.
```



Specs
=====

*Specs* are named sets of features tailored to different workstation use cases.
They are defined in shell scripts in the `specs/` subdirectory.


hotbox-setup-spec
-----------------

Set up all features in a spec

### Synopsis

```
hotbox-setup-spec [--system] <spec>
```

### Options

```
--system
    Set up system-level aspects of features.  Must be run as root.

<spec>
    The spec listing the features to set up.
```



Containers
==========

Hotbox can build and run containers configured with *features* according to
*specs*.  In addition to functionality provided by the features, these
containers are equipped with:

- The host Docker socket so Docker works
- The host X11 socket so X11 applications work
- The host user's `.git-credentials`
- The host `$TERM` setting

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
hotbox [--volume <volume>] [<spec> [<name>]] [-- [<command> [<arg>...]]
```

### Options

```
--volume <hostpath>:<containerpath>
    Mount the specified <hostpath> into the container at <containerpath>.  Can
    be specified more than once.

<spec>
    The spec of the container to enter.  Default "alpine".

<name>
    The name of the container to enter.  Default same as spec.

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

Enter a hotbox container

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

If a container with the name is not running, start it.

If a container with the name is already running, join it.


hotbox-clean
------------

Delete all hotbox container images



Environment Variables
=====================

```
HOTBOX_PATH
    Colon-separated list of paths (in decreasing order of priority) to search
    for features and specs.
```



License
=======

MIT License <https://github.com/macro187/cook/blob/master/license.txt>



Copyright
=========

Copyright (c) 2023  
Ron MacNeil <https://github.com/macro187>

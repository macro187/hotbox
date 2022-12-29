Workstation
===========


macro-setup
-----------

This script performs basic workstation setup according to my preferences.  It
works on host machines or in containers.  It delegates to a number of
sub-scripts, each of which can also be run independently.


### macro-setup-shell

### macro-setup-git

### macro-setup-vim



Host Machine Setup
------------------

Basic setup:

    macro-setup

Allow apps in containers to access the host X server.  This can be done manually
each session or prepended to `.xinitrc` (or whatever).

    xhost +

Install Docker.



macro-base
----------

Build, start, and enter a container equipped with:

- Minimal command line tools (including Vim, Git, etc.)
- Host Docker socket so Docker works
- Host X11 socket so X11 applications work
- Host `$TERM` setting
- Non-root user matching the current host user
- Host user's `.git-credentials`
- The *macro-workstation* tools
- Configured using `macro-setup`

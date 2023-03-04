HotBox
======


hotbox-setup
------------

This script performs basic workstation setup according to my preferences.  It
works on host machines or in containers.  It delegates to a number of
sub-scripts, each of which can also be run independently.


### hotbox-setup-shell

### hotbox-setup-git

### hotbox-setup-vim



Host Machine Setup
------------------

Basic setup:

    hotbox-setup

Allow apps in containers to access the host X server.  This can be done manually
each session or prepended to `.xinitrc` (or whatever).

    xhost +

Install Docker.



hotbox-base-*os*
----------------

Build, start, and enter a container equipped with:

- Minimal command line tools (including Vim, Git, etc.)
- Host Docker socket so Docker works
- Host X11 socket so X11 applications work
- Host `$TERM` setting
- Non-root user matching the current host user
- Host user's `.git-credentials`
- The *hotbox* tools
- Configured using `hotbox-setup`

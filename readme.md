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



Machine Setup
-------------

The host machine, whether physical or virtual.

Basic setup:

    macro-setup

Allow apps in containers to access the host X server.  This can be done manually
each session or prepended to `.xinitrc` (or whatever).

    xhost +

Install Docker.


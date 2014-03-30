
Ron's Configuration Files
=========================


vimrc
-----

`~/.vimrc` / `~/_vimrc`:

    source path/to/configs/vimrc

    " ...


bashrc
------

`~/.bashrc`:

    # If not interactive, do nothing
    [[ "$-" != *i* ]] && return

    [[ -r path/to/configs/bashrc ]] && . path/to/configs/bashrc

    # ...


Ron's Configuration Files
=========================


bashrc
------

    #
    # ~/.bashrc
    #

    # If not interactive, do nothing
    [[ "$-" != *i* ]] && return

    [[ -r path/to/configs/bashrc ]] && . path/to/configs/bashrc

    # ...


gitconfig
---------

    #
    # ~/.gitconfig
    #

    [include]
        path = path/to/configs/gitconfig

    # ...


vimrc
-----

    "
    " ~/.vimrc or ~/_vimrc
    "

    source path/to/configs/vimrc

    " ...


Configure-Windows.ps1
---------------------

Apply unified configuration for Git, Vim, and Bash on Windows across Cygwin, Git MSYS, and native.


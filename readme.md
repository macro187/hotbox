Ron's Configuration Files
=========================


shrc
----

    $ ln -s path/to/configs/dot-profile ~/.profile

    $ ln -s path/to/configs/dot-bashrc ~/.bashrc

    $ cp path/to/configs/dot-shrc ~/.shrc

Edit ~/.shrc


inputrc
-------

    #
    # ~/.inputrc
    #

    $include path/to/configs/inputrc

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


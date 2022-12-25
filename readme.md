Workstation Setup
=================

profile
-------

Make sure there's a `.profile` or `.bash_profile`.

Make sure it sources `.bashrc` something like this:

    if [ -f "$HOME/.bashrc" ] ; then . "$HOME/.bashrc" ; fi

If non-bash shells are involved, make sure it tells them to use `.bashrc`
something like this:

    if [ -f "$HOME/.bashrc" ] ; then export ENV="$HOME/.bashrc" ; fi


bashrc
------

Make sure there's a `.bashrc`.

Make sure it bails out in non-interactive situations something like this:

    case $- in
        *i*) ;;
          *) return;;
    esac

Make sure it sources the *macro-workstation* `bashrc` something like this:

    if [ -f "$HOME/macro-workstation/conf/bashrc" ] ; then . "$HOME/macro-workstation/conf/bashrc" ; fi


inputrc
-------

    #
    # ~/.inputrc
    #

    $include path/to/macro-workstation/conf/inputrc

    # ...


gitconfig
---------

    #
    # ~/.gitconfig
    #

    [include]
        path = path/to/macro-workstation/conf/gitconfig

    # ...


vimrc
-----

    "
    " ~/.vimrc or ~/_vimrc
    "

    source path/to/macro-workstation/conf/vimrc

    " ...


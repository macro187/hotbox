. $HOTBOX/lib/sh.sh


setup_alpine() {
    cd $HOME
    if [ ! -d serve-d ] ; then
        heading "Cloning serve-d"
        $HOTBOX/lib/git-clone-cached "https://github.com/Pure-D/serve-d.git"
    fi


    cd serve-d
    heading "Building serve-d"
    echo_on
    dub build
    echo_off


    heading "Linking serve-d to user bin/"
    echo_on
    rm -f $HOME/bin/serve-d
    ln -s $HOME/serve-d/serve-d $HOME/bin/serve-d
    echo_off


    cd $HOME
    if [ ! -d DCD ] ; then
        heading "Cloning dcd"
        $HOTBOX/lib/git-clone-cached "https://github.com/dlang-community/DCD.git"
    fi


    cd DCD
    heading "Building dcd"
    echo_on
    dub build --config=server
    dub build --config=client
    echo_off


    heading "Linking dcd to user bin/"
    echo_on
    rm -f $HOME/bin/dcd-server
    rm -f $HOME/bin/dcd-client
    ln -s $HOME/DCD/bin/dcd-server $HOME/bin/dcd-server
    ln -s $HOME/DCD/bin/dcd-client $HOME/bin/dcd-client
    echo_off
}


case $(current_distro) in

    alpine)
        setup_alpine
        ;;

    *)
        die "Don't know how to install serve-d on $(current_distro) os"
        ;;
esac

. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


build_serve_d_from_source() {
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
}


build_dcd_from_source() {
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


install_serve_d_binary_dist() {
    version="0.8.0-beta.14"
    distfile="serve-d_$version-linux-x86_64.tar.xz"
    url="https://github.com/Pure-D/serve-d/releases/download/v0.8.0-beta.14/$distfile"

    echo_on
    cd $HOME
    mkdir -p serve-d
    cd serve-d
    echo_off

    if [ -f $HOTBOX_STATE/cache/$distfile ] ; then
        heading "Copying serve-d from cache"
        echo_on
        cp $HOTBOX_STATE/cache/$distfile ./
        echo_off
    else
        heading "Downloading serve-d"
        echo_on
        wget -nv -O $distfile "$url"
        cp -f $distfile $HOTBOX_STATE/cache/
        echo_off
    fi

    heading "Extracting serve-d"
    echo_on
    tar xvf $distfile
    rm $distfile
    echo_off

    heading "Linking serve-d to user bin/"
    echo_on
    cd $HOME/bin
    ln -s $HOME/serve-d/serve-d
    echo_off
}


install_dcd_binary_dist() {
    version="0.16.0-beta.2"
    distfile="dcd-v$version-linux-x86_64.tar.gz"
    url="https://github.com/dlang-community/DCD/releases/download/v0.16.0-beta.2/$distfile"

    echo_on
    cd $HOME
    mkdir -p dcd
    cd dcd
    echo_off

    if [ -f $HOTBOX_STATE/cache/$distfile ] ; then
        heading "Copying dcd from cache"
        echo_on
        cp $HOTBOX_STATE/cache/$distfile ./
        echo_off
    else
        heading "Downloading dcd"
        echo_on
        wget -nv -O $distfile "$url"
        cp -f $distfile $HOTBOX_STATE/cache/
        echo_off
    fi

    heading "Extracting dcd"
    echo_on
    tar xvf $distfile
    rm $distfile
    echo_off

    heading "Linking dcd to user bin/"
    echo_on
    cd $HOME/bin
    ln -s $HOME/dcd/dcd-server
    ln -s $HOME/dcd/dcd-client
    echo_off
}


case $(current_distro) in

    alpine)
        build_serve_d_from_source
        build_dcd_from_source
        ;;

    *)
        install_serve_d_binary_dist
        install_dcd_binary_dist
        ;;
esac

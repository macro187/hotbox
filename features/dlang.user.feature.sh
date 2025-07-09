. $HOTBOX/lib/sh.sh
export HOTBOX_STATE="$(hotbox-state-init)"


setup_alpine() {
    heading "Installing gcc"
    info "(The dmd compiler uses the GCC linker)"
    echo_on
    doas apk add gcc gcc-doc
    echo_off

    heading "Installing libc dev files"
    info "(D programs usually directly or indirectly use libc)"
    echo_on
    doas apk add musl-dev
    echo_off

    heading "Installing dmd compiler"
    echo_on
    doas apk add dmd@edgecommunity dmd-doc@edgecommunity
    echo_off

    heading "Installing dub build tool"
    echo_on
    doas apk add dub@edgecommunity dub-doc@edgecommunity
    echo_off
}


prerequisites_ubuntu() {
    if ! which xz >/dev/null ; then
        heading "Installing dlang prerequisites"
        echo_on
        doas \
            env DEBIAN_FRONTEND=noninteractive \
            apt install -y --no-install-recommends \
                xz-utils
        echo_off
    fi
}


prerequisites_void() {
    if ! which xz >/dev/null ; then
        heading "Installing dlang prerequisites"
        echo_on
        doas \
            xbps-install -y \
                xz \
                gcc \
                openssl-devel
        echo_off
    fi
}


install_dlang() {
    if [ -d $HOTBOX_STATE/cache/dlang ] ; then
        heading "Copying cached dlang installation"
        echo_on
        cp -R $HOTBOX_STATE/cache/dlang $HOME/
        echo_off

        if [ ! "${HOTBOX_REFRESH:-}" ] ; then
            return 0
        fi
    else
        heading "Creating dlang directory"
        echo_on
        mkdir -p $HOME/dlang
        echo_off
    fi

    cd $HOME/dlang
    if [ -e install.sh ] ; then
        heading "Updating dlang install.sh"
        echo_on
        ./install.sh update
        echo_off
    else
        heading "Downloading dlang install.sh"
        echo_on
        wget -nv -O install.sh https://dlang.org/install.sh
        chmod u+x install.sh
        echo_off
    fi

    heading "Installing / updating dmd compiler"
    echo_on
    ./install.sh install dmd
    echo_off

    heading "Caching dlang installation"
    # TODO lock
    echo_on
    rm -rf $HOTBOX_STATE/cache/dlang
    cp -R $HOME/dlang $HOTBOX_STATE/cache/
    echo_off
}


case $(current_distro) in

    alpine)
        setup_alpine
        ;;

    *)
        prerequisites=prerequisites_$(current_distro)
        if function_exists $prerequisites ; then
            $prerequisites
        fi
        install_dlang
        ;;
esac

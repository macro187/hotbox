. $HOTBOX/lib/sh.sh


case $(current_distro) in

    alpine)
        ;;

    ubuntu)
        info "Unminimizing Ubuntu"
        echo_on
        env DEBIAN_FRONTEND=noninteractive apt update
        env DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends unminimize
        yes | unminimize || checkpipe
        echo_off
        ;;

    void)
        echo_on
        xbps-install -S
        xbps-install -uy xbps
        xbps-install -S
        xbps-install -uy
        echo_off
        ;;

esac

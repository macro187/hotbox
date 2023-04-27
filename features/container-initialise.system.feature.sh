. $HOTBOX/lib/sh.sh


case $(current_distro) in

    alpine)
        ;;

    ubuntu)
        info "Unminimizing Ubuntu"
        echo_on
        yes | unminimize || checkpipe
        echo_off
        ;;

esac

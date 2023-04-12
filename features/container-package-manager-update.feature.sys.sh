. $HOTBOX/lib/sh.sh


case $(current_distro) in

    alpine)
        echo_on
        apk update
        echo_off
        ;;

    ubuntu)
        echo_on
        env DEBIAN_FRONTEND=noninteractive apt update
        echo_off
        ;;

    *)
        die "Don't know how to update package manager database on $(current_distro) os"
        ;;
esac

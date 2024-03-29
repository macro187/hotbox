. $HOTBOX/lib/sh.sh


case $(current_distro) in

    alpine)
        echo_on
        doas apk add mandoc mandoc-doc man-pages man-pages-posix
        echo_off
        ;;

    ubuntu)
        echo_on
        doas env DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends man manpages-posix
        echo_off
        ;;

    *)
        echo "Don't know how to set up man pages on $(current_distro) os"
        ;;
esac

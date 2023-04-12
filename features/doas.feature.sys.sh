. $HOTBOX/lib/sh.sh


test -n "${HOTBOX_USER:-}" || die "HOTBOX_USER not set"


case $(current_distro) in

    alpine)
        echo_on
        apk add doas
        echo "permit nopass $HOTBOX_USER" >>/etc/doas.d/$HOTBOX_USER.conf
        echo_off
        ;;

    ubuntu)
        echo_on
        DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends doas
        echo "permit nopass $HOTBOX_USER" >>/etc/doas.conf
        echo_off
        ;;

    *)
        die "Don't know how to set up doas on $(current_distro) os"
        ;;
esac

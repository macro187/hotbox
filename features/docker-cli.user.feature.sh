. $HOTBOX/lib/sh.sh


if ! which docker >/dev/null 2>&1 ; then
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add docker-cli
            echo_off
            ;;

        ubuntu)
            echo_on
            doas env DEBIAN_FRONTEND=noninteractive \
                apt install -y --no-install-recommends docker.io
            echo_off
            ;;

        void)
            echo_on
            doas xbps-install -y docker-cli
            echo_off
            ;;

        *)
            die "Don't know how to install Docker on $(current_distro) os"
            ;;
    esac
fi

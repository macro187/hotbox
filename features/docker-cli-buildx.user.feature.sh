. $HOTBOX/lib/sh.sh


if ! docker buildx version >/dev/null 2>&1 ; then
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add docker-cli-buildx
            echo_off
            ;;

        ubuntu)
            echo_on
            doas env DEBIAN_FRONTEND=noninteractive \
                apt install -y --no-install-recommends docker-buildx
            echo_off
            ;;

        *)
            die "Don't know how to install Docker buildx on $(current_distro) os"
            ;;
    esac
fi


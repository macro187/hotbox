. $HOTBOX/lib/sh.sh


if ! docker compose version >/dev/null 2>&1 ; then
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add docker-cli-compose
            echo_off
            ;;

        *)
            die "Don't know how to install Docker Compose on $(current_distro) os"
            ;;
    esac
fi


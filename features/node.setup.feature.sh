. $HOTBOX/lib/sh.sh


if ! which node >/dev/null ; then
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add nodejs nodejs-doc npm npm-doc
            echo_off
            ;;

        ubuntu)
            echo_on
            doas \
                env DEBIAN_FRONTEND=noninteractive \
                apt install -y --no-install-recommends nodejs npm
            echo_off
            ;;

        *)
            die "Don't know how to install node on $current_distro os"
            ;;
    esac
fi

. $HOTBOX/lib/sh.sh


if ! which bash-language-server >/dev/null ; then
    echo_on
    npm i -g bash-language-server
    echo_off
fi


if ! which shellcheck >/dev/null ; then
    heading "Installing shellcheck"
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add shellcheck shellcheck-doc
            echo_off
            ;;

        ubuntu)
            echo_on
            doas \
                env DEBIAN_FRONTEND=noninteractive \
                apt install -y --no-install-recommends shellcheck
            echo_off
            ;;

        *)
            die "Don't know how to install shellcheck on $(current_distro) os"
            ;;
    esac
fi

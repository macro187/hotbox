. $HOTBOX/lib/sh.sh


if ! which javac >/dev/null ; then
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add openjdk17@edgecommunity
            echo_off
            ;;

        *)
            die "Don't know how to install JDK on $(current_distro) os"
            ;;
    esac
fi

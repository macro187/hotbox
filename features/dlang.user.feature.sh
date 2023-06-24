. $HOTBOX/lib/sh.sh


if ! which dmd >/dev/null ; then
    heading "Installing dmd compiler"
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add dmd@edgecommunity
            echo_off
            ;;

        *)
            die "Don't know how to install dmd compiler on $(current_distro) os"
            ;;
    esac
fi


if ! which dub >/dev/null ; then
    heading "Installing dub build tool"
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add dub@edgecommunity
            echo_off
            ;;

        *)
            die "Don't know how to install dub build tool on $(current_distro) os"
            ;;
    esac
fi

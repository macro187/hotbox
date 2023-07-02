. $HOTBOX/lib/sh.sh


if ! which vim >/dev/null ; then
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add vim vim-doc
            echo_off
            ;;

        ubuntu)
            echo_on
            doas \
                env DEBIAN_FRONTEND=noninteractive \
                apt install -y --no-install-recommends vim
            echo_off
            ;;

        void)
            echo_on
            doas xbps-install -y vim
            echo_off
            ;;

        *)
            die "Don't know how to install vim on $(current_distro) os"
            ;;
    esac
fi


heading "Creating Vim plugin directory"
echo_on
cd $HOME
mkdir -p .vim/pack
cd .vim/pack
rm -rf hotbox
mkdir -p hotbox/start
echo_off

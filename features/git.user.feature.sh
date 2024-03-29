. $HOTBOX/lib/sh.sh


if ! which git >/dev/null ; then
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add git git-doc
            echo_off
            ;;

        ubuntu)
            echo_on
            doas env DEBIAN_FRONTEND=noninteractive apt install -y git
            echo_off
            ;;

        *)
            die "Don't know how to install git on $(current_distro) os"
            ;;
    esac
fi


cd $HOME


#
# Make sure there's a .gitconfig
#
if ! [ -f .gitconfig ] ; then
    info "No .gitconfig found, creating"
    touch .gitconfig
fi


#
# Use totally insecure "store" credential store on Linux
#
if [ "$(uname)" = "Linux" ] ; then
    info "On Linux, using INSECURE store credential helper"
    echo_on
    git config --global credential.helper store
    echo_off
fi

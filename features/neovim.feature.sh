. $HOTBOX/lib/sh.sh


if ! which nvim >/dev/null ; then
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add neovim neovim-doc
            echo_off
            ;;

        ubuntu)
            echo_on
            doas \
                env DEBIAN_FRONTEND=noninteractive \
                apt install -y --no-install-recommends neovim
            echo_off
            ;;

        *)
            die "Don't know how to install vim on $current_distro os"
            ;;
    esac
fi


heading "Installing Neovim plugins"
echo_on
cd $HOME
mkdir -p .local/share/nvim/site/pack
cd .local/share/nvim/site/pack
rm -rf hotbox
mkdir -p hotbox/start
cd hotbox/start
git clone https://github.com/macro187/vim-macrobsidian.git
echo_off

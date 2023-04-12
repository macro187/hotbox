. $HOTBOX/lib/sh.sh


echo_on
cd $HOME
mkdir -p $HOME/bin
echo_off


case $(current_distro) in
    alpine)
        echo_on
        echo >> .profile
        echo 'PATH="$HOME/bin:$PATH"' >> .profile
        echo_off
        ;;
esac

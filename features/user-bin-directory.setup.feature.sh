. $HOTBOX/lib/sh.sh


cd $HOME


echo_on
mkdir -p bin
echo_off


echo_on
rm -f .profile.d/??-user-bin-directory.sh
echo 'PATH="$HOME/bin:$PATH"' >.profile.d/50-user-bin-directory.sh
echo_off

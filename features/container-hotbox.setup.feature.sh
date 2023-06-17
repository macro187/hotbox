. $HOTBOX/lib/sh.sh


user="$(current_user)"


heading "Adding /hotbox to path"
cd $HOME
echo_on
rm -f .profile.d/??-container-hotbox.sh
echo 'PATH="/hotbox:$PATH"' >.profile.d/50-container-hotbox.sh
echo_off

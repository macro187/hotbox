. $HOTBOX/lib/sh.sh


user="$(current_user)"


heading "Adding /hotbox to path"
echo_on
cd $HOME
echo 'PATH="/hotbox:$PATH"' >.profile.d/50-container-hotbox.sh
echo_off

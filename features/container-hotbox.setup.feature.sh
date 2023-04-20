. $HOTBOX/lib/sh.sh


user="$(current_user)"


heading "Adding /hotbox to path"
echo_on
cd $HOME
echo 'PATH="/hotbox:$PATH"' >>.profile
echo_off


heading "Creating hotbox state mount point"
echo_on
doas rm -rf /hotbox-state
doas mkdir /hotbox-state
doas chown $user:$user /hotbox-state
doas chmod 755 /hotbox-state
echo_off

. $HOTBOX/lib/sh.sh


user="$(current_user)"


heading "Creating /cook mount point"
echo_on
doas mkdir /cook
doas chown $user:$user /cook
doas chmod 755 /cook
echo_off


heading "Adding /cook to path"
cd $HOME
echo_on
rm -f .profile.d/??-container-cook.sh
echo 'PATH="/cook:$PATH"' >.profile.d/50-container-cook.sh
echo_off

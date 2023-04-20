. $HOTBOX/lib/sh.sh


user="$(current_user)"


heading "Creating /cook mount point"
echo_on
doas mkdir /cook
doas chown $user:$user /cook
doas chmod 755 /cook
echo_off


heading "Adding /cook to path"
echo_on
cd $HOME
echo 'PATH="/cook:$PATH"' >>.profile
echo_off

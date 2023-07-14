. $HOTBOX/lib/sh.sh


user="$(current_user)"


heading "Creating /hotbox-user-configs mount point"
echo_on
doas mkdir /hotbox-user-configs
doas chown $user:$user /hotbox-user-configs
doas chmod 755 /hotbox-user-configs
echo_off

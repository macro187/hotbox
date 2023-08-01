. $HOTBOX/lib/sh.sh


user="$(current_user)"


heading "Creating /hotbox-personal-configs mount point"
echo_on
doas mkdir /hotbox-personal-configs
doas chown $user:$user /hotbox-personal-configs
doas chmod 755 /hotbox-personal-configs
echo_off

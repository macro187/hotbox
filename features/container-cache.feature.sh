. $HOTBOX/lib/sh.sh


user="$(current_user)"


echo_on
doas mkdir /hotbox-cache
doas chown $user:$user /hotbox-cache
doas chmod 755 /hotbox-cache
echo_off

. $HOTBOX/lib/sh.sh


user="$(current_user)"


echo_on
doas mkdir -p /workspace
doas chown $user:$user /workspace
doas chmod 755 /workspace
echo_off

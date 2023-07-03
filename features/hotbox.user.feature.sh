. $HOTBOX/lib/sh.sh


heading "Adding hotbox to path"
cd $HOME
echo_on
rm -f .profile.d/??-hotbox.sh
cat << EOF >>.profile.d/50-hotbox.sh
PATH="$HOTBOX:\$PATH"
EOF
echo_off

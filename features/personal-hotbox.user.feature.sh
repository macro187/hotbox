. $HOTBOX/lib/sh.sh


configs="$HOME/configs"
if $HOTBOX/lib/in-container ; then
    configs="/hotbox-personal-configs"
fi


info "Writing .profile.d/50-personal-hotbox.sh"
cd $HOME
rm -f .profile.d/??-personal-hotbox.sh
cat << EOF >.profile.d/50-personal-hotbox.sh
if [ -e $configs ] ; then
    export HOTBOX_PATH="$configs:\$HOTBOX_PATH"
fi
EOF

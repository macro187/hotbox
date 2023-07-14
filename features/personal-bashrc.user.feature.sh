. $HOTBOX/lib/sh.sh


configs="$HOME/configs"
if $HOTBOX/lib/in-container ; then
    configs="/hotbox-personal-configs"
fi
bashrc="$configs/bashrc"


info "Writing .shrc.d/40-personal-bashrc.sh"
cd $HOME
rm -f .shrc.d/??-personal-bashrc.sh
cat << EOF >.shrc.d/40-personal-bashrc.sh
if [ -e $bashrc ] ; then
    . $bashrc
fi
EOF

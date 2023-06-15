. $HOTBOX/lib/sh.sh


cd $HOME


info "Writing .shrc.d/40-ron-bashrc.sh that sources the hotbox bashrc"
echo_on
cat << EOF >.shrc.d/40-ron-bashrc.sh
if [ -e $HOTBOX/conf/bashrc ] ; then
    . $HOTBOX/conf/bashrc
fi
EOF
echo_off

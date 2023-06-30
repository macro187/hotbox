. $HOTBOX/lib/sh.sh


info "Writing .profile.d/40-dmd-activate.sh that activates the dlang dmd compiler on login"
echo_on
rm -f .profile.d/??-dmd-activate.sh
cat << 'EOF' >.profile.d/40-dmd-activate.sh
activate="$(ls $HOME/dlang/dmd*/activate 2>/dev/null | sort | tail -n 1)"
if [ -n "$activate" ] ; then
    old_ps1="$PS1"
    source $activate
    export PS1="$old_ps1"
    unset old_ps1
fi
unset activate
EOF
echo_off

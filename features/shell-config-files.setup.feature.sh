. $HOTBOX/lib/sh.sh


find_first() {
    for f in $@ ; do
        if [ -f $f ] ; then
            echo $f
            return 0
        fi
    done
}


cd $HOME


#
# Make sure there's a .profile or .bash_profile
#
profile=$(find_first .profile .bash_profile)
if [ -z "$profile" ] ; then
    info "No .profile found, creating"
    touch .profile
    profile=".profile"
fi

#
# Make sure .profile sources .bashrc
#
if ! grep -qF '. "$HOME/.bashrc"' $profile ; then
    info "No .bashrc source found in $profile, adding"
    cat $profile >.profile.old
    echo '. "$HOME/.bashrc"' >$profile
    echo >>$profile
    cat .profile.old >>$profile
    rm .profile.old
fi

#
# Make sure .profile tells non-bash shells to use .bashrc
#
if ! grep -qF 'export ENV="$HOME/.bashrc"' $profile ; then
    info "No .bashrc ENV found in $profile, adding"
    echo >>$profile
    echo 'export ENV="$HOME/.bashrc"' >>$profile
fi

#
# Make sure there's a .bashrc
#
bashrc=$(find_first .bashrc)
if [ -z "$bashrc" ] ; then
    info "No .bashrc found, creating"
    touch .bashrc
    bashrc=".bashrc"
fi

#
# Make .bashrc bails out in non-interactive situations
#
if ! grep -qF '$-' .bashrc ; then
    info "No non-interactive return found in .bashrc, prepending"
    cat .bashrc >.bashrc.old
    cat << 'EOF' >.bashrc
case $- in
    *i*) ;;
      *) return;;
esac
EOF
    echo >>.bashrc
    cat .bashrc.old >>.bashrc
    rm .bashrc.old
fi

#
# Make sure .bashrc sources the hotbox bashrc
#
if ! grep -qF 'conf/bashrc' .bashrc ; then
    info "No hotbox bashrc source found in .bashrc, adding"
    echo >>.bashrc
    echo ". \"$HOTBOX/conf/bashrc\"" >>.bashrc
fi

#
# Make sure there's an .inputrc
#
inputrc=$(find_first .inputrc)
if [ -z "$inputrc" ] ; then
    info "No .inputrc found, creating"
    touch .inputrc
    inputrc=".inputrc"
fi

#
# Make sure .inputrc sources the hotbox inputrc
#
if ! grep -qF 'conf/inputrc' .inputrc ; then
    info "No hotbox inputrc source found in .inputrc, prepending"
    cat .inputrc >.inputrc.old
    echo "\$include $HOTBOX/conf/inputrc" >.inputrc
    echo >>.inputrc
    cat .inputrc.old >>.inputrc
    rm .inputrc.old
fi

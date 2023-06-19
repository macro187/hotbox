. $HOTBOX/lib/sh.sh


cd $HOME


if [ ! -e .profile.stock ] && [ -e .profile ] ; then
    info "Saving current .profile as .profile.stock"
    echo_on
    mv .profile .profile.stock
    echo_off
    warn "Consider reviewing .profile.stock"
fi


if [ ! -e .profile.stock ] ; then
    info "No stock .profile, saving an empty .profile.stock"
    echo_on
    touch .profile.stock
    echo_off
fi


if [ -e .profile ] ; then
    info "Backing up current non-stock .profile"
    old=".profile.old.$(date +%Y%m%d%H%M%S)"
    echo_on
    mv .profile $old
    echo_off
    unset old
fi


if [ ! -e .profile ] ; then
    info "Writing .profile that sources .profile.d/"
    echo_on
    cat << 'EOF' >>.profile
if [ -d $HOME/.profile.d ] ; then
    for f in $HOME/.profile.d/*.sh ; do
        . $f
    done
    unset f
fi
EOF
    echo_off
fi


if [ ! -d .profile.d ] ; then
    info "Creating .profile.d/"
    echo_on
    mkdir .profile.d
    echo_off
fi


info "Writing .profile.d/10-stock-profile.sh that runs the stock .profile"
echo_on
rm -f .profile.d/??-stock-profile.sh
cat << 'EOF' >.profile.d/10-stock-profile.sh
if [ -e $HOME/.profile.stock ] ; then
    . $HOME/.profile.stock
fi
EOF
echo_off


if [ -e .bash_profile ] ; then
    info "Saving current .bash_profile as .bash_profile.stock"
    if [ -e .bash_profile.stock ] ; then
        die "Didn't expect to find both a .bash_profile and a .bash_profile.stock"
    fi
    echo_on
    mv .bash_profile .bash_profile.stock
    echo_off
    warn "Consider reviewing .bash_profile.stock"
fi


info "Writing .profile.d/11-stock-bash-profile.sh that runs the stock .bash_profile"
echo_on
rm -f .profile.d/??-stock-bash-profile.sh
cat << 'EOF' >.profile.d/11-stock-bash-profile.sh
test -n "$BASH_VERSION" || return 0
if [ -e $HOME/.bash_profile.stock ] ; then
    . $HOME/.bash_profile.stock
fi
EOF
echo_off

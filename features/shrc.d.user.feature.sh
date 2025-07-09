. $HOTBOX/lib/sh.sh


cd $HOME


if [ -e .shrc ] ; then
    info "Backing up current .shrc"
    old=".shrc.old.$(date +%Y%m%d%H%M%S)"
    echo_on
    mv .shrc $old
    echo_off
    unset old
fi


info "Writing .shrc that sources .shrc.d/"
echo_on
cat << 'EOF' >>.shrc
[ ! "$__shrc_sourced" ] || return 0 ; __shrc_sourced=1

case $- in *i*) ;; *) return 0 ;; esac

if [ -d $HOME/.shrc.d ] ; then
    for f in $HOME/.shrc.d/*.sh ; do
        . $f
    done
    unset f
fi
EOF
echo_off


if [ ! -d .shrc.d ] ; then
    info "Creating .shrc.d/"
    echo_on
    mkdir .shrc.d
    echo_off
fi


info "Writing .profile.d/90-shrc.sh that sources .shrc on login"
echo_on
rm -f .profile.d/??-shrc.sh
cat << 'EOF' >.profile.d/90-shrc.sh
if [ -e $HOME/.shrc ] ; then
    . $HOME/.shrc
fi
EOF
echo_off


info "Writing .profile.d/50-shrc-env.sh that sources .shrc on interactive ash/dash startup via the \$ENV variable"
echo_on
rm -f .profile.d/??-shrc-env.sh
cat << 'EOF' >.profile.d/50-shrc-env.sh
export ENV="$HOME/.shrc"
EOF
echo_off


if [ ! -e .bashrc.stock ] && [ -e .bashrc ] ; then
    info "Saving current .bashrc as .bashrc.stock"
    echo_on
    mv .bashrc .bashrc.stock
    echo_off
    warn "Consider reviewing .bashrc.stock"
fi


if [ ! -e .bashrc.stock ] ; then
    info "No stock .bashrc, saving an empty .bashrc.stock"
    echo_on
    touch .bashrc.stock
    echo_off
fi


info "Writing .shrc.d/10-stock-bashrc.sh that sources the stock .bashrc"
echo_on
cat << 'EOF' >.shrc.d/10-stock-bashrc.sh
[ "$BASH_VERSION" ] || return 0
if [ -e $HOME/.bashrc.stock ] ; then
    . $HOME/.bashrc.stock
fi
EOF
echo_off


if [ -e .bashrc ] ; then
    info "Backing up current .bashrc"
    old=".bashrc.old.$(date +%Y%m%d%H%M%S)"
    echo_on
    mv .bashrc $old
    echo_off
    unset old
fi


info "Writing .bashrc that sources .shrc on interactive bash startup"
echo_on
cat << 'EOF' >.bashrc
if [ -e $HOME/.shrc ] ; then
    . $HOME/.shrc
fi
EOF
echo_off

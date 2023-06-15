. $HOTBOX/lib/sh.sh


cd $HOME


if ! grep -qF 'conf/inputrc' .inputrc ; then
    info "Sourcing Ron's inputrc from .inputrc"
    cat .inputrc >.inputrc.old
    echo "\$include $HOTBOX/conf/inputrc" >.inputrc
    echo >>.inputrc
    cat .inputrc.old >>.inputrc
    rm .inputrc.old
fi

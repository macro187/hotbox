. $HOTBOX/lib/sh.sh


configs="$HOME/configs"
if $HOTBOX/lib/hotbox-in-container ; then
    configs="/hotbox-personal-configs"
fi


cd $HOME


if ! grep -qF "$configs/inputrc" .inputrc ; then
    info "Sourcing personal inputrc from .inputrc"
    cat .inputrc >.inputrc.old
    echo "\$include $configs/inputrc" >.inputrc
    echo >>.inputrc
    cat .inputrc.old >>.inputrc
    rm .inputrc.old
fi

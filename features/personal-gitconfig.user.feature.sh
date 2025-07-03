. $HOTBOX/lib/sh.sh


configs="$HOME/configs"
if $HOTBOX/lib/hotbox-in-container ; then
    configs="/hotbox-personal-configs"
fi
gitconfig="$configs/gitconfig"


cd $HOME
[ -e .gitconfig ] || touch .gitconfig
if ! grep -qF "$gitconfig" .gitconfig ; then
    info "Including $gitconfig from .gitconfig"
    cat .gitconfig >.gitconfig.old
    echo "[include]" >.gitconfig
    echo "	path = $gitconfig" >>.gitconfig
    echo >>.gitconfig
    cat .gitconfig.old >>.gitconfig
    rm .gitconfig.old
fi

. $HOTBOX/lib/sh.sh


cd $HOME
if ! [ -f .vimrc ] ; then
    heading "Creating .vimrc"
    echo_on
    touch .vimrc
    echo_off
fi


cd $HOME
if ! grep -q '/conf/vimrc.neovim.lua$' .vimrc ; then
    heading "Sourcing hotbox Neovim vimrc from .vimrc"
    echo_on
    cat .vimrc > .vimrc.old
    echo "if has('nvim')" > .vimrc
    echo "source $HOTBOX/conf/vimrc.neovim.lua" >> .vimrc
    echo "endif" >> .vimrc
    echo >> .vimrc
    cat .vimrc.old >> .vimrc
    rm .vimrc.old
    echo_off
fi


cd $HOME
if ! grep -q '/conf/vimrc$' .vimrc ; then
    heading "Sourcing hotbox vimrc from .vimrc"
    echo_on
    cat .vimrc > .vimrc.old
    echo "source $HOTBOX/conf/vimrc" > .vimrc
    echo >> .vimrc
    cat .vimrc.old >> .vimrc
    rm .vimrc.old
    echo_off
fi


cd $HOME
if ! [ -f .config/nvim/init.vim ] ; then
    heading "Linking Neovim init.vim"
    echo_on
    mkdir -p .config/nvim
    cd .config/nvim
    ln -s $HOME/.vimrc init.vim
    echo_off
fi
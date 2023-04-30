. $HOTBOX/lib/sh.sh


cd $HOME
if ! [ -f .vimrc ] ; then
    heading "Creating ~/.vimrc"
    echo_on
    touch .vimrc
    echo_off
fi


cd $HOME
if ! [ -f .vimrc.lua ] ; then
    heading "Creating ~/.vimrc.lua"
    echo_on
    touch .vimrc.lua
    echo_off
fi


cd $HOME
if ! [ -f .config/nvim/init.vim ] ; then
    heading "Creating ~/.config/nvim/init.vim"
    echo_on
    mkdir -p .config/nvim
    touch .config/nvim/init.vim
    echo_off
fi


cd $HOME/.config/nvim
if ! grep -q '/.vimrc$' init.vim ; then
    heading "Sourcing ~/.vimrc from ~/.config/nvim/init.vim"
    echo_on
    echo >>init.vim
    echo "source $HOME/.vimrc" >>init.vim
    echo_off
fi


cd $HOME/.config/nvim
if ! grep -q '/.vimrc.lua$' init.vim ; then
    heading "Sourcing ~/.vimrc.lua from ~/.config/nvim/init.vim"
    echo_on
    echo >>init.vim
    echo "luafile $HOME/.vimrc.lua" >>init.vim
    echo_off
fi

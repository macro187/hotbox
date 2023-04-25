. $HOTBOX/lib/sh.sh


cd $HOME
if ! grep -q '/conf/vimrc$' .vimrc ; then
    heading "Sourcing Ron's vimrc from ~/.vimrc"
    echo_on
    echo >>.vimrc
    echo "source $HOTBOX/conf/vimrc" >>.vimrc
    echo_off
fi


cd $HOME
if ! grep -q '/conf/vimrc.neovim.lua$' .vimrc ; then
    heading "Sourcing Ron's Neovim Lua vimrc from ~/.vimrc"
    echo_on
    echo >>.vimrc
    echo "if has('nvim')" >>.vimrc
    echo "source $HOTBOX/conf/vimrc.neovim.lua" >>.vimrc
    echo "endif" >>.vimrc
    echo_off
fi

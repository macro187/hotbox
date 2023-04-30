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
if ! grep -q '/conf/vimrc.lua$' .vimrc.lua ; then
    heading "Sourcing Ron's Neovim Lua vimrc from ~/.vimrc.lua"
    echo_on
    echo >>.vimrc.lua
    echo "vim.cmd(\"source $HOTBOX/conf/vimrc.lua\")" >>.vimrc.lua
    echo_off
fi

. $HOTBOX/lib/sh.sh


cd $HOME


heading "Sourcing Ron's vimrc and vimrc.lua"
echo_on
rm -f .vimrc.d/??-ron-vimrc.vim
cat << EOF >.vimrc.d/40-ron-vimrc.vim
source $HOTBOX/conf/vimrc

if has('nvim')
    source $HOTBOX/conf/vimrc.lua
endif
EOF
echo_off

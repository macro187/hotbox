. $HOTBOX/lib/sh.sh


configs="$HOME/configs"
if hotbox-in-container ; then
    configs="/hotbox-personal-configs"
fi


cd $HOME


info "Writing .vimrc.d/40-personal-vimrc.sh"
echo_on
rm -f .vimrc.d/??-personal-vimrc.vim
cat << EOF >.vimrc.d/40-personal-vimrc.vim
if filereadable('$configs/vimrc')
    source $configs/vimrc
endif

if has('nvim')
    if filereadable('$configs/vimrc.lua')
        source $configs/vimrc.lua
    endif
endif
EOF
echo_off

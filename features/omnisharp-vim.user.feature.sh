. $HOTBOX/lib/sh.sh


cd $HOME/.vim/pack/hotbox/start


echo_on
$HOTBOX/lib/git-clone-cached https://github.com/OmniSharp/omnisharp-vim
echo_off


cd $HOME


heading "Writing omnisharp-vim configuration"
echo_on
rm -f .vimrc.d/??-omnisharp.vim
cat << EOF >.vimrc.d/50-omnisharp-vim.vim
let g:OmniSharp_server_path = 'OmniSharp'
filetype indent plugin on
syntax enable
EOF
echo_off

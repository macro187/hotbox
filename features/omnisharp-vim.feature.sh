. $HOTBOX/lib/sh.sh


echo_on

cd $HOME/.vim/pack/hotbox/start
git clone https://github.com/OmniSharp/omnisharp-vim

cd $HOME
cat > .vimrc <<- "EOF"
	let g:OmniSharp_server_path = 'OmniSharp'
	filetype indent plugin on
	syntax enable
EOF

echo_off

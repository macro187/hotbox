. $HOTBOX/lib/sh.sh


cd $HOME


if [ ! -d .vimrc.d ] ; then
    heading "Creating ~/.vimrc.d/"
    echo_on
    mkdir .vimrc.d
    echo_off
fi


if [ -e .vimrc ] ; then
    heading "Backing up current .vimrc"
    old=".vimrc.old.$(date +%Y%m%d%H%M%S)"
    echo_on
    mv .vimrc $old
    echo_off
    unset old
fi


heading "Writing .vimrc that sources .vimrc.d/"
echo_on
cat << 'EOF' >.vimrc
for f in split(glob('~/.vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor
EOF
echo_off


if [ ! -d .config/nvim ] ; then
    heading "Creating ~/.config/nvim/"
    echo_on
    mkdir -p .config/nvim
    echo_off
fi


cd $HOME/.config/nvim


if [ -e init.vim ] ; then
    heading "Backing up current Neovim init.vim"
    old="init.vim.old.$(date +%Y%m%d%H%M%S)"
    echo_on
    mv init.vim $old
    echo_off
    unset old
fi


heading "Writing Neovim init.vim that sources ~/.vimrc"
echo_on
echo "source $HOME/.vimrc" >init.vim
echo_off

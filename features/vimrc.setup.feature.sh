. $HOTBOX/lib/sh.sh


cd $HOME
if ! [ -f .vimrc ] ; then
    heading "Creating ~/.vimrc"
    echo_on
    touch .vimrc
    echo_off
fi


cd $HOME
if ! [ -f .config/nvim/init.vim ] ; then
    heading "Linking Neovim init.vim to ~/.vimrc"
    echo_on
    mkdir -p .config/nvim
    cd .config/nvim
    ln -s $HOME/.vimrc init.vim
    echo_off
fi

. $HOTBOX/lib/sh.sh


if [ -d ~/.local/share/nvim ] ; then
    heading "Backing up ~/.local/share/nvim"
    echo_on
    mv ~/.local/share/nvim ~/.local/share/nvim.orig
    echo_off
fi


if [ -d ~/.config/nvim ] ; then
    heading "Backing up existing ~/.config/nvim"
    echo_on
    mv ~/.config/nvim ~/.config/nvim.orig
    echo_off
fi


heading "Installing NvChad"
mkdir -p $HOME/.config
cd $HOME/.config
hotbox-git-clone-cached https://github.com/NvChad/NvChad
mv NvChad nvim

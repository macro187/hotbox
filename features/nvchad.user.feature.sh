. $HOTBOX/lib/sh.sh


if [ -d ~/.config/nvim ] ; then
    heading "Backing up ~/.config/nvim"
    echo_on
    mv ~/.config/nvim ~/.config/nvim.orig
    echo_off
fi


if [ -d ~/.local/share/nvim ] ; then
    heading "Backing up ~/.local/share/nvim"
    echo_on
    mv ~/.local/share/nvim ~/.local/share/nvim.orig
    echo_off
fi


heading "Installing NvChad"
echo_on
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
echo_off

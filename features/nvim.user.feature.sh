. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


install_alpine() {
    echo_on
    doas apk add neovim neovim-doc
    echo_off
}


install_ubuntu() {
    version="0.9.1"
    localdistfile="nvim-$version-linux64.tar.gz"
    url="https://github.com/neovim/neovim/releases/download/v$version/nvim-linux64.tar.gz"

    cd $HOME

    if [ -f $HOTBOX_STATE/cache/$localdistfile ] ; then
        heading "Copying nvim from cache"
        echo_on
        cp $HOTBOX_STATE/cache/$localdistfile ./
        echo_off
    else
        heading "Downloading nvim"
        echo_on
        wget -nv -O $localdistfile "$url"
        cp -f $localdistfile $HOTBOX_STATE/cache/
        echo_off
    fi

    heading "Extracting nvim"
    echo_on
    tar xf $localdistfile
    mv nvim-linux64 nvim
    rm $localdistfile
    echo_off

    heading "Linking nvim to user bin/"
    echo_on
    cd $HOME/bin
    ln -s $HOME/nvim/bin/nvim
    echo_off
}


if ! which nvim >/dev/null ; then
    install=install_$(current_distro)
    function_exists $install || die "Don't know how to install nvim on $(current_distro) os"
    $install
fi


heading "Creating Neovim plugin directory"
echo_on
cd $HOME
mkdir -p .local/share/nvim/site/pack
cd .local/share/nvim/site/pack
rm -rf hotbox
mkdir -p hotbox/start
echo_off

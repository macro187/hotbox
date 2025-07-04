. $HOTBOX/lib/sh.sh
export HOTBOX_STATE="$(hotbox-state-init)"


version="1.39.11"

case $(current_distro) in
    alpine)
        distfile="omnisharp-linux-musl-x64-net6.0.tar.gz"
        localfile="omnisharp-linux-musl-x64-net6.0-$version.tar.gz"
        ;;
    *)
        distfile="omnisharp-linux-x64-net6.0.tar.gz"
        localfile="omnisharp-linux-x64-net6.0-$version.tar.gz"
        ;;
esac

disturl="https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v$version/$distfile"


cd $HOME


mkdir omnisharp
cd omnisharp
if [ ! -f $HOTBOX_STATE/cache/$localfile ] ; then
    echo_on
    wget -nv -O $localfile "$disturl"
    echo_off
    if [ ! -f $HOTBOX_STATE/cache/$localfile ] ; then
        echo_on
        mkdir -p $HOTBOX_STATE/cache
        mv $localfile $HOTBOX_STATE/cache/$localfile
        echo_off
    fi
fi
echo_on
cp $HOTBOX_STATE/cache/$localfile $localfile
tar -xf $localfile
rm $localfile
cd $HOME/bin
ln -s $HOME/omnisharp/OmniSharp
echo_off

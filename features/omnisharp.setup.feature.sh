. $HOTBOX/lib/sh.sh


version="1.39.6"

case $(current_distro) in
    alpine)
        distfile="omnisharp-linux-musl-x64-net6.0.tar.gz"
        ;;
    *)
        distfile="omnisharp-linux-x64-net6.0.tar.gz"
        ;;
esac

disturl="https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v$version/$distfile"


cd $HOME


echo_on
mkdir omnisharp
cd omnisharp
wget -nv -O omnisharp.tar.gz "$disturl"
tar -xf omnisharp.tar.gz
rm omnisharp.tar.gz
cd $HOME/bin
ln -s $HOME/omnisharp/OmniSharp
echo_off

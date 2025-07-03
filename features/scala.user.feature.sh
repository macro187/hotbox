. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


case $(current_distro) in
    alpine)
        echo_on
        doas apk add bash bash-doc
        echo_off
        ;;
esac


cd $HOME


if [ ! -d scala ] ; then
    heading "Installing scala to $HOME/scala"
    version="3.3.0"
    distfilebase="scala3-$version"
    distfile="$distfilebase.tar.gz"
    url="https://github.com/lampepfl/dotty/releases/download/$version/$distfile"
    hotbox-wget-cached "$url" "$distfile"
    echo_on
    tar xf $distfile
    mv $distfilebase scala
    rm $distfile
    echo_off
    for cmd in scala scalac scaladoc ; do
        echo_on
        rm -f bin/$cmd
        ln -s $HOME/scala/bin/$cmd bin/$cmd
        echo_off
    done
fi


if [ ! -d sbt ] ; then
    heading "Installing sbt to $HOME/sbt"
    version="1.9.2"
    distfilebase="sbt-$version"
    distfile="$distfilebase.tgz"
    url="https://github.com/sbt/sbt/releases/download/v$version/$distfile"
    hotbox-wget-cached "$url" "$distfile"
    echo_on
    tar xf $distfile
    rm $distfile
    ln -s $HOME/sbt/bin/sbt bin/sbt
    ./sbt/bin/sbt -V
    echo_off
fi

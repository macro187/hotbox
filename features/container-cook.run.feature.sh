. $HOTBOX/lib/sh.sh


cook="$(which cook)" || exit 0
cook="${cook%/*}"


host_cook="$cook"
if $HOTBOX/hotbox-in-container ; then
    host_cook="$($HOTBOX/hotbox-map $cook)"
    if [ -z "$host_cook" ] ; then
        warn "$cook will be unavailable because it has not been bind mounted from the host"
        exit 0
    fi
fi


echo --volume $host_cook:/cook

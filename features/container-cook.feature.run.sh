. $HOTBOX/lib/sh.sh


cook="$(which cook)"
cook="${cook%/*}"
test -n "$cook" || exit 0


host_cook="$cook"
if $HOTBOX/hotbox-in-container ; then
    host_cook="$($HOTBOX/hotbox-map $cook)"
    if [ -z "$host_cook" ] ; then
        warn "$cook will be unavailable because it has not been bind mounted from the host"
        exit 0
    fi
fi


echo --volume $host_cook:/cook

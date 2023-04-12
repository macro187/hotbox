. $HOTBOX/lib/sh.sh


host_hotbox="$HOTBOX"
if $HOTBOX/hotbox-in-container ; then
    host_hotbox="$($HOTBOX/hotbox-host-path $HOTBOX)"
    if [ -z "$host_hotbox" ] ; then
        warn "$HOTBOX will be unavailable because it has not been bind mounted from the host"
        exit 0
    fi
fi


echo --volume $host_hotbox:/hotbox

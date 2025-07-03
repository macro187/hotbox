. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


host_hotbox="$HOTBOX"
host_hotbox_state="$HOTBOX_STATE"
if hotbox-in-container ; then
    host_hotbox="$(hotbox-map-container-path $HOTBOX)"
    host_hotbox_state="$(hotbox-map-container-path $HOTBOX_STATE)"
    test -n "$host_hotbox" || die "Can't mount $HOTBOX because it wasn't mounted from the host"
    test -n "$host_hotbox_state" || die "Can't mount $HOTBOX_STATE because it wasn't mounted from the host"
fi


echo --volume $host_hotbox:/hotbox
echo --volume $host_hotbox_state:/hotbox-state
echo --env HOTBOX_STATE=/hotbox-state

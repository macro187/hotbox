. $HOTBOX/lib/sh.sh
export HOTBOX_STATE="$(hotbox-state-init)"

host_hotbox="$HOTBOX"
host_hotbox_state="$HOTBOX_STATE"
if hotbox-in-container ; then
    host_hotbox="$(hotbox-map-container-path $host_hotbox)"
    host_hotbox_state="$(hotbox-map-container-path $host_hotbox_state)"
    [ "$host_hotbox" ] || die "Can't mount $HOTBOX because it wasn't mounted from the host"
    [ "$host_hotbox_state" ] || die "Can't mount $HOTBOX_STATE because it wasn't mounted from the host"
fi

echo --volume $host_hotbox:/hotbox
echo --volume $host_hotbox_state:/hotbox-state
echo --env HOTBOX_STATE=/hotbox-state

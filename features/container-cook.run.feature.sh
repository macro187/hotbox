. $HOTBOX/lib/sh.sh


heading "Locating cook"


cook="$(which cook || true)"
cook="${cook%/*}"
if [ -z "$cook" ] ; then
    warn "cook not found on PATH, /cook will be unavailable in container"
    exit 0
fi


host_cook="$cook"
if $HOTBOX/hotbox-in-container ; then
    host_cook="$($HOTBOX/hotbox-map $cook)"
    if [ -z "$host_cook" ] ; then
        warn "$cook not bind-mounted from host, /cook will be unavailable in container"
        exit 0
    fi
fi


info "Using cook $cook ($host_cook on host)"


echo --volume $host_cook:/cook

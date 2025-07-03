. $HOTBOX/lib/sh.sh


heading "Locating personal configs"


configs="$HOME/configs"
if $HOTBOX/lib/hotbox-in-container ; then
    configs="/hotbox-personal-configs"
fi


if [ ! -d $configs ] ; then
    warn "Personal configs not found at $configs, /hotbox-personal-configs will be unavailable in container"
    exit 0
fi


host_configs="$configs"
if $HOTBOX/lib/hotbox-in-container ; then
    host_configs="$($HOTBOX/lib/hotbox-map-container-path $configs)"
    if [ -z "$host_configs" ] ; then
        warn "$configs not bind-mounted from host, /hotbox-personal-configs will be unavailable in container"
        exit 0
    fi
fi


info "Using personal configs $configs ($host_configs on host)"


echo --volume $host_configs:/hotbox-personal-configs

. $HOTBOX/lib/sh.sh


is_workspace() {
    test ! -d .git && ls */.git >/dev/null 2>&1
}


find_workspace() {
    while true ; do
        workspace="$(pwd)"

        if [ "$workspace" = "/" ] ; then
            cd $current
            workspace=""
            workspace_local=""
            return
        fi

        if is_workspace ; then
            cd $current
            return
        fi

        workspace_local="/${workspace##*/}$workspace_local"
        cd ..
    done
}


heading "Locating workspace"


current="$(pwd)"
current_name="${current##*/}"
workspace=""
workspace_local=""
find_workspace


if [ -n "$workspace" ] ; then
    src="$workspace"
    dst="/workspace"
    wrk="/workspace$workspace_local"
else
    src="$current"
    dst="/workspace/$current_name"
    wrk="/workspace/$current_name"
fi


hostsrc="$src"
if $HOTBOX/lib/hotbox-in-container ; then
    hostsrc="$($HOTBOX/lib/hotbox-map-container-path $src)"

    if [ -z "$hostsrc" ] ; then
        warn "/workspace will be unavailable because $src is not bind mounted from the container host"
        echo --workdir /workspace
        exit 0
    fi
fi


info "Using workspace $src ($hostsrc on host)"


echo --volume  $hostsrc:$dst
echo --workdir $wrk

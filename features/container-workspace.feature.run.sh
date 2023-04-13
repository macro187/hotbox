. $HOTBOX/lib/sh.sh


#
# Current directory
#
current="$(pwd)"
current_name="${current##*/}"


#
# See if we're in a workspace
#
workspace=""
workspace_local=""
is_workspace() {
    test ! -d .git && ls */.git >/dev/null 2>&1
}
find_workspace() {
    heading "Searching for workspace"
    while true ; do
        workspace="$(pwd)"

        if [ "$workspace" = "/" ] ; then
            info "No workspace found"
            cd $current
            workspace=""
            workspace_local=""
            return
        fi

        if is_workspace ; then
            info "Found workspace $workspace"
            cd $current
            return
        fi

        workspace_local="/${workspace##*/}$workspace_local"
        cd ..
    done
}
find_workspace


#
# Determine mount and work directories based on whether we're in a workspace
#
if [ -n "$workspace" ] ; then
    src="$workspace"
    dst="/workspace"
    wrk="/workspace$workspace_local"
else
    src="$current"
    dst="/workspace/$current_name"
    wrk="/workspace/$current_name"
fi


#
# If we're in a container, map mount source to the container host
#
hostsrc="$src"
if $HOTBOX/hotbox-in-container ; then
    hostsrc="$($HOTBOX/hotbox-map $src)"

    if [ -z "$hostsrc" ] ; then
        warn "/workspace will be unavailable because $src is not bind mounted from the container host"
        echo --workdir /workspace
        exit 0
    fi
fi


echo --volume  $hostsrc:$dst
echo --workdir $wrk

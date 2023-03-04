test -n "${__hotbox_base:+x}" && return ; __hotbox_base=1


. $hotbox/lib/hotbox-sh.sh
. $hotbox/lib/hotbox-docker.sh


hotbox_base_build() {
    local baseimage="$1" ; shift
    local imagename="$1" ; shift

    local user=$(current_user)
    local uid=$(current_uid)
    local gid=$(current_gid)

    hotbox_docker_build \
        hotbox-base \
        $imagename \
        --build-arg baseimage=$baseimage \
        --build-arg user=$user \
        --build-arg uid=$uid \
        --build-arg gid=$gid
}


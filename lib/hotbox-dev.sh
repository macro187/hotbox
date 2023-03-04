test -n "${__hotbox_dev:+x}" && return ; __hotbox_dev=1


. $hotbox/lib/hotbox-sh.sh
. $hotbox/lib/hotbox-docker.sh


hotbox_dev_build() {
    local baseimage="$1" ; shift
    local imagename="$1" ; shift

    local user=$(current_user)

    hotbox_docker_build \
        hotbox-dev \
        $imagename \
        --build-arg baseimage=$baseimage \
        --build-arg user=$user
}


hotbox_dev_run() {
    local imagename="$1" ; shift

    local hostdir="$(pwd)"
    local hostdirname="${hostdir##*/}"

    local workdir=/workspaces
    if [ -d .git ] ; then
        workdir="$workdir/$hostdirname"
    fi

    hotbox_docker_run \
        $imagename \
        -v $hostdir:$workdir \
        --workdir="$workdir"
}

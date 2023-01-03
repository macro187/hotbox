test -n "${__macro_dev:+x}" && return ; __macro_dev=1


. $scriptdir/lib/macro-sh.sh
. $scriptdir/lib/macro-docker.sh


macro_dev_build() {
    local baseimage="$1" ; shift
    local imagename="$1" ; shift

    local user=$(current_user)

    macro_docker_build \
        macro-dev \
        $imagename \
        --build-arg baseimage=$baseimage \
        --build-arg user=$user
}


macro_dev_run() {
    local imagename="$1" ; shift

    local hostdir="$(pwd)"
    local hostdirname="${hostdir##*/}"

    local workdir=/workspaces
    if [ -d .git ] ; then
        workdir="$workdir/$hostdirname"
    fi

    macro_docker_run \
        $imagename \
        -v $hostdir:$workdir \
        --workdir="$workdir"
}

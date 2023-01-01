test -n "${__macro_docker:+x}" && return ; __macro_docker=1


. $scriptdir/lib/macro-sh.sh


macro_docker_build() {
    local dockerfile="$1" ; shift
    local imagename="$1" ; shift
    # (remaining arguments are passed to docker build)

    heading "Building $imagename container image"
    echo_on
    PROGRESS_NO_TRUNC=1 \
    docker build \
        --progress plain \
        -t $imagename \
        $@ \
        - \
        < $scriptdir/lib/$dockerfile.Dockerfile
    echo_off
}


macro_docker_run() {
    local imagename="$1" ; shift
    # (remaining arguments are passed to docker run)

    local termopts=""
    if [ -n "${TERM:+x}" ] ; then
        termopts="-e TERM=$TERM"
    fi

    local dockersockopts=""
    if [ -S /var/run/docker.sock ] ; then
        dockersockopts="-v /var/run/docker.sock:/var/run/docker.sock"
    fi

    local x11sockopts=""
    if [ -d /tmp/.X11-unix ] ; then
        x11sockopts="-v /tmp/.X11-unix:/tmp/.X11-unix"
    fi

    local displayopts=""
    if [ -n "${DISPLAY:+x}" ] ; then
        displayopts="-e DISPLAY=$DISPLAY"
    fi

    local gitcredentialsopts=""
    if [ -f $HOME/.git-credentials ] ; then
        gitcredentialsopts="-v $HOME/.git-credentials:/home/$(current_user)/.git-credentials"
    fi

    heading "Starting $imagename container"
    echo_on
    docker run \
        --ipc=host \
        --rm \
        -it \
        $termopts \
        $dockersockopts \
        $x11sockopts \
        $displayopts \
        $gitcredentialsopts \
        $@ \
        $imagename
    echo_off
}

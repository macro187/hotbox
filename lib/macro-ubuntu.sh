test -n "${__macro_ubuntu:+x}" && return ; __macro_ubuntu=1


. $scriptdir/lib/macro-docker.sh


macro_ubuntu_build() {
    macro_docker_build \
        macro-ubuntu \
        macro-ubuntu
}

test -n "${__macro_alpine:+x}" && return ; __macro_alpine=1


. $scriptdir/lib/macro-docker.sh


macro_alpine_build() {
    macro_docker_build \
        macro-alpine \
        macro-alpine
}

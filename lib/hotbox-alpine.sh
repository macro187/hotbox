test -n "${__hotbox_alpine:+x}" && return ; __hotbox_alpine=1


. $hotbox/lib/hotbox-docker.sh


hotbox_alpine_build() {
    hotbox_docker_build \
        hotbox-alpine \
        hotbox-alpine
}

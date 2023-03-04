test -n "${__hotbox_ubuntu:+x}" && return ; __hotbox_ubuntu=1


. $hotbox/lib/hotbox-docker.sh


hotbox_ubuntu_build() {
    hotbox_docker_build \
        hotbox-ubuntu \
        hotbox-ubuntu
}

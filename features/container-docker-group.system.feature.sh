. $HOTBOX/lib/sh.sh


test -n "${HOTBOX_USER:-}" || die "HOTBOX_USER not set"
HOTBOX_DOCKER_GID="${HOTBOX_DOCKER_GID:-}"


add_docker_group() {
    heading "Setting up Docker group"

    if [ -z "$HOTBOX_DOCKER_GID" ] ; then
        info "No HOTBOX_DOCKER_GID specified, nothing to do"
        return 0
    fi

    existing_group="$(getent group $HOTBOX_DOCKER_GID | cut -d: -f1 || checkpipe)"
    if [ "$existing_group" = "docker" ] ; then
        info "docker group already exists with GID $HOTBOX_DOCKER_GID, nothing to do"
        return 0
    fi

    if [ -n "$existing_group" ] ; then
        die "HOTBOX_DOCKER_GID $HOTBOX_DOCKER_GID already in use by group $existing_group"
    fi

    echo_on
    addgroup --gid $HOTBOX_DOCKER_GID docker
    echo_off
}
add_docker_group


add_user_to_docker_group() {
    heading "Adding user to docker group"

    local docker_gid="$(getent group docker | cut -d: -f3 || checkpipe)"
    if [ -z "$docker_gid" ] ; then
        info "No docker group on system, can't add"
        return 0
    fi

    echo_on
    addgroup $HOTBOX_USER docker
    echo_off
}
add_user_to_docker_group

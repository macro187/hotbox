ARG baseimage
FROM $baseimage

ARG spec
ARG user
ARG uid
ARG gid
ARG docker_gid
ARG workdir

COPY --chown=$uid:$gid / /hotbox

USER root
WORKDIR /root
RUN set -eu ; \
    echo "" >&2 ; \
    echo "==> Setting up system features as root" >&2 ; \
    set -x ; \
    export HOTBOX_USER="$user" ; \
    export HOTBOX_UID="$uid" ; \
    export HOTBOX_GID="$gid" ; \
    export HOTBOX_DOCKER_GID="$docker_gid" ; \
    /hotbox/hotbox-setup --system $spec

USER $user
WORKDIR /home/$user
RUN set -eu ; \
    echo "" >&2 ; \
    echo "==> Setting up features as $user" >&2 ; \
    set -x ; \
    export HOTBOX_USER="$user" ; \
    export HOTBOX_UID="$uid" ; \
    export HOTBOX_GID="$gid" ; \
    export HOTBOX_DOCKER_GID="$docker_gid" ; \
    /hotbox/hotbox-setup $spec

#
# Set some reasonable defaults even though hotbox-run specifies these explicitly
#
USER $user
WORKDIR $workdir
CMD ["/bin/sh", "-l"]

ARG HOTBOX_BASEIMAGE
FROM $HOTBOX_BASEIMAGE

ARG HOTBOX_SPEC
ARG HOTBOX_USER
ARG HOTBOX_UID
ARG HOTBOX_GID
ARG HOTBOX_DOCKER_GID
ARG HOTBOX_WORKDIR

COPY --chown=$HOTBOX_UID:$HOTBOX_GID / /hotbox

USER root
WORKDIR /root
RUN set -eu ; \
    echo "" >&2 ; \
    echo "==> Setting up early features as root" >&2 ; \
    set -x ; \
    export HOTBOX_USER="$HOTBOX_USER" ; \
    export HOTBOX_UID="$HOTBOX_UID" ; \
    export HOTBOX_GID="$HOTBOX_GID" ; \
    export HOTBOX_DOCKER_GID="$HOTBOX_DOCKER_GID" ; \
    /hotbox/hotbox-setup --early $HOTBOX_SPEC

USER $HOTBOX_USER
WORKDIR /home/$HOTBOX_USER
RUN set -eu ; \
    echo "" >&2 ; \
    echo "==> Setting up features as $HOTBOX_USER" >&2 ; \
    set -x ; \
    export HOTBOX_USER="$HOTBOX_USER" ; \
    export HOTBOX_UID="$HOTBOX_UID" ; \
    export HOTBOX_GID="$HOTBOX_GID" ; \
    export HOTBOX_DOCKER_GID="$HOTBOX_DOCKER_GID" ; \
    /hotbox/hotbox-setup $HOTBOX_SPEC

#
# Set some reasonable defaults even though hotbox-run specifies these explicitly
#
USER $HOTBOX_USER
WORKDIR $HOTBOX_WORKDIR
CMD ["/bin/sh", "-l"]

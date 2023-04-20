ARG baseimage
FROM $baseimage

ARG spec
ARG user
ARG uid
ARG gid
ARG docker_gid

#
# Copy hotbox from host into /hotbox
#
COPY --chown=$uid:$gid /hotbox /hotbox
COPY --chown=$uid:$gid /hotbox-sources /hotbox-sources

#
# Run specified hotbox spec system setup
#
USER root
WORKDIR /root
RUN set -eu ; \
    echo "" >&2 ; \
    echo "==> Setting up system features as root" >&2 ; \
    set -x ; \
    export HOTBOX_SOURCES="/hotbox-sources" ; \
    export HOTBOX_USER="$user" ; \
    export HOTBOX_UID="$uid" ; \
    export HOTBOX_GID="$gid" ; \
    export HOTBOX_DOCKER_GID="$docker_gid" ; \
    /hotbox/hotbox-setup --system $spec

#
# Run specified hotbox spec setup
#
USER $user
WORKDIR /home/$user
RUN set -eu ; \
    echo "" >&2 ; \
    echo "==> Setting up features as $user" >&2 ; \
    set -x ; \
    export HOTBOX_SOURCES="/hotbox-sources" ; \
    export HOTBOX_USER="$user" ; \
    export HOTBOX_UID="$uid" ; \
    export HOTBOX_GID="$gid" ; \
    export HOTBOX_DOCKER_GID="$docker_gid" ; \
    /hotbox/hotbox-setup $spec

#
# Remove and recreate /hotbox so it can be mounted from host when run
#
RUN set -eu ; \
    doas rm -rf /hotbox ; \
    doas mkdir /hotbox ; \
    doas chown $user:$user /hotbox ; \
    doas chmod 755 /hotbox

#
# Remove /hotbox-sources
#
RUN set -eu ; \
    doas rm -rf /hotbox-sources

#
# Set some fallback startup defaults even though hotbox-run specifies these
#
USER $user
WORKDIR /home/$user
CMD ["/bin/sh", "-l"]

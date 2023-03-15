ARG baseimage
FROM $baseimage

ARG HOTBOX_USER
ARG HOTBOX_UID
ARG HOTBOX_GID
ARG HOTBOX_SHELL
ARG HOTBOX_WORKDIR

#
# Install hotbox to /hotbox
#
COPY --chown=$HOTBOX_UID:$HOTBOX_GID / /hotbox

#
# Run early hotbox setup as root
#
USER root
WORKDIR /root
RUN set -eux ; \
    export HOTBOX_USER="$HOTBOX_USER" ; \
    export HOTBOX_UID="$HOTBOX_UID" ; \
    export HOTBOX_GID="$HOTBOX_GID" ; \
    /hotbox/setup/early-container ; \
    /hotbox/setup/early-package-manager-cache ; \
    /hotbox/setup/early-user ; \
    /hotbox/setup/early-doas

#
# Run hotbox setup
#
USER $HOTBOX_USER:$HOTBOX_USER
WORKDIR /home/$HOTBOX_USER
RUN set -eux ; \
    /hotbox/setup/base-tools ; \
    /hotbox/setup/man ; \
    /hotbox/setup/user-bin ; \
    /hotbox/setup/shell ; \
    /hotbox/setup/git ; \
    /hotbox/setup/vim ; \
    /hotbox/setup/workspace

#
# Default login user, shell, and location
#
USER $HOTBOX_USER:$HOTBOX_USER
CMD ["$HOTBOX_SHELL", "-l" ]
WORKDIR $HOTBOX_WORKDIR

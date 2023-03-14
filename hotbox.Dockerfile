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
    /hotbox/hotbox-setup-container ; \
    /hotbox/hotbox-setup-package-manager-cache ; \
    /hotbox/hotbox-setup-user ; \
    /hotbox/hotbox-setup-doas

#
# Run hotbox setup
#
USER $HOTBOX_USER:$HOTBOX_USER
WORKDIR /home/$HOTBOX_USER
RUN set -eux ; \
    /hotbox/hotbox-setup-base-tools ; \
    /hotbox/hotbox-setup-man ; \
    /hotbox/hotbox-setup-user-bin ; \
    /hotbox/hotbox-setup-shell ; \
    /hotbox/hotbox-setup-git ; \
    /hotbox/hotbox-setup-vim ; \
    /hotbox/hotbox-setup-workspace

#
# Default login user, shell, and location
#
USER $HOTBOX_USER:$HOTBOX_USER
CMD ["$HOTBOX_SHELL", "-l" ]
WORKDIR $HOTBOX_WORKDIR

ARG baseimage
FROM $baseimage

ARG user
ARG uid
ARG gid

#
# Install hotbox and run setup script
#
COPY --chown=$uid:$gid / /hotbox

USER $user:$user
WORKDIR /home/$user
RUN set -eux ; \
    /hotbox/hotbox-setup

#
# Create /workspaces
#
USER root
WORKDIR /root
RUN set -eux ; \
    mkdir -p /workspaces ; \
    chown $user:$user /workspaces ; \
    chmod 750 /workspaces

#
# Specify login user and location
#
USER $user:$user
WORKDIR /workspaces

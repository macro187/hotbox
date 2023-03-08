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
# Create /workspace
#
USER root
WORKDIR /root
RUN set -eux ; \
    mkdir -p /workspace ; \
    chown $user:$user /workspace ; \
    chmod 750 /workspace

#
# Specify login user and location
#
USER $user:$user
WORKDIR /workspace

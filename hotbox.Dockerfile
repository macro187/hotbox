ARG baseimage
FROM $baseimage

ARG user
ARG uid
ARG gid

#
# Create user
#
USER root
WORKDIR /root
RUN set -eux ; \
    addgroup --gid $gid $user ; \
    adduser --disabled-password --uid $uid --ingroup $user $user

#
# Install hotbox and run setup
#
USER $user:$user
WORKDIR /home/$user
COPY --chown=$uid:$gid / /hotbox
RUN set -eux ; \
    /hotbox/hotbox-setup

#
# Create dev workspace /workspaces
#
USER root
WORKDIR /root
RUN set -eux ; \
    mkdir -p /workspaces ; \
    chown $user:$user /workspaces ; \
    chmod 750 /workspaces

USER $user:$user
WORKDIR /workspaces

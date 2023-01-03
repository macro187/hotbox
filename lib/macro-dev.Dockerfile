ARG baseimage
FROM $baseimage

ARG user

USER root
WORKDIR /root
RUN set -eux ; \
    mkdir -p /workspaces ; \
    chown $user:$user /workspaces ; \
    chmod 750 /workspaces

USER $user:$user
WORKDIR /workspaces

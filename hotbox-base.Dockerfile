ARG baseimage
FROM $baseimage

ARG user
ARG uid
ARG gid

USER root
WORKDIR /root
RUN set -eux ; \
    addgroup --gid $gid $user ; \
    adduser --disabled-password --uid $uid --ingroup $user $user

COPY --chown=$uid:$gid / /home/$user/hotbox

USER $user:$user
WORKDIR /home/$user
RUN set -eux ; \
    hotbox/hotbox-setup

USER $user:$user
WORKDIR /home/$user

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

COPY --chown=$uid:$gid / /home/$user/macro-workstation

USER $user:$user
WORKDIR /home/$user
RUN set -eux ; \
    macro-workstation/macro-setup

USER $user:$user
WORKDIR /home/$user

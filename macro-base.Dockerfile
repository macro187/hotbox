FROM ubuntu

USER root
WORKDIR /root
ENV DEBIAN_FRONTEND=noninteractive
RUN set -eux ; \
    yes | unminimize ; \
    apt update ; \
    apt install -y --no-install-recommends less ; \
    apt install -y --no-install-recommends vim ; \
    apt install -y git ; \
    rm -rf /var/lib/apt/lists/*

ARG user=dev
ARG uid=1000
ARG gid=1000

USER root
WORKDIR /root
RUN set -eux ; \
    addgroup --gid $gid $user ; \
    adduser --uid $uid --gid $gid $user

USER $user:$user
WORKDIR /home/$user
RUN set -eux ; \
    git clone https://github.com/macro187/macro-workstation.git ; \
    macro-workstation/macro-setup

USER $user:$user
WORKDIR /home/$user
CMD ["/usr/bin/bash", "-l" ]

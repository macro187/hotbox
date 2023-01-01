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

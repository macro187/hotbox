FROM ubuntu

USER root
WORKDIR /root
RUN set -eux ; \
    yes | unminimize

RUN set -eux ; \
    DEBIAN_FRONTEND=noninteractive apt update

RUN set -eux ; \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends doas ; \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends less ; \
    DEBIAN_FRONTEND=noninteractive apt install -y git ; \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends vim

CMD ["/usr/bin/bash", "-l" ]

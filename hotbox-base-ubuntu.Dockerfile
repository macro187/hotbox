FROM ubuntu

ARG user
ARG uid
ARG gid

#
# Unminimize the Ubuntu image
#
USER root
WORKDIR /root
RUN set -eux ; \
    yes | unminimize

#
# Update package manager database
#
USER root
WORKDIR /root
RUN set -eux ; \
    DEBIAN_FRONTEND=noninteractive apt update

#
# Create user
#
USER root
WORKDIR /root
RUN set -eux ; \
    addgroup --gid $gid $user ; \
    adduser --disabled-password --uid $uid --ingroup $user $user

#
# Set up doas
#
USER root
WORKDIR /root
RUN set -eux ; \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends doas ; \
    echo "permit nopass $user" >> /etc/doas.conf

#
# Set up man pages
#
USER root
WORKDIR /root
RUN set -eux ; \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends man manpages-posix

#
# Install base packages
#
USER root
WORKDIR /root
RUN set -eux ; \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends less ; \
    DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends vim

#
# Specify the login shell
#
CMD ["/usr/bin/bash", "-l" ]

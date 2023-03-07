FROM alpine

ARG user
ARG uid
ARG gid

#
# Update package manager database
#
USER root
WORKDIR /root
RUN set -eux ; \
    apk update

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
    apk add doas ; \
    echo "permit nopass $user" >> /etc/doas.d/$user.conf

#
# Install base packages
#
RUN set -eux ; \
    apk add git ; \
    apk add vim ;

#
# Specify the login shell
#
CMD ["/bin/sh", "-l" ]

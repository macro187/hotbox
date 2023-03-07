FROM alpine

USER root
WORKDIR /root
RUN set -eux ; \
    apk update

RUN set -eux ; \
    apk add doas ; \
    apk add git ; \
    apk add vim ;

CMD ["/bin/sh", "-l" ]

FROM alpine

USER root
WORKDIR /root
RUN set -eux ; \
    apk add --no-cache vim git

CMD ["/bin/sh", "-l" ]

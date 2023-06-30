. $HOTBOX/lib/sh.sh


case $(current_distro) in

    alpine)
        echo_on
        doas \
            apk add \
            apk-tools-doc \
                less less-doc \
                wget wget-doc \
                curl curl-doc
        echo_off
        ;;

    ubuntu)
        echo_on
        doas \
            env DEBIAN_FRONTEND=noninteractive \
            apt install -y --no-install-recommends \
                less \
                wget \
                curl
        echo_off
        ;;

esac

. $HOTBOX/lib/sh.sh

user="$(current_user)"

if ! which dockerd >/dev/null 2>&1 ; then
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add docker-engine docker-openrc
            echo_off
            if which rc-update >/dev/null 2>&1 ; then
                echo_on
                doas rc-update add docker default
                echo_off
            fi
            if which service >/dev/null 2>&1 ; then
                echo_on
                doas service docker start
                echo_off
            fi
            ;;

        void)
            echo_on
            doas xbps-install -y moby
            doas ln -s /etc/sv/docker /etc/runit/runsvdir/default
            echo_off
            ;;

        *)
            die "Don't know how to install Docker daemon on $(current_distro) os"
            ;;
    esac
fi

case $(current_distro) in

    alpine)
        echo_on
        doas addgroup $user docker
        echo_off
        ;;

    void)
        echo_on
        doas usermod -a -G docker $user
        echo_off
        ;;

esac

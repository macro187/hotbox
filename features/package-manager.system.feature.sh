. $HOTBOX/lib/sh.sh


case $(current_distro) in


    alpine)
        for repo in main community testing ; do
            if ! grep -qF "@edge$repo" /etc/apk/repositories ; then
                info "Adding @edge$repo repository"
                echo "@edge$repo https://dl-cdn.alpinelinux.org/alpine/edge/$repo" >>/etc/apk/repositories
            fi
        done
        if [ -n "${HOTBOX_REFRESH:-}" ] ; then
            heading "Updating APK database"
            echo_on
            apk update
            echo_off
        fi
        ;;


    ubuntu)
        if [ -n "${HOTBOX_REFRESH:-}" ] ; then
            heading "Updating APT database"
            echo_on
            env DEBIAN_FRONTEND=noninteractive apt update
            echo_off
        fi
        ;;


    void)
        if [ -n "${HOTBOX_REFRESH:-}" ] ; then
            heading "Updating XBPS database"
            echo_on
            xbps-install -S
            echo_off
        fi
        ;;


    *)
        die "Don't know how to configure package manager on $(current_distro) os"
        ;;
esac

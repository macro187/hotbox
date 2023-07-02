. $HOTBOX/lib/sh.sh


case $(current_distro) in


    alpine)
        heading "Adding edge package repositories"
        echo_on
        cat >>/etc/apk/repositories <<-"EOF"
			@edgemain https://dl-cdn.alpinelinux.org/alpine/edge/main
			@edgecommunity https://dl-cdn.alpinelinux.org/alpine/edge/community
			@edgetesting https://dl-cdn.alpinelinux.org/alpine/edge/testing
		EOF
        echo_off

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

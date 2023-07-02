. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


case $(current_distro) in


    alpine)
        heading "Linking APK cache to hotbox state"
        echo_on
        mkdir -p $HOTBOX_STATE/alpine-package-cache
        ln -s $HOTBOX_STATE/alpine-package-cache /etc/apk/cache
        echo_off
        ;;


    ubuntu)
        heading "Linking APT cache to hotbox state"
        echo_on
        mkdir -p $HOTBOX_STATE/ubuntu-package-cache
        rm -rf /var/cache/apt
        ln -s $HOTBOX_STATE/ubuntu-package-cache /var/cache/apt
        rm -f /etc/apt/apt.conf.d/docker-clean
        echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' >> /etc/apt/apt.conf.d/hotbox-keep-packages
        echo 'APT::Keep-Downloaded-Packages "true";' >> /etc/apt/apt.conf.d/hotbox-keep-packages
        echo_off
        ;;


    void)
        heading "Linking XBPS cache to hotbox state"
        echo_on
        mkdir -p $HOTBOX_STATE/void-package-cache
        rm -rf /var/cache/xbps
        ln -s $HOTBOX_STATE/void-package-cache /var/cache/xbps
        echo_off
        ;;


    *)
        warn "Don't know how to cache packages on $(current_distro) os"
        ;;
esac

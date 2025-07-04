. $HOTBOX/lib/sh.sh
export HOTBOX_STATE="$(hotbox-state-init)"

if ! [ -d $HOTBOX_STATE/alpine-package-cache ] ; then
    heading "Creating Alpine package manager cache in hotbox state"
    echo_on
    mkdir -p $HOTBOX_STATE/alpine-package-cache
    echo_off
fi

if ! [ -d $HOTBOX_STATE/ubuntu-package-cache ] ; then
    heading "Creating Ubuntu package manager cache in hotbox state"
    echo_on
    mkdir -p $HOTBOX_STATE/ubuntu-package-cache
    echo_off
fi

if ! [ -d $HOTBOX_STATE/void-package-cache ] ; then
    heading "Creating Void package manager cache in hotbox state"
    echo_on
    mkdir -p $HOTBOX_STATE/void-package-cache
    echo_off
fi

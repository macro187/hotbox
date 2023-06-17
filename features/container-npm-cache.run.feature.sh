. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


if [ ! -d $HOTBOX_STATE/npm-package-cache ] ; then
    heading "Creating NPM package cache in hotbox state"
    echo_on
    mkdir -p $HOTBOX_STATE/npm-package-cache
    echo_off
fi

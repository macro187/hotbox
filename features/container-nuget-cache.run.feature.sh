. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


if ! [ -d $HOTBOX_STATE/nuget-package-cache ] ; then
    heading "Creating NuGet package cache in hotbox state"
    echo_on
    mkdir -p $HOTBOX_STATE/nuget-package-cache
    echo_off
fi

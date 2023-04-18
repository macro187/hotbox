. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


if ! [ -d $HOTBOX_STATE/nuget-packages ] ; then
    heading "Creating NuGet package cache in hotbox state"
    echo_on
    mkdir -p $HOTBOX_STATE/nuget-packages
    echo_off
fi

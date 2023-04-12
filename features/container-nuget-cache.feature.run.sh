. $HOTBOX/lib/sh.sh


if $HOTBOX/hotbox-in-container ; then
    hotbox_cache="/hotbox-cache"
else
    hotbox_cache="$HOME/.hotbox/cache"
fi


if ! [ -d $hotbox_cache/nuget-packages ] ; then
    heading "Creating NuGet package cache in hotbox cache"
    echo_on
    mkdir -p $hotbox_cache/nuget-packages
    echo_off
fi

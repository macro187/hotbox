. $HOTBOX/lib/spec.sh


feature dotnet-sdk

if [ "$HOTBOX_TARGET" = "container" ] ; then
    feature container-nuget-cache
fi

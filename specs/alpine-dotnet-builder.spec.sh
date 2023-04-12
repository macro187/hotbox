. $HOTBOX/specs/container.spec.sh

baseimage="alpine"
features="
    $features
    dotnet-sdk
    container-nuget-cache
"

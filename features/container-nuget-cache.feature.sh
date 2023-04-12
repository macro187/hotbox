. $HOTBOX/lib/sh.sh


heading "Linking NuGet package cache to hotbox cache"
echo_on
cd $HOME
mkdir -p .nuget
cd .nuget
ln -s /hotbox-cache/nuget-packages packages
echo_off

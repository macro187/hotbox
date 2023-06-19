. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


heading "Linking NuGet package cache to hotbox state"
echo_on
cd $HOME
mkdir -p .nuget
cd .nuget
mkdir -p $HOTBOX_STATE/nuget-package-cache
ln -s $HOTBOX_STATE/nuget-package-cache packages
echo_off

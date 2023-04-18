. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


heading "Linking NuGet package cache to hotbox state"
echo_on
cd $HOME
mkdir -p .nuget
cd .nuget
ln -s $HOTBOX_STATE/nuget-packages packages
echo_off

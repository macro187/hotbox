. $HOTBOX/lib/sh.sh
export HOTBOX_STATE="$(hotbox-state-init)"

heading "Linking NuGet package cache to hotbox state"
echo_on
cd $HOME
mkdir -p .nuget
cd .nuget
mkdir -p $HOTBOX_STATE/nuget-package-cache
ln -s $HOTBOX_STATE/nuget-package-cache packages
echo_off

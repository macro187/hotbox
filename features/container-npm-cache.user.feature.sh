. $HOTBOX/lib/sh.sh
export HOTBOX_STATE="$(hotbox-state-init)"

heading "Linking NPM package cache to hotbox state"
echo_on
cd $HOME
rm -rf .npm
mkdir -p $HOTBOX_STATE/npm-package-cache
ln -s $HOTBOX_STATE/npm-package-cache .npm
echo_off

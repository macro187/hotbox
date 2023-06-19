. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


cd $HOME


heading "Linking NPM package cache to hotbox state"
echo_on
rm -rf .npm
mkdir -p $HOTBOX_STATE/npm-package-cache
ln -s $HOTBOX_STATE/npm-package-cache .npm
echo_off

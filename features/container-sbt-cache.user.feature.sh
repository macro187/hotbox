. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


cd $HOME


heading "Linking sbt cache to hotbox state"
echo_on
rm -rf .sbt
mkdir -p $HOTBOX_STATE/sbt-cache
ln -s $HOTBOX_STATE/sbt-cache .sbt
echo_off

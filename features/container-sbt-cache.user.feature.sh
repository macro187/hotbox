. $HOTBOX/lib/sh.sh
export HOTBOX_STATE="$(hotbox-state-init)"

heading "Linking sbt cache to hotbox state"
echo_on
cd $HOME
rm -rf .sbt
mkdir -p $HOTBOX_STATE/sbt-cache
ln -s $HOTBOX_STATE/sbt-cache .sbt
echo_off

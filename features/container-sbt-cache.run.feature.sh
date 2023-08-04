. $HOTBOX/lib/sh.sh
. $HOTBOX/lib/state.sh


if [ ! -d $HOTBOX_STATE/sbt-cache ] ; then
    heading "Creating sbt cache in hotbox state"
    echo_on
    mkdir -p $HOTBOX_STATE/sbt-cache
    echo_off
fi

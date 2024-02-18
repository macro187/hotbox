. $HOTBOX/lib/spec.sh


include interactive

include _git
include _docker

if [ "$HOTBOX_TARGET" = "container" ] ; then
    feature container-workspace
fi

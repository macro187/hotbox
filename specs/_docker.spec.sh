. $HOTBOX/lib/spec.sh


if [ "$HOTBOX_TARGET" = "container" ] ; then
    feature container-docker-group
    feature container-host-docker
fi

feature docker-cli

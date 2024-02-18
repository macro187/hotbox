. $HOTBOX/lib/spec.sh


include base

feature man

if [ "$HOTBOX_TARGET" = "container" ] ; then
    feature container-personal-configs
fi

feature personal-inputrc
feature personal-bashrc

if [ "$HOTBOX_TARGET" = "container" ] ; then
    feature container-host-term
    feature container-host-x11
fi

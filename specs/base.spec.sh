. $HOTBOX/lib/spec.sh


if [ "$HOTBOX_TARGET" = "container" ] ; then
    include _alpine
    feature container-package-manager-cache
    feature container-initialise
fi

feature package-manager
feature base-tools

if [ "$HOTBOX_TARGET" = "container" ] ; then
    feature container-user
fi

feature doas
feature profile.d
feature shrc.d
feature inputrc
feature user-bin-directory

if [ "$HOTBOX_TARGET" = "container" ] ; then
    feature container-hotbox
fi

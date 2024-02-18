. $HOTBOX/lib/spec.sh


feature git
feature personal-gitconfig

if [ "$HOTBOX_TARGET" = "container" ] ; then
    feature container-host-git-credentials
fi

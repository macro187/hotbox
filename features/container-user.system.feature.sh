. $HOTBOX/lib/sh.sh


test -n "${HOTBOX_USER:-}" || die "HOTBOX_USER not set"
test -n "${HOTBOX_UID:-}" || die "HOTBOX_UID not set"
test -n "${HOTBOX_GID:-}" || die "HOTBOX_GID not set"


existing_user="$(id -un $HOTBOX_UID || true)"
if [ -n "$existing_user" ] ; then
    echo_on
    userdel -r "$existing_user"
    echo_off
    if [ -d /home/$existing_user ] ; then
        echo_on
        mv /home/$existing_user /home/$existing_user.orig
        echo_off
    fi
fi


if which adduser >/dev/null 2>&1 && which addgroup >/dev/null 2>&1 ; then
    echo_on
    addgroup --gid $HOTBOX_GID $HOTBOX_USER
    adduser --disabled-password --uid $HOTBOX_UID --ingroup $HOTBOX_USER $HOTBOX_USER
    echo_off
elif which useradd >/dev/null 2>&1 && which groupadd >/dev/null 2>&1 ; then
    echo_on
    groupadd --gid $HOTBOX_GID $HOTBOX_USER
    useradd --uid $HOTBOX_UID -g $HOTBOX_USER $HOTBOX_USER
    mkdir /home/$HOTBOX_USER
    cp -rT /etc/skel /home/$HOTBOX_USER
    chown -R $HOTBOX_USER:$HOTBOX_USER /home/$HOTBOX_USER
    echo_off
else
    die "Neither adduser/addgroup nor useradd/groupadd are present"
fi

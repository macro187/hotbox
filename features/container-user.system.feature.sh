. $HOTBOX/lib/sh.sh


test -n "${HOTBOX_USER:-}" || die "HOTBOX_USER not set"
test -n "${HOTBOX_UID:-}" || die "HOTBOX_UID not set"
test -n "${HOTBOX_GID:-}" || die "HOTBOX_GID not set"


if which adduser >/dev/null 2>&1 && which addgroup >/dev/null 2>&1 ; then
    echo_on
    addgroup --gid $HOTBOX_GID $HOTBOX_USER
    adduser --disabled-password --uid $HOTBOX_UID --ingroup $HOTBOX_USER $HOTBOX_USER
    echo_off
elif which useradd >/dev/null 2>&1 && which groupadd >/dev/null 2>&1 ; then
    echo_on
    groupadd --gid $HOTBOX_GID $HOTBOX_USER
    useradd --uid $HOTBOX_UID -g $HOTBOX_USER $HOTBOX_USER
    echo_off
else
    die "Neither adduser/addgroup nor useradd/groupadd are present"
fi

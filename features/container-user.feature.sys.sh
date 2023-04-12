. $HOTBOX/lib/sh.sh


test -n "${HOTBOX_USER:-}" || die "HOTBOX_USER not set"
test -n "${HOTBOX_UID:-}" || die "HOTBOX_UID not set"
test -n "${HOTBOX_GID:-}" || die "HOTBOX_GID not set"


echo_on
addgroup --gid $HOTBOX_GID $HOTBOX_USER
adduser --disabled-password --uid $HOTBOX_UID --ingroup $HOTBOX_USER $HOTBOX_USER
echo_off

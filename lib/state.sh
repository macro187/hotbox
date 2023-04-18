test -n "${__hotbox_state:+x}" && return ; __hotbox_state=1


. $HOTBOX/lib/sh.sh


HOTBOX_STATE="${HOTBOX_STATE:-}"


if [ -z "$HOTBOX_STATE" ] ; then
    ! $HOTBOX/hotbox-in-container || die "In container but HOTBOX_STATE not set"

    HOTBOX_STATE="$HOME/.hotbox-state"
    if ! [ -d $HOTBOX_STATE ] ; then
        heading "Creating hotbox state directory"
        echo_on
        mkdir -p $HOTBOX_STATE
        echo_off
    fi
fi

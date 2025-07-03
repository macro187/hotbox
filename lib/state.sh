test -n "${__hotbox_state:+x}" && return ; __hotbox_state=1


. "$HOTBOX/lib/sh.sh"


#
# Path to directory containing hotbox state
#
HOTBOX_STATE="${HOTBOX_STATE:-}"


_init_state() {
    if "$HOTBOX/lib/hotbox-in-container" && [ ! "$HOTBOX_STATE" ] ; then
        die "In container but HOTBOX_STATE not set"
    fi
    if [ "$HOTBOX_STATE" ] && [ ! -d "$HOTBOX_STATE" ] ; then
        die "Specified HOTBOX_STATE location doesn't exist: $HOTBOX_STATE"
    fi
    if [ ! "$HOTBOX_STATE" ] ; then
        HOTBOX_STATE="$HOME/.hotbox-state"
    fi
    if [ ! -d "$HOTBOX_STATE" ] ; then
        heading "Creating hotbox state directory"
        echo_on
        mkdir -p "$HOTBOX_STATE"
        echo_off
    fi
}
_init_state

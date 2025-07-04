test -n "${__hotbox_invocation:+x}" && return ; __hotbox_invocation=1


hotbox-state-init
hotbox_state="$(hotbox-state-path)"


#
# Path to location for hotbox state specific to this command invocation
#
# Deleted automatically when the including command exits.
#
HOTBOX_INVOCATION="$hotbox_state/invocations/$$"


_init_invocation() {
    rm -rf "$HOTBOX_INVOCATION"
    mkdir -p "$HOTBOX_INVOCATION"
    trap 'rm -rf "$HOTBOX_INVOCATION"' EXIT
}
_init_invocation

test -n "$HOTBOX_SPEC" || return 0
test -f $HOTBOX/specs/$HOTBOX_SPEC.sh || die "Spec $HOTBOX_SPEC not found"

_baseimage="${HOTBOX_BASEIMAGE:-}"
_features="${HOTBOX_FEATURES:-}"
_shell="${HOTBOX_SHELL:-}"
_workdir="${HOTBOX_WORKDIR:-}"

HOTBOX_BASEIMAGE=""
HOTBOX_FEATURES=""
HOTBOX_SHELL=""
HOTBOX_WORKDIR=""
. $HOTBOX/specs/$HOTBOX_SPEC.sh


HOTBOX_BASEIMAGE="${_baseimage:-$HOTBOX_BASEIMAGE}"
HOTBOX_FEATURES="${HOTBOX_FEATURES}${_features:+ $_features}"
HOTBOX_SHELL="${_shell:-$HOTBOX_SHELL}"
HOTBOX_WORKDIR="${_workdir:-$HOTBOX_WORKDIR}"

test -n "$HOTBOX_SPEC" || return 0
test -f $HOTBOX/specs/$HOTBOX_SPEC.sh || die "Spec $HOTBOX_SPEC not found"

_baseimage="${HOTBOX_BASEIMAGE:-}"
_features="${HOTBOX_FEATURES:-}"
_workdir="${HOTBOX_WORKDIR:-}"
_shell="${HOTBOX_SHELL:-}"
_shellarg="${HOTBOX_SHELLARG:-}"

HOTBOX_BASEIMAGE=""
HOTBOX_FEATURES=""
HOTBOX_WORKDIR=""
HOTBOX_SHELL=""
HOTBOX_SHELLARG=""
. $HOTBOX/specs/$HOTBOX_SPEC.sh


HOTBOX_BASEIMAGE="${_baseimage:-$HOTBOX_BASEIMAGE}"
HOTBOX_FEATURES="${HOTBOX_FEATURES}${_features:+ $_features}"
HOTBOX_WORKDIR="${_workdir:-$HOTBOX_WORKDIR}"
if [ -n "$_shell" ] ; then
    HOTBOX_SHELL="$_shell"
    HOTBOX_SHELLARG="$_shellarg"
fi

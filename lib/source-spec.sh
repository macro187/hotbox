test -n "$spec" || return 0
test -f $HOTBOX/specs/$spec.sh || die "Spec $spec not found"

_baseimage="${baseimage:-}"
_features="${features:-}"
_workdir="${workdir:-}"
_shell="${shell:-}"
_shellarg="${shellarg:-}"

baseimage=""
features=""
workdir=""
shell=""
shellarg=""
. $HOTBOX/specs/$spec.sh


baseimage="${_baseimage:-$baseimage}"
features="${features}${_features:+ $_features}"
workdir="${_workdir:-$workdir}"
if [ -n "$_shell" ] ; then
    shell="$_shell"
    shellarg="$_shellarg"
fi

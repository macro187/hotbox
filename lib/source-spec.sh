test -n "$spec" || return 0
test -f $HOTBOX/specs/$spec.spec.sh || die "Spec $spec not found"


#
# Remember current specifications
#
_baseimage="${baseimage:-}"
_features="${features:-}"
_workdir="${workdir:-}"
_shell="${shell:-}"
_shellarg="${shellarg:-}"


#
# Source specifications from spec
#
baseimage=""
features=""
workdir=""
shell=""
shellarg=""
. $HOTBOX/specs/$spec.spec.sh


#
# Layer previous specifications back on top
#
baseimage="${_baseimage:-$baseimage}"
features="${features}${_features:+ $_features}"
features="$(echo $features)"
workdir="${_workdir:-$workdir}"
if [ -n "$_shell" ] ; then
    shell="$_shell"
    shellarg="$_shellarg"
fi

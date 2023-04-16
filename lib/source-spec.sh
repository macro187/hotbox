. $HOTBOX/lib/sh.sh


test -n "${spec_script:-}" || die "no spec_script specified"


#
# Remember current specifications
#
_baseimage="${baseimage:-}"
_features="${features:-}"
_workdir="${workdir:-}"
_shell="${shell:-}"
_shellarg="${shellarg:-}"


#
# Clear specifications
#
baseimage=""
features=""
workdir=""
shell=""
shellarg=""


#
# Source specifications from spec
#
. $spec_script


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

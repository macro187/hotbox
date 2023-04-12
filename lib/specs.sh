test -n "${__hotbox_specs:+x}" && return ; __hotbox_specs=1


read_spec() {
    spec="${1:?expected <spec>}"

    #
    # Remember current specifications
    #
    local _baseimage="${baseimage:-}"
    local _features="${features:-}"
    local _workdir="${workdir:-}"
    local _shell="${shell:-}"
    local _shellarg="${shellarg:-}"

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
}

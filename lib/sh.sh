test -n "${__hotbox_sh:+x}" && return ; __hotbox_sh=1


alias echo_on="set -x"
alias echo_off="{ set +x ; } 2>/dev/null"
alias checkpipe="{ ec=\$? ; test \$ec -eq 141 || (exit \$ec) ; }"


info() {
    echo $@ >&2
}


warn() {
    info "Warning:" $@
}


die() {
    info
    info "Error:" $@
    exit 1
}


heading() {
    info
    info "==> $1"
}


current_user() {
    test -n "${__current_user:+x}" || __current_user="$(id -un)"
    echo $__current_user
}


current_uid() {
    test -n "${__current_uid:+x}" || __current_uid="$(id -u)"
    echo $__current_uid
}


current_gid() {
    test -n "${__current_gid:+x}" || __current_gid="$(id -g)"
    echo $__current_gid
}


current_distro() {
    if [ -z "${__current_distro:-}" ] ; then
        if grep -q '^NAME="Alpine Linux"' /etc/os-release ; then
            __current_distro="alpine"
        elif grep -q '^NAME="Ubuntu"' /etc/os-release ; then
            __current_distro="ubuntu"
        elif grep -q '^NAME="[Vv]oid"' /etc/os-release ; then
            __current_distro="void"
        else
            __current_distro="unknown"
        fi
    fi
    echo $__current_distro
}


function_exists() {
    test -n "$1" || die "Expected <function_name>"
    type "$1" 2>/dev/null | grep -Fq function
}

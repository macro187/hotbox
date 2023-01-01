test -n "${__macro_sh:+x}" && return ; __macro_sh=1


alias echo_on="set -x"
alias echo_off="{ set +x ; } 2> /dev/null"


info() {
    echo $@ >&2
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

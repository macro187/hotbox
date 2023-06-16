test -n "${__hotbox_spec:+x}" && return ; __hotbox_spec=1


. $HOTBOX/lib/sh.sh


include() {
    echo include:$1
}


baseimage() {
    echo baseimage:$1
}


shell() {
    echo shell:$1
}


shellarg() {
    echo shellarg:$1
}


feature() {
    echo feature:$1
}

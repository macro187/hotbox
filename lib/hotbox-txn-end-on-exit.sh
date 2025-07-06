. $HOTBOX/lib/sh.sh

if [ "$(basename "${HOTBOX_TXN:-}")" = "$(uname -n).$$" ] ; then
    trap "echo_off ; exit 1" INT
    trap "hotbox-txn-end $$ ; unset -v HOTBOX_TXN" EXIT
fi

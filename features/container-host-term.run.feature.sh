if [ -n "${TERM:-}" ] ; then
    echo --env "TERM=$TERM"
    echo --env "COLORTERM=$COLORTERM"
fi

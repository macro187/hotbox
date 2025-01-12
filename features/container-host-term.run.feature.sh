if [ "${TERM:-}" ] ; then
    echo --env "TERM=$TERM"
fi

if [ "${COLORTERM:-}" ] ; then
    echo --env "COLORTERM=$COLORTERM"
fi

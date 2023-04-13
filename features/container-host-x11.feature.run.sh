if [ -d /tmp/.X11-unix ] ; then
    echo --volume /tmp/.X11-unix:/tmp/.X11-unix
fi


if [ -n "${DISPLAY:-}" ] ; then
    echo --env DISPLAY=$DISPLAY
fi

if [ -S /var/run/docker.sock ] ; then
    echo --volume /var/run/docker.sock:/var/run/docker.sock
fi

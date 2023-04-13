. $HOTBOX/lib/sh.sh


if [ -f $HOME/.git-credentials ] ; then
    echo --volume $HOME/.git-credentials:/home/$(current_user)/.git-credentials
fi

. $HOTBOX/lib/sh.sh


cd $HOME


if [ ! -d $HOME/cook ] ; then
    heading "Cloning cook"
    echo_on
    $HOTBOX/lib/hotbox-git-clone-cached https://github.com/macro187/cook.git
    echo_off
fi


heading "Adding cook to path"
echo_on
rm -f .profile.d/??-cook.sh
cat << EOF >>.profile.d/50-cook.sh
PATH="$HOME/cook:\$PATH"
EOF
echo_off

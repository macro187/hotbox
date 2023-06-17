. $HOTBOX/lib/sh.sh


if ! which node >/dev/null ; then
    heading "Installing Node.js and NPM"
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add nodejs nodejs-doc npm npm-doc
            echo_off
            ;;

        ubuntu)
            echo_on
            doas \
                env DEBIAN_FRONTEND=noninteractive \
                apt install -y --no-install-recommends nodejs npm
            echo_off
            ;;

        *)
            die "Don't know how to install node on $(current_distro) os"
            ;;
    esac
fi


cd $HOME


if [ ! -d .npm-global ] ; then
    heading "Creating global NPM prefix in user home directory"
    echo_on
    mkdir .npm-global
    echo_off
fi


heading "Configuring global NPM prefix"
echo_on
npm config set prefix "$HOME/.npm-global"
echo_off


heading "Adding global NPM bin/ directory to PATH"
echo_on
rm -f .profile.d/??-npm.sh
echo 'PATH="$HOME/.npm-global/bin:$PATH"' >.profile.d/50-npm.sh
echo_off

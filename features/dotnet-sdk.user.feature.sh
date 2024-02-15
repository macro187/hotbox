. $HOTBOX/lib/sh.sh


if ! which dotnet >/dev/null ; then
    case $(current_distro) in

        alpine)
            echo_on
            doas apk add dotnet7-sdk
            echo_off
            ;;

        ubuntu)
            echo_on
            doas env DEBIAN_FRONTEND=noninteractive \
                apt install -y --no-install-recommends dotnet-sdk-7.0
            echo_off
            ;;

        *)
            die "Don't know how to install .NET SDK on $(current_distro) os"
            ;;
    esac
fi


info "Shutting up dotnet welcome message"
echo_on
dotnet help &>/dev/null
echo_off


info "Writing .profile.d/50-dotnet-roll-forward.sh"
echo_on
rm -f .profile.d/??-dotnet-roll-forward.sh
cat << 'EOF' >.profile.d/50-dotnet-roll-forward.sh
    # Always run on the latest installed .NET framework
    export DOTNET_ROLL_FORWARD="LatestMajor"
EOF
echo_off

. $HOTBOX/lib/sh.sh


cd $HOME


#
# Install vscode
#
install_ubuntu() {
    # Download .deb
    if ! [ -f vscode.deb ] ; then
        echo_on
        doas env DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends curl
        curl -L https://go.microsoft.com/fwlink/?LinkID=760868 --output vscode.deb
        echo_off
    fi

    # Install .deb
    echo_on
    # dpkg whinges if gpg isn't present
    doas env DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends gpg
    doas env DEBIAN_FRONTEND=noninteractive apt install -y ./vscode.deb
    rm vscode.deb
    echo_off

    # Write wrapper script
    echo_on
    cat >bin/code <<-"EOF"
		#!/bin/sh
		/usr/bin/code --no-sandbox --disable-gpu $@
	EOF
    chmod u+x bin/code
    echo_off
}


if ! which code >/dev/null ; then
    info "Visual Studio Code not found on system, installing"
    case $(current_distro) in
        ubuntu)
            install_ubuntu
            ;;
        *)
            die "Don't know how to install vscode on $(current_distro) os"
            ;;
    esac
fi

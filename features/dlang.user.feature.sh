. $HOTBOX/lib/sh.sh


setup_alpine() {
    heading "Installing gcc"
    info "(The dmd compiler uses the GCC linker)"
    echo_on
    doas apk add gcc gcc-doc
    echo_off

    heading "Installing libc dev files"
    info "(D programs usually directly or indirectly use libc)"
    echo_on
    doas apk add musl-dev
    echo_off

    heading "Installing dmd compiler"
    echo_on
    doas apk add dmd@edgecommunity dmd-doc@edgecommunity
    echo_off

    heading "Installing dub build tool"
    echo_on
    doas apk add dub@edgecommunity dub-doc@edgecommunity
    echo_off
}


setup=setup_$(current_distro)
function_exists $setup || die "Don't know how to install dlang on $(current_distro) os"
$setup

test -n "${__hotbox_sources:+x}" && return ; __hotbox_sources=1


. "$HOTBOX/lib/sh.sh"
HOTBOX_TXN="${HOTBOX_TXN:?HOTBOX_TXN not set}"


#
# Path to a directory containing all hotbox sources (features and specs)
# currently in effect
#
# If already set, that location is in effect and no further processing is done.
#
# If not already set, a default sources directory will be assembled from sources
# included with hotbox plus any additional locations specified in HOTBOX_PATH.
# This default sources directory is located under the current txn state directory
# which is deleted automatically when the including script exits.
#
# If set to something different later, the new location takes effect at that
# time.
#
export HOTBOX_SOURCES="${HOTBOX_SOURCES:-}"


#
# Add sources to the current HOTBOX_SOURCES directory
#
# $1 - Path to directory containing hotbox sources
#
add_sources() {
    local source="${1%/}"
    [ "$HOTBOX_SOURCES" = "$_hotbox_sources_default" ] \
        || die "Can't add_sources() to non-default HOTBOX_SOURCES: $HOTBOX_SOURCES"
    [ "$source" ] \
        || die "Expected source directory"
    [ -d "$source" ] \
        || die "Source directory does not exist: $source"

    cp -f "$source"/*.spec.sh "$source"/*.feature.sh "$HOTBOX_SOURCES" 2>/dev/null || true
}


_hotbox_sources_default="$HOTBOX_TXN/sources"


_init_sources() {
    [ ! "$HOTBOX_SOURCES" ] || return 0

    HOTBOX_SOURCES="$_hotbox_sources_default"

    rm -rf "$HOTBOX_SOURCES"
    mkdir -p "$HOTBOX_SOURCES"

    add_sources "$HOTBOX/specs"
    add_sources "$HOTBOX/features"
    for source in $(hotbox-paths) ; do
        add_sources "$source"
    done
}
_init_sources

test -n "${__hotbox_path:+x}" && return ; __hotbox_path=1


. "$HOTBOX/lib/sh.sh"


#
# Colon-separated list of paths to additional locations to include hotbox
# sources (i.e. features and specs) from, in decreasing priority order
#
HOTBOX_PATH="${HOTBOX_PATH:-}"


#
# Get list of HOTBOX_PATH entries in increasing priority order
#
get_hotbox_paths() {
    #
    # TODO Handle spaces in paths
    #
    local sources
    sources="$(echo "$HOTBOX_PATH" | tr ':' ' ')"
    sources="$(reverse $sources)"
    echo "$sources"
}

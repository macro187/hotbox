HOTBOX_SHELL="/bin/sh"
HOTBOX_WORKDIR="/workspace"
HOTBOX_FEATURES="
    $HOTBOX_FEATURES
    early-container
    early-package-manager-cache
    early-user
    early-docker-group
    early-doas
    workspace
"

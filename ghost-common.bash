GHOST="/ghost"
OVERRIDE="/ghost-override"

CONFIG="config.js"
DATA="content/data"
IMAGES="content/images"
THEMES="content/themes"

# Paramters for creating the ghost user/group
GHOST_USER="ghost"
GHOST_GROUP="$GHOST_USER"
: ${GHOST_UID:=1000}
: ${GHOST_GID:=1000}

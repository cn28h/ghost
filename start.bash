#!/bin/bash

#
# start.bash
#
. /ghost-common

cd "$GHOST"

mkdir -p "$OVERRIDE/$DATA" "$OVERRIDE/$IMAGES" "$OVERRIDE/$THEMES"

if [[ ! -f "$OVERRIDE/$CONFIG" ]]; then
    cp "${CONFIG}.orig" "$OVERRIDE/$CONFIG"
fi

for theme in $(find "${THEMES}.orig" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
do
    if [[ ! -d "$OVERRIDE/$THEMES/$theme" ]]
    then
	cp -ar "${THEMES}.orig/$theme" "$OVERRIDE/$THEMES"
    fi
done

groupmod -g "$GHOST_GID" "$GHOST_GROUP"
usermod -u  "$GHOST_UID" "$GHOST_USER"

chown -R "$GHOST_USER":"$GHOST_GROUP" "$OVERRIDE"

exec su "$GHOST_USER" -c "exec npm start"

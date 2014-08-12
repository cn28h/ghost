#!/bin/bash

set -xe

. /ghost-common 

cd /tmp
wget https://ghost.org/zip/ghost-latest.zip
unzip ghost-latest.zip -d /ghost
rm -f ghost-latest.zip
cd /ghost
npm install --production
sed 's/127.0.0.1/0.0.0.0/' /ghost/config.example.js > /ghost/config.js

cd "$GHOST"

# Symlink data directory.
rm -fr "$DATA"
ln -s "$OVERRIDE/$DATA" "content"

# Symlink images directory
rm -fr "$IMAGES"
ln -s "$OVERRIDE/$IMAGES" "$IMAGES"

# Symlink config file.
mv "$CONFIG" "${CONFIG}.orig"
ln -s "$OVERRIDE/$CONFIG" "$CONFIG"

# Symlink themes
mv "$THEMES" "${THEMES}.orig"
ln -s "$OVERRIDE/$THEMES" "$THEMES"

groupadd -g "$GHOST_GID" "$GHOST_GROUP"
useradd -d "$OVERRIDE" -u "$GHOST_UID" -g "$GHOST_GROUP" "$GHOST_USER"

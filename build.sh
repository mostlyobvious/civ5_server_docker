#!/bin/bash

# Bail out if any command fails
set -e

# Fetch the dir where this bash script is
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

sudo cp "$DIR/server/GraphicsSettingsDX9.ini" "$DIR/civ5save/GraphicsSettingsDX9.ini"
sudo cp "$DIR/server/UserSettings.ini" "$DIR/civ5save/UserSettings.ini"

# Build the container
docker build -t civ5server "$DIR/server"

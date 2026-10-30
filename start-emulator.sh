#!/bin/sh
# Startup script for rAthena/Hercules emulator

# Install dependencies
apk add --no-cache git bash

# Set default values if not provided
EMULATOR_TYPE=${EMULATOR_TYPE:-rathena}
INSTALL_PATH=${INSTALL_PATH:-/opt/rathena}
GIT_REPO=${GIT_REPO:-https://github.com/rathena/rathena}
GIT_BRANCH=${GIT_BRANCH:-master}

# Clone or update the emulator
if [ ! -d "${INSTALL_PATH}/.git" ]; then
  echo "Cloning ${EMULATOR_TYPE} emulator..."
  git clone --depth 1 -b ${GIT_BRANCH} ${GIT_REPO} ${INSTALL_PATH}
else
  echo "Updating ${EMULATOR_TYPE} emulator..."
  cd ${INSTALL_PATH} && git pull
fi

echo "Installation complete at ${INSTALL_PATH}"

# Start the HTTP server
cd ${INSTALL_PATH} && python3 -m http.server 8080 &
wait
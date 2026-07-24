#!/bin/bash

set -e

# Repository information
REPO="mindfiredigital/gpx"

echo "Installing GPX..."

# Determine OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     target_os=linux;;
    Darwin*)    target_os=darwin;;
    *)          echo "Unsupported OS: ${OS}"; exit 1;;
esac

# Determine architecture
ARCH="$(uname -m)"
case "${ARCH}" in
    x86_64|amd64)   target_arch=x64;;
    aarch64|arm64)  target_arch=arm64;;
    *)              echo "Unsupported architecture: ${ARCH}"; exit 1;;
esac

BINARY_NAME="gpx-${target_os}-${target_arch}"

echo "Detected OS: ${target_os}"
echo "Detected Arch: ${target_arch}"

# Construct download URL
DOWNLOAD_URL="https://github.com/${REPO}/releases/latest/download/${BINARY_NAME}"

# Define installation directory
INSTALL_DIR="/usr/local/bin"
DEST="${INSTALL_DIR}/gpx"

echo "Downloading latest version of GPX from ${DOWNLOAD_URL}..."

# Download binary to a temporary location
TMP_FILE=$(mktemp)
if ! curl -# -fSL "$DOWNLOAD_URL" -o "$TMP_FILE"; then
    echo "Error: Failed to download binary from $DOWNLOAD_URL"
    rm -f "$TMP_FILE"
    exit 1
fi

chmod 0755 "$TMP_FILE"

# Move to install directory
echo "Installing to ${DEST}..."
if [ -w "$INSTALL_DIR" ]; then
    mv "$TMP_FILE" "$DEST"
else
    echo "Administrative privileges are required to install to ${INSTALL_DIR}."
    sudo mv "$TMP_FILE" "$DEST"
fi

echo ""
echo "GPX was installed successfully!"
echo "Run 'gpx --help' to get started."

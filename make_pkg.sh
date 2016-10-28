#!/bin/bash


source codesign_environment.sh

PROJECT_NAME="$1"
PKG_IDENTIFIER="$2"
PKG_INSTALL_ROOT="$3"
VERSION="$4"
OUTPUT_FILE="$5"

pkgbuild --root "$PKG_INSTALL_ROOT"  --install-location / --sign "${INSTALLER_CERT}" --version "${VERSION}" --identifier "${PKG_IDENTIFIER}"  "${OUTPUT_FILE}"


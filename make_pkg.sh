#!/bin/bash


source codesign_environment.sh

PROJECT_NAME="$1"
PKG_IDENTIFIER="$2"
PKG_INSTALL_ROOT="$3"
VERSION="$4"
TIMESTAMP=`date +%Y%m%d%H%M`

if [ "" == "$5" ]
then
	OUTPUT_FILE="${PROJECT_NAME}-${VERSION}-${TIMESTAMP}.pkg"
else
	OUTPUT_FILE="$5"
fi

mkdir -p scripts
F=scripts/preinstall
echo "#!/bin/bash" > $F
echo "VER=${VERSION}-${TIMESTAMP}" >> $F
echo "MODULE=${PROJECT_NAME}" >> $F
echo 'LATEST_VER=`curl --  "https://universalss7.ch/version.php?version=${VER}&os=macos&module=${MODULE}" 2> /dev/null `' >> $F
echo "exit 0" >> $F
chmod 755 $F

if [ "${INSTALLER_CERT}" == "" ]
then
	pkgbuild --root "$PKG_INSTALL_ROOT"  --ownership recommended --install-location / ${CODESIGN} --scripts=scripts --version "${VERSION}" --identifier "${PKG_IDENTIFIER}"  "${OUTPUT_FILE}"
else
	pkgbuild --root "$PKG_INSTALL_ROOT"  --ownership recommended --install-location / ${CODESIGN} --scripts=scripts --sign "${INSTALLER_CERT}" --version "${VERSION}" --identifier "${PKG_IDENTIFIER}"  "${OUTPUT_FILE}"
fi



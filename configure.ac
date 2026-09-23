dnl /* ==================================================================== 
dnl  * Project "ulibgsmmap"
dnl  * Copyright © 2026 Andreas Fink (andreas@fink.org). All rights reserved.
dnl  * ==================================================================== 
dnl  */ 

dnl
dnl configure.ac -- main autoconf macro definition file
dnl
dnl Process this file with autoconf to produce a configure script.
dnl


dnl -----------------------------------------
dnl initialization
dnl -----------------------------------------

AC_PREREQ([2.69])
AC_INIT([ulibgsmmap],[1.0],[afink])
AC_SUBST(SHELL)
AC_CONFIG_AUX_DIR(.)
AC_SET_TERMINAL_SEQUENCES()

dnl -----------------------------------------
dnl generic parameters
dnl -----------------------------------------

COPYRIGHT="Copyright 2026 Andreas Fink"
PROJECT_NAME="ulibgsmmap"
AUTHOR="Andreas Fink <andreas@fink.org>"
CONFIG_DEFINE="ULIBGSMMAP_CONFIG"

dnl -----------------------------------------
dnl Check version number
dnl -----------------------------------------
./make_version
VERSION=`head -n 1 VERSION`
MAJORVER=`echo $VERSION | cut -f1 -d.`
MINORVER=`echo $VERSION | cut -f2 -d.`
REVISION=`echo $VERSION | cut -f3 -d.`
ULIBMTP3_VERSION=`head -n 1 VERSION`

dnl -----------------------------------------
dnl Set user who runs ./configure
dnl -----------------------------------------

CUSER=`id -un`

dnl -----------------------------------------
dnl tools
dnl -----------------------------------------
EXE_EXT=""
LIBTOOL="ar -rcs"
RANLIB="ranlib"
LIBS=
LIBRARY_NAME=$PROJECT_NAME
BUILD_DIR=.
#
# we require clang over gcc
#
if [[ "$CC" == "" ]]
then
	CC=clang
fi
if [[ "$CXX" == "" ]]
then 
	CXX=clang++
fi

dnl -----------------------------------------
dnl setting up dependencies
dnl -----------------------------------------

DEPENDENT_PKGCONFIGS="ulibtcap"

dnl -----------------------------------------
dnl main work
dnl -----------------------------------------

AC_CONFIG_SECTION([Configuring for $PROJECT_NAME version $VERSION])

dnl Checks system type.
AC_CONFIG_SECTION([Running system checks])
AC_CANONICAL_HOST

case "$host" in
  *apple-darwin*) 
  	#  set(CMAKE_CXX_FLAGS "--sysroot ${CMAKE_OSX_SYSROOT} ${CMAKE_CXX_FLAGS}")
  	if [[ "${SDK}" == "" ]] 
  	then
		SDK=/Library/Developer/CommandLineTools/SDKs/MacOSX26.5.sdk
	fi
	if [[ -d "${SDK}" ]]
    then
		CFLAGS="--sysroot ${SDK} ${CFLAGS}"
		LDFLAGS="${LDFLAGS} -L ${SDK}/usr/lib"
	fi
	if [[ "${ARCH}" == "" ]]
	then
	    ARCH="-arch arm64 -arch x86_64"
	fi
	if [[ "${MACOSX_DEPLOYMENT_TARGET}" == "" ]]
	then
		MACOSX_DEPLOYMENT_TARGET=12.4
	fi
   	CFLAGS="${CFLAGS} `pkg-config  --cflags ${DEPENDENT_PKGCONFIGS}`"
	LDFLAGS="${LDFLAGS} `pkg-config --libs ${DEPENDENT_PKGCONFIGS}`"
    UR="`uname -r | cut -f1 -d.`"
    DONE=0
	if [[ -d "${SDK}" ]]
    then
		CFLAGS="${CFLAGS} --sysroot ${SDK} ${CFLAGS}"
		LDFLAGS="${LDFLAGS} -L ${SDK}/usr/lib"
	fi
	if [[ "${MACOSX_DEPLOYMENT_TARGET}" != "" ]]
	then
		CFLAGS="${CFLAGS} -mmacos-version-min=${MACOSX_DEPLOYMENT_TARGET}"
		LDFLAGS="${LDFLAGS} -mmacos-version-min=${MACOSX_DEPLOYMENT_TARGET}"
	fi
	CFLAGS="$CFLAGS -fobjc-arc -D_REENTRANT=1 -DDARWIN=1 -Iinclude ${ARCH}"
    LDFLAGS="${LDFLAGS} -F/Library/Frameworks -framework Foundation -framework Security -framework IOKit"
    BUILD_DIR="build/osx"
    SHARED_LIBRARY_EXTENSION="dylib"
    INSTALL_NAME_TOOL="install_name_tool"
    SHARED_FLAGS="-dynamiclib -Wl,-dylib"
    LDFLAGS="$LDFLAGS ${ARCH}"
    LIBTOOL="libtool -static -o"
    ;;

  *-linux-*)
	CFLAGS="${CFLAGS} -fobjc-arc -fPIC -DLINUX -D_XOPEN_SOURCE=700 -D_DEFAULT_SOURCE"
	CFLAGS="$CFLAGS `gnustep-config  --objc-flags`"
    LDFLAGS="$LDFLAGS `gnustep-config --base-libs --objc-libs`"
	#LIBRARIES="-lulib"
	CFLAGS="$CFLAGS `pkg-config  --cflags ${DEPENDENT_PKGCONFIGS}`"
	LDFLAGS="$LDFLAGS `pkg-config --libs ${DEPENDENT_PKGCONFIGS}`"
  	SHARED_LIBRARY_EXTENSION="so"
  	;;

  *-freebsd*)
	PATH=/opt/buildtools:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/GNUstep/System/Tools
	PKG_CONFIG_PATH=/usr/local/lib/pkg-config:/usr/libdata/pkgconfig:/usr/local/libdata/pkgconfig/
	CFLAGS="$CFLAGS -std=c99 -fPIC -DFREEBSD"
	FREEBSD_VERSION=`uname -r`
	SHARED_LIBRARY_EXTENSION="so"
	CFLAGS="$CFLAGS `gnustep-config  --objc-flags`"
    LDFLAGS="$LDFLAGS `gnustep-config  --base-libs --objc-libs`"
	CFLAGS="$CFLAGS `pkg-config  --cflags ${DEPENDENT_PKGCONFIGS}`"
	LDFLAGS="$LDFLAGS `pkg-config --libs ${DEPENDENT_PKGCONFIGS}`"
	LIBRARIES=""
	;;
esac


AC_SUBST(EXE_EXT)
AC_SUBST(LIBTOOL)
AC_SUBST(RANLIB)
AC_ARG_WITH(cflags,
[  --with-cflags=FLAGS     use FLAGS for CFLAGS],
CFLAGS="$CFLAGS $withval")

AC_ARG_WITH(libs,
[  --with-libs=FLAGS       use FLAGS for extra libraries],
LIBS="$LIBS $withval")

dnl -----------------------------------------
dnl Checks for programs.
dnl -----------------------------------------

AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_RANLIB


dnl -----------------------------------------
dnl Checks for libraries.
dnl -----------------------------------------
AC_CONFIG_SECTION([Checking libraries])
AC_CHECK_LIB(ulib, ulib_cpu_count)


dnl -----------------------------------------
dnl Implement --enable-debug --enable-profiling options.
dnl -----------------------------------------
AC_ARG_ENABLE(profiling,
[  --enable-profiling	  enable profiling  [disabled]], [
	echo Using Debuging+profiling target
	CFLAGS="$CFLAGS -pg -g -O0 -D${CONFIG_DEFINE}=Debug"
	LDFLAGS="$LDFLAGS -g"
	CONFIGURATION="-configuration Debug"
	AC_DEFINE(WS_DEBUG)
]
,
[
AC_ARG_ENABLE(debug,
[  --enable-debug	  enable debugging  [disabled]], [
	echo Using Debuging target
	CFLAGS="$CFLAGS -g -O0 -D${CONFIG_DEFINE}=Debug"
	LDFLAGS="$LDFLAGS -g"
	CONFIGURATION="-configuration Debug"
	AC_DEFINE(WS_DEBUG)
]
,
[
	echo Using Release target
	CFLAGS="$CFLAGS -g -O2 -D${CONFIG_DEFINE}=Release"
	LDFLAGS="$LDFLAGS -g"
	CONFIGURATION="-configuration Release"
])])


dnl -----------------------------------------
dnl Outputing
dnl -----------------------------------------

AC_CONFIG_SECTION([Generating output files]) 

TIMESTAMP=`date -u +%Y%m%d%H%M%S`
AC_SUBST(CONFIGURATION)
AC_SUBST(COPYRIGHT)
AC_SUBST(PROJECT_NAME)
AC_SUBST(AUTHOR)
AC_SUBST(VERSION)
AC_SUBST(MAJORVER)
AC_SUBST(MINORVER)
AC_SUBST(REVISION)
AC_SUBST(STATIC_LIBS)
AC_SUBST(LIBS)
AC_SUBST(SHARED_LIBRARY_EXTENSION)
AC_SUBST(LIBRARIES)
AC_SUBST(ARCH)
AC_SUBST(TIMESTAMP)
AC_SUBST(VERSION)
AC_SUBST(CUSER)

AC_CONFIG_SECTION([Generating output files]) 
AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([ulibgsmmap.pc])
AC_CONFIG_FILES([make_buildnr.sh])
AC_OUTPUT

chmod 755 make_buildnr.sh

if [[ -f BUILDNR ]]
then
	echo "Buildnumber: `cat BUILDNR`"
else
	echo "1" > BUILDNR
	echo "Buildnumber: 1"
	./make_buildnr.sh
fi


dnl LICENSE notice

AC_CONFIG_SECTION([License information])
cat <<X
+--------------------------------------------------------------------
| Project: ${PROJECT_NAME} ${VERSION}
| ${COPYRIGHT}
+--------------------------------------------------------------------
X


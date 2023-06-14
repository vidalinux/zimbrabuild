#!/bin/sh

# clone zimbra source code
git clone https://github.com/Zimbra/zm-build.git /tmp/zm-build
mv /tmp/zm-build/* /home/git/zm-build
rm -rf /tmp/zm-build
cd /home/git/zm-build 
git checkout origin/develop

cat > /home/git/zm-build/config.build << EOF
BUILD_TS=$(date +%Y%m%d%H%M%S)
BUILD_NO=$BUILD_NO
BUILD_RELEASE=$BUILD_RELEASE
BUILD_RELEASE_NO=$BUILD_RELEASE_NO
BUILD_OS=$BUILD_OS
BUILD_ARCH=$BUILD_ARCH
BUILD_TYPE=$BUILD_TYPE
PKG_OS_TAG=$PKG_OS_TAG
BUILD_RELEASE_CANDIDATE=$BUILD_RELEASE_CANDIDATE
BUILD_THIRDPARTY_SERVER=$BUILD_THIRDPARTY_SERVER
INTERACTIVE=$INTERACTIVE
EOF
/usr/bin/perl build.pl

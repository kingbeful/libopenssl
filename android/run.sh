#! /bin/bash
OPENSSL_VERSION="openssl-1.0.1p"

rm -rf "${OPENSSL_VERSION}"
rm -rf include/openssl/* lib/*
mkdir -p lib/
mkdir -p include/openssl/

echo "Copy openssl tar.gz"
cp ../${OPENSSL_VERSION}.tar.gz .
if [ ! -e ${OPENSSL_VERSION}.tar.gz ]; then
        echo "Downloading ${OPENSSL_VERSION}.tar.gz"
        curl -O https://www.openssl.org/source/${OPENSSL_VERSION}.tar.gz
else
        echo "Using ${OPENSSL_VERSION}.tar.gz"
fi
echo "Unpacking openssl"
tar xfz "${OPENSSL_VERSION}.tar.gz"

. ./setenv-android.sh
cd ${OPENSSL_VERSION}
perl -pi -e 's/install: all install_docs install_sw/install: install_docs install_sw/g' Makefile.org
./config shared no-ssl2 no-ssl3 no-comp no-hw no-engine --openssldir=/usr/local/ssl/$ANDROID_API

make depend
make all

mv libcrypto.a ../lib
mv libssl.a ../lib
cp include/openssl/* ../include/openssl/

cd ..
echo "Cleaning up"
rm -rf ${OPENSSL_VERSION}
rm -rf ${OPENSSL_VERSION}.tar.gz
echo "Done"

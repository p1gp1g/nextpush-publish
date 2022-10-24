#!/bin/bash

VERSION=1.1.2

mkdir -p $VERSION
cd $VERSION
wget https://github.com/UP-NextPush/server-app/archive/refs/tags/$VERSION.tar.gz
tar xf $VERSION.tar.gz
mv server-app-$VERSION uppush
tar zcf uppush-$VERSION.tar.gz uppush
rm -r uppush $VERSION.tar.gz
openssl dgst -sha512 -sign ~/.nextcloud/certificates/uppush.key uppush-$VERSION.tar.gz | openssl base64 > uppush-$VERSION.tar.gz.sign

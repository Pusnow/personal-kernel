#!/bin/sh

set -ex

mkdir -p /build/linux
cd /build/linux

apt-get install -y build-essential bc kmod cpio flex libncurses5-dev libelf-dev libssl-dev dwarves bison python3
tar --strip-components=1 -xJf /usr/src/linux-source-*.tar.xz
xz -d -c /usr/src/linux-config-*/config.amd64_none_amd64.xz > .config
cp /config-fragment .config-fragment
./scripts/kconfig/merge_config.sh .config .config-fragment
make clean
sed -i 's/^EXTRAVERSION\s*=.*/EXTRAVERSION = -pusnow/' Makefile
make -j$(nproc) bindeb-pkg


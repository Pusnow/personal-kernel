#!/bin/sh

set -ex

mkdir -p /build/linux
cd /build/linux
dpkg-query --showformat='${Version}' --show linux-source > /build/version
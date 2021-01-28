#!/bin/bash

source ${0%/*}/common.sh

cd_root

BASE_DIR=dist/sysroot
mkdir -p $BASE_DIR

message 'Compressing sysroot-full'
tar czf $ROOT/$BASE_DIR/qtrpi-sysroot-full-latest.tar.gz raspbian/sysroot-full

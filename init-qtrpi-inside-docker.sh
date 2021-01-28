#!/bin/bash

set -e

source ${0%/*}/utils/common.sh

check_env_vars

# prepare environment
$UTILS_DIR/init-common.sh
$UTILS_DIR/synchronize-toolchain.sh
cd_root

#mv /qtrpi/dist/*.zip .

deploy_sysroot
deploy_qtrpi_binaries


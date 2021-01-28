#!/bin/bash

# DEBUG
set -e

source ${0%/*}/utils/common.sh

function usage() {
    cat <<EOF
Usage: $0 [options]

-h| --help                      Display help text.
-n| --no-questions              No interactive mode (default behavior by default: raspbian image cache is not re-downloaded).
EOF
}

while [[ $# -gt 0 ]]; do
    KEY="$1"
    case $KEY in
        -h|--help)
            DISPLAY_HELP=true
        ;;
        -n|--no-questions)
            NO_QUESTIONS=true
        ;;
        *)
        ;;
    esac
    shift
done

if [[ $DISPLAY_HELP ]]; then
    usage
    exit 0
fi

check_env_vars

cd utils
./generate-compressed-qtrpi.sh
./generate-compressed-sysroot-full.sh

cd ..
mkdir -p dist/
cp /opt/qtrpi/dist/qtrpi/rpi3/*.tar.gz dist/
cp /opt/qtrpi/dist/sysroot/*.tar.gz dist/

docker build -t qtrpi/qt5.12.9 . -f docker/rpi3/qt5.12.9-full/Dockerfile
FROM ubuntu:20.04
LABEL maintainer="Alexander Rose <alex@rose-a.de>" 

# install necessary packages
RUN apt-get update -q && apt-get install -yq --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    wget \
    unzip \
    libmp3lame-dev libsoapysdr-dev libmpg123-dev libfaad-dev libfftw3-dev librtlsdr-dev libairspy-dev libusb-1.0-0-dev mesa-common-dev libglu1-mesa-dev libpulse-dev rtl-sdr
    # \
    # && rm -rf /var/lib/apt/lists/*

# Setup Qtrpi environment
ENV QTRPI_QT_VERSION='5.12.9' \
    QTRPI_TARGET_DEVICE='linux-rasp-pi3-g++' \
    QTRPI_TARGET_HOST='pi@localhost' \
    QTRPI_DOCKER='True'

# Change workdir
WORKDIR /qtrpi
COPY ./ /qtrpi/

ADD dist/qtrpi-rpi3_qt-5.12.9.tar.gz /opt/qtrpi
ADD dist/qtrpi-sysroot-full-latest.tar.gz /opt/qtrpi

# Execute init script and clean up after it
RUN ./init-qtrpi-inside-docker.sh && rm dist/*.tar.gz
# Extend path
ENV PATH=/opt/qtrpi/bin:$PATH

# Create path for source files
RUN mkdir /source
WORKDIR /source

# Execute build commands on run
CMD /qtrpi/docker/scripts/build.sh

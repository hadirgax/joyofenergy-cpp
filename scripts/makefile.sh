#!/bin/bash -e

install_cmake() {
    # Download script to install CMake
    download_url="https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1-linux-x86_64.sh"
    curl -fsSL "${download_url}" -o cmakeinstall.sh

    # Install CMake and remove the install script
    chmod +x cmakeinstall.sh \
    && ./cmakeinstall.sh --prefix=/usr/local --exclude-subdir \
    && rm cmakeinstall.sh
}

$*
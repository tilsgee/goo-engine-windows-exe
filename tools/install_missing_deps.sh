#!/bin/bash
set -e

# List of dependencies to check and install if missing.
# Adjust package names as needed for your distribution.
dependencies=(
  libxi-dev
  libxrandr-dev
  libx11-dev
  libglu1-mesa-dev
  libfreetype6-dev
  libxext-dev
  libssl-dev
  libjpeg-dev
  libepoxy-dev
  libvulkan-dev
  libtiff-dev
  spirv-tools
  libshaderc-dev
  libpng-dev
  libxkbcommon-dev
  libxkbcommon-x11-dev
  libwayland-dev
  libwayland-egl-backend-dev
  libgbm-dev
  libdrm-dev
  libasound2-dev
  libpulse-dev
  libopenal-dev
  libogg-dev
  libvorbis-dev
  libopenjp2-7-dev
  libwebp-dev
  libavcodec-dev
  libavformat-dev
  libavutil-dev
  libswscale-dev
  libavfilter-dev
  libavdevice-dev
  libswresample-dev
  libopus-dev
  libsndfile1-dev
  libcurl4-openssl-dev
  libjsoncpp-dev
  #libgcc-dev
  libstdc++-12-dev
  libstdc++6
  libstdc++-12-doc
  libstdc++-12-dbg
  libclang-16-dev
  libclang-common-16-dev
  libclang1
  libclang-cpp16
  libclang1-16
  libclang-cpp1-16
  libclang-16-doc
  cmake
  ninja-build
  make
  gcc
  g++
  git
  python3.11
  python3.11-dev
  python3.11-venv
  python3-pip
  python3-setuptools
  libdir-dev
  libboost-all-dev
  libxxf-dev
  libxxf86vm-dev
  libxmu-dev
  libxmu-headers
  libxmu6
  libcursor-dev
  libxinerama-dev
  libegl1-mesa-dev
  libegl-dev
  wayland-protocols
  libdbus-1-dev
  libudev-dev
  linux-libc-dev
)

echo "Checking for missing dependencies..."

for pkg in "${dependencies[@]}"; do
    # Use dpkg -l to check if the package is installed.
    if dpkg -l | grep -q "^ii\s\+$pkg\s"; then
        echo "[OK] $pkg is already installed."
    else
        echo "[INFO] $pkg is missing. Installing $pkg..."
        sudo apt-get update
        sudo apt-get install -y "$pkg"
    fi
done

echo "Dependency check complete."
echo "All required dependencies are installed."
echo "You can now proceed with the build process."

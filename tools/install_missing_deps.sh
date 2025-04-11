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
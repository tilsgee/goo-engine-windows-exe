#!/bin/bash
set -e

# List your dependencies.
# For Ubuntu, these should be the package names you intend to install.
# You might have names like "libxi-dev", "libxrandr-dev", etc.
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
)

echo "Checking for missing dependencies..."

for pkg in "${dependencies[@]}"; do
    # Check if the package is installed using dpkg. This works on Debian/Ubuntu.
    if dpkg -l | grep -q "^ii\s\+$pkg\s"; then
        echo "[OK] $pkg is already installed."
    else
        echo "[INFO] $pkg is missing. Installing $pkg..."
        sudo apt-get install -y $pkg
    fi
done

echo "Dependency check complete."
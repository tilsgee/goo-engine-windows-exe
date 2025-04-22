# File: tools\install_blender_dependencies.ps1
# This script installs the main dependencies needed to build Blender 4.1 on Windows.
# Run this script with Administrator privileges.

# Check for Administrator rights.
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
    Write-Error "This script must be run as Administrator. Exiting..."
    exit 1
}

Write-Host "=== Blender 4.1 Windows Build Dependency Installer ===" -ForegroundColor Green

# Step 1: Check for Chocolatey
Write-Host "`nChecking for Chocolatey..."
if (-not (Get-Command choco.exe -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey not found. Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey is already installed."
}

# Step 2: Define the list of packages to install.
# You can add or remove packages as needed.
$packages = @(
    "visualstudio2019buildtools",  # Visual Studio 2019 Build Tools for C++ (modify if using VS2022)
    "cmake",                       # CMake, required for configuring the build
    "ninja",                       # Ninja build system for fast builds
    "git",                         # Git for cloning and managing the repository
    "python3",                     # Python 3 as Blender uses it for scripting
    "7zip",                        # For extracting archives if needed
    "vcredist140"                  # Microsoft Visual C++ Redistributable (for VS 2015-2019)
)

# Step 3: Install each package
Write-Host "`nInstalling dependencies..."
foreach ($pkg in $packages) {
    Write-Host "Installing $pkg..."
    choco install $pkg -y --allow-downgrade
}

Write-Host "`nAll listed dependencies have been installed." -ForegroundColor Green
Write-Host "If you configured new tools like Visual Studio Build Tools, a system restart might be required for some changes to take effect."
Write-Host "Proceed with your Blender 4.1 build configuration once ready!"
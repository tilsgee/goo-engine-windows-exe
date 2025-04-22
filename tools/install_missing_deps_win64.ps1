# File: install_missing_deps_win64.ps1 (Tools Only Version for Blender 4.x)
# This script installs the main TOOL dependencies needed to build Blender 4.x on Windows.
# It DOES NOT download the precompiled libraries. That should be handled by your build process (e.g., CI/CD YAML or 'make update').
# Run this script with Administrator privileges.

# Check for Administrator rights... (Keep this section)

Write-Host "=== Blender 4.x Windows Build TOOL Dependency Installer ===" -ForegroundColor Green

# Step 1: Check for Chocolatey... (Keep this section)

# Step 2: Define the list of TOOL packages to install for Blender 4.x (using VS 2022)
Write-Host "`nDefining required tool packages..." -ForegroundColor Yellow
$packages = @(
    # --- Visual Studio 2022 Build Tools ---
    "visualstudio2022buildtools",
    "visualstudio2022-workload-vctools",

    # --- Build System & Version Control ---
    "cmake --installargs 'ADD_CMAKE_TO_PATH=System'",
    "ninja",
    "git",
    "git-lfs", # Ensure Git LFS tool is installed

    # --- Other Dependencies ---
    "python3",
    "7zip", 
    # Optional
    "vcredist143"
)

# Step 3: Install/Upgrade each package using Chocolatey... (Keep this section, install loop)

# Step 4: Initialize Git LFS (Globally)
Write-Host "`nInitializing Git LFS..." -ForegroundColor Yellow
# Ensures Git LFS is ready for use by any git clone/pull commands later
git lfs install --system
if ($LASTEXITCODE -ne 0) {
    Write-Warning "Git LFS initialization failed. Manual check might be needed."
} else {
    Write-Host "Git LFS initialized successfully."
}

# Step 5: REMOVED - Library checkout is handled separately (e.g., in build YAML or via 'make update')

Write-Host "`n=== TOOL Dependency Installation Complete ===" -ForegroundColor Green
Write-Host "Summary:"
Write-Host "- Essential build tools (VS 2022, CMake, Ninja, Git, Git-LFS, Python) installed/updated."
Write-Host "- Git LFS initialized."
Write-Host "`nIMPORTANT:" -ForegroundColor Yellow
Write-Host "- A system restart might be required for all environment variables (especially for Visual Studio) to be fully recognized."
Write-Host "- You still need to obtain the precompiled Blender libraries separately."
Write-Host "  This is typically done via 'make update' in the Blender source directory, or by a step in your CI/CD pipeline (YAML file)."
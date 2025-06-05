# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a 3D models repository containing OpenSCAD designs for 3D printing, primarily focused on custom printer parts for various 3D printers (Ender 2 Pro, Bastion MK 1.2 Extended 235) and other mechanical components.

## Build System

The repository uses OpenSCAD for 3D model generation with a Docker-based build system:

- **Build all models**: `./build_all_stls.sh` - Converts all .scad files to .stl format using Docker
- **Docker command**: `docker run --rm -v "$(pwd):/work" -w /work openscad/openscad openscad -o "output.stl" "input.scad"`
- **Output directory**: All generated STL files are placed in `build_stls/` directory maintaining the same directory structure

The build script intelligently detects changed SCAD files using git and only rebuilds modified files, or builds all files if no changes are detected.

## Architecture

### Shared Components System

The repository uses a centralized shared components approach:

- **`shared_helper.scad`**: Central library containing:
  - Hardware specifications (screws, nuts, bearings, magnets, switches)
  - Standard dimensions and tolerances
  - Reusable modules for common components (mounting holes, endstop mounts, switch spaces)
  - Quality settings (`$fn = quality_value`)

- **Base modules**: Many designs use base SCAD files that define common functionality:
  - Example: `frame_bar_extension_25mm_base.scad` defines modules like `male_mount()`, `female_mount()`, `extension()`
  - Specific variants include these base files and combine the modules

### Project Structure

- **Printer-specific folders**: Organized by printer model (Ender 2 Pro, Bastion MK 1.2)
- **Component categories**: Each printer has subdirectories for different component types (X Carriage, Y Carriage, Bed Spacers, etc.)
- **Versioning**: Files use version numbers in filenames (v0.1, v0.2, etc.)
- **Generated files**: `build_stls/` contains compiled STL files, `gcode/` contains printer-ready files

### Design Patterns

1. **Modular design**: Complex parts are broken into reusable modules
2. **Parameterization**: Dimensions are defined as variables for easy modification
3. **Tolerance system**: Uses consistent tolerance values from shared_helper.scad
4. **Hardware abstraction**: Screw holes, nut spaces, and heat inserts use standardized modules

## File Organization

- **Working files**: Source .scad files in main directories
- **Output files**: STL files in `build_stls/`, gcode in `gcode/`
- **Printer configs**: Klipper configurations in `klipper_printer_configs/`
- **Slicer profiles**: PrusaSlicer settings in `PrusaSlicer_Profile/`
- **Documentation**: Progress photos and measurements in component subdirectories

When modifying designs, always check for dependencies on `shared_helper.scad` and base modules. The modular system allows for easy customization while maintaining consistency across designs.
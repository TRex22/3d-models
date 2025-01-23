#!/bin/bash

# Create build directory
mkdir -p build_stls

# git clone https://github.com/SebiTimeWaster/Chamfers-for-OpenSCAD.git

# Find all SCAD files recursively
find . -name "*.scad" | while read scad_file; do
  # Create relative path in build directory
  relative_path=${scad_file#./}
  stl_file="build_stls/${relative_path%.scad}.stl"

  # Create directory structure
  mkdir -p "$(dirname "$stl_file")"

  # Convert SCAD to STL
  echo "Converting: $scad_file -> $stl_file"
  docker run --rm -v "$(pwd):/work" -w /work openscad/openscad openscad -o "$stl_file" "$scad_file"
done

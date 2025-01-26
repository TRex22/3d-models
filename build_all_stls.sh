#!/bin/bash

# Create build directory
mkdir -p build_stls

# Find all changed SCAD files recursively
changed_scad_files=$(git diff --name-only --diff-filter=ACMR -- "*.scad")
# new_scad_files=$(echo "$all_scad_files" | tr ' ' '\n' | grep -v -F -f <(echo "$changed_scad_files" | tr ' ' '\n'))

if [ -z "$changed_scad_files" ]; then
  find . -name "*.scad" | while read scad_file; do
    # Create relative path in build directory
    relative_path=${scad_file#./}
    stl_file="build_stls/${relative_path%.scad}.stl"

    # Create directory structure
    mkdir -p "$(dirname "$stl_file")"

    # Convert SCAD to STL
    echo "Converting: $scad_file -> $stl_file"
    docker run --rm -v "$(pwd):/work" -w /work openscad/openscad openscad -o "$stl_file" "$scad_file"
    echo ""
    echo ""
  done
else
  for scad_file in $changed_scad_files; do
    # Create relative path in build directory
    relative_path=${scad_file#./}
    stl_file="build_stls/${relative_path%.scad}.stl"

    # Create directory structure
    mkdir -p "$(dirname "$stl_file")"

    # Convert SCAD to STL
    echo "Converting: $scad_file -> $stl_file"
    docker run --rm -v "$(pwd):/work" -w /work openscad/openscad openscad -o "$stl_file" "$scad_file"
    echo ""
    echo ""
  done
fi

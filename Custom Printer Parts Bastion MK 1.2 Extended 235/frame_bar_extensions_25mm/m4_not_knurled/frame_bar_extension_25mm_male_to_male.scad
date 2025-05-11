// Frame Bar Extension
// This extension piece connects two frame bars with a configurable middle section
include <../frame_bar_extension_25mm_base.scad>;

revision = 1.2;

countersunk_hole_diameter = m4_head_diameter;
countersunk_hole_depth = m4_head_depth + 0.5;

knurled_insert_diameter = m4_type1_knurled_insert_diameter;
knurled_insert_depth = m4_type1_knurled_insert_depth;

module heat_insert_holes() {}

module frame_bar_extension() {
  union() {
    male_mount();

    translate([0, mount_depth + fit_tolerance, 0]) {
      extension();
    }

    translate([0, mount_depth + fit_tolerance + extension_length, 0]) {
      male_mount();
    }
  }
}

// Render the extension piece
frame_bar_extension();

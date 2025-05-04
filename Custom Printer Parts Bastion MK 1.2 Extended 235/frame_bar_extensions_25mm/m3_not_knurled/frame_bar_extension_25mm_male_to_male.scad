// Frame Bar Extension
// This extension piece connects two frame bars with a configurable middle section
include <../frame_bar_extension_25mm_base.scad>;

revision = 1.2;

module heat_insert_holes() {}

module frame_bar_extension() {
  union() {
    // female_mount();
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

// Frame Bar Extension
// This extension piece connects two frame bars with a configurable middle section
include <../frame_bar_extension_25mm_base.scad>;

revision = 1.0;

extension_length = 0.0;  // Length of the extension middle section (adjustable) ±12.5

module frame_bar_extension() {
  union() {
    male_mount();

    translate([0, mount_depth + fit_tolerance, 0]) {
      extension();
    }

    translate([0, mount_depth + fit_tolerance + extension_length, 0]) {
      female_mount();
    }
  }
}

// Render the extension piece
frame_bar_extension();

// Frame Bar Original
include <../frame_bar_extension_25mm_base.scad>;

revision = 1.0;
extension_length = 94.00; // Original length

module frame_bar() {
  union() {
    female_mount();

    translate([0, mount_depth, 0]) {
      extension();
    }

    translate([0, mount_depth + extension_length, 0]) {
      female_mount();
    }
  }
}

// Render the frame bar
difference() {
  frame_bar();
  side_holes();
  top_holes();
}


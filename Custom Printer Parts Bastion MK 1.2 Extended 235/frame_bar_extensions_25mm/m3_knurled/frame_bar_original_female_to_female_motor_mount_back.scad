// Frame Bar Original - 144.00 mm
include <../frame_bar_extension_25mm_base.scad>;

revision = 1.2;
extension_length = 94.00; // Original length

module frame_bar() {
  union() {
    female_mount();

    translate([0, mount_depth, 0]) {
      motor_mount_bottom();
    }

    translate([0, mount_depth + extension_length, 0]) {
      female_mount();
    }
  }
}

// Render the frame bar
difference() {
  frame_bar();

  // Needs to not go all the way through
  translate([(motor_mount_central_holes_depth) - hole_depth, 0, 0]) {
    side_holes();
  }
}


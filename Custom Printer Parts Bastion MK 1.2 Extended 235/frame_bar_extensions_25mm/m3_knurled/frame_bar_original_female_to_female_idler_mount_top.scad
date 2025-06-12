// Rear top Idler Mount
include <../frame_bar_extension_25mm_base.scad>;

revision = 1.1;
extension_length = 94.00; // Original length

module mount_bar() {
  union() {
    female_mount();

    translate([0, mount_depth, 0]) {
      idler_mount_top();
    }

    translate([0, mount_depth + extension_length, 0]) {
      female_mount();
    }
  }
}

mount_bar();

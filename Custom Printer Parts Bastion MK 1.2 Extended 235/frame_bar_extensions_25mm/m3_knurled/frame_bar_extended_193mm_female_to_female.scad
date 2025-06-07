// Frame Bar - 193.00 mm
original_length = 94.00;
original_mount_depth = 25.0;
original_side_hole_length_from_edge = 57.20; // original
original_top_hole_length_from_edge = 19.70 + original_mount_depth; // original

include <../frame_bar_extension_25mm_base.scad>;

revision = 1.1;

extension_length = 193.00 - (2 * 25.00);
side_hole_length_from_edge = original_side_hole_length_from_edge + ((extension_length - original_length) / 2.0);
top_hole_length_from_edge = original_top_hole_length_from_edge + ((extension_length - original_length) / 2.0);

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


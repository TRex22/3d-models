// Frame Bar Extension
// This extension piece connects two frame bars with a configurable middle section
include <frame_bar_extension_25mm_base.scad>;

revision = 1.1;

// TODO: Add in heat knurled insert
// TODO: Add in M4 Alternative
// TODO: Add in NUT Alternatives for M4 and M3
// TODO: Create female -> female, male -> male, male -> female

module frame_bar_extension() {
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

// Render the extension piece
frame_bar_extension();

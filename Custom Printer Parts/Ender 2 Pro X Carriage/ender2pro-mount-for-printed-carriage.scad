// Include original file to access all modules and variables
include <x_axis_carriage_mounting_plate.scad>

// Variable Overrides
m3_hole_height = 100;

module klackender_probe_mount() {
  // translate([x_probe_mount_translation, y_probe_mount_translation, z_probe_mount_translation])
  // rotate(probe_mount_rotation)
  import("ender2pro-mount.stl");
}

module m3_stand_off_holes() {
  rotate([0, 90, 0])
  translate([4.00, plate_height - 5.00, -5.5]) {
    cylinder(d = m3_hole_diameter, h = m3_hole_height);
    translate([11.60, 0, 0]) {
      cylinder(d = m3_hole_diameter, h = m3_hole_height);
    }
  }
}

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    union() {
      klackender_probe_mount();
    }
    union() {
      m3_stand_off_holes();
    }
  }
}

main_assembly();

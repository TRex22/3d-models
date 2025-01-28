// Include original file to access all modules and variables
include <x_axis_carriage_mounting_plate.scad>

// Variable Overrides
plate_height = 14.00;
plate_width = 19.00;
m3_hole_diameter = 2.8;
m3_offset = m3_hole_diameter / 2.0;
m3_hole_height = 100;
standoff_diameter = 4.15;

countersink_diameter = 5.65;
countersink_height = 2.10;

hole_distance = 11.60 + m3_offset;

block_thickness = 6.00; // 5.48;

module klackender_probe_mount() {
  // translate([x_probe_mount_translation, y_probe_mount_translation, z_probe_mount_translation])
  // rotate(probe_mount_rotation)
  import("ender2pro-mount.stl");
}

module block_old_holes() {
  translate([-10.50, 0, 0])
  linear_extrude(height = block_thickness)

  hull() {
    square([plate_width, plate_height]);
  }
}

module m3_stand_off_holes() {
  translate([-7.50, plate_height - 8.00, -5.5]) {
    cylinder(d = m3_hole_diameter, h = m3_hole_height);
    translate([hole_distance, 0, 0]) {
      cylinder(d = m3_hole_diameter, h = m3_hole_height);
    }
  }
}

module m3_holes() {
  m3_stand_off_holes();
  union() {
    translate([-7.50, plate_height - 3.00, -5.5]) {
      cylinder(d = m3_hole_diameter, h = m3_hole_height);
      translate([hole_distance, 0, 0]) {
        cylinder(d = m3_hole_diameter, h = m3_hole_height);
      }
    }
  }
}

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    union() {
      klackender_probe_mount();
      block_old_holes();
    }
    m3_holes();
  }
}

main_assembly();

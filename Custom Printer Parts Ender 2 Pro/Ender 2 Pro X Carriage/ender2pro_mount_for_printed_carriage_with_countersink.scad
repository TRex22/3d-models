// Include original file to access all modules and variables
include <ender2pro_mount_for_printed_carriage.scad>

// Variables
mount_thickness = 6.40;

// Modified for countersinks
module m3_holes() {
  m3_stand_off_holes();
  union() {
    translate([-8.00, plate_height - 3.00, -5.5]) {
      cylinder(d = m3_hole_diameter, h = m3_hole_height);
      translate([hole_distance, 0, 0]) {
        cylinder(d = m3_hole_diameter, h = m3_hole_height);
      }
    }

    // Add front countersink for the lower two holes
    translate([-8.00, plate_height - 3.00, mount_thickness - countersink_height]) {
      cylinder(d = countersink_diameter, h = countersink_height);
      translate([hole_distance, 0, 0]) {
        cylinder(d = countersink_diameter, h = countersink_height);
      }
    }
  }
}

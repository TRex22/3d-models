// Ender 2 Pro X-Axis Mounting Carriage Plate
// High quality settings
$fn = 100;

// include <Chamfer.scad>;

// Variables
thickness = 5.48; // 2.00; // must replace the stand-offs
plate_height = 12.00;
plate_width = 21.00;
m3_hole_diameter = 2.8;
m3_offset = m3_hole_diameter;
m3_hole_height = 100;
standoff_diameter = 4.15;

countersink_diameter = 5.65;
countersink_height = 2.10;

hole_distance = 11.60 + m3_offset;

module main_mounting_plate() {
  // Base plate
  translate([0, 0, 0])
  linear_extrude(height = thickness)
  //chamferCube([plate_width, plate_height, thickness], 2);
  hull() {
    square([plate_width, plate_height]);
  }
}

module m3_stand_off_holes() {
  translate([3.50, plate_height - 9.00, -5.5]) {
    cylinder(d = m3_hole_diameter, h = m3_hole_height);
    translate([hole_distance, 0, 0]) {
      cylinder(d = m3_hole_diameter, h = m3_hole_height);
    }
  }
}

module m3_holes() {
  union() {
    m3_stand_off_holes();

    translate([3.50, plate_height - 4.00, -5.5]) {
      cylinder(d = m3_hole_diameter, h = m3_hole_height);
      translate([hole_distance, 0, 0]) {
        cylinder(d = m3_hole_diameter, h = m3_hole_height);
      }
    }

    // Add countersink for the lower two holes
    translate([3.50, plate_height - 4.00, 0]) {
      cylinder(d = countersink_diameter, h = countersink_height);
      translate([hole_distance, 0, 0]) {
        cylinder(d = countersink_diameter, h = countersink_height);
      }
    }
  }
}

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    main_mounting_plate();
    m3_holes();
  }
}

main_assembly();

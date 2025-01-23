// High quality settings
$fn = 100;

// include <Chamfer.scad>;

// Variables
thickness = 2.00;
plate_height = 12.00;
plate_width = 20.00;
m3_hole_diameter = 2.8;
m3_hole_height = 10;
standoff_diameter = 4.15;

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
  translate([4.00, plate_height - 10.00, -5.5]) {
    cylinder(d = m3_hole_diameter, h = m3_hole_height);
    translate([11.60, 0, 0]) {
      cylinder(d = m3_hole_diameter, h = m3_hole_height);
    }
  }
}

module m3_holes() {
  union() {
    m3_stand_off_holes();

    translate([4.00, plate_height - 5.00, -5.5]) {
      cylinder(d = m3_hole_diameter, h = m3_hole_height);
      translate([11.60, 0, 0]) {
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
      main_mounting_plate();
    }
    m3_holes();
  }
}

main_assembly();

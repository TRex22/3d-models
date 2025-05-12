// Foot Design

include <../shared_helper.scad>;

foot_outer_diameter = 38.50;
foot_total_height = 12.50 + 12.00 + 4.00; // Height to casing + height of power switch + extra clearance

// Negative space
foot_inner_diameter = 12.00;
foot_inner_height = 15.00;

// Screw hole dimensions
screw_diameter = m5_loose_hole_diameter;
screw_head_diameter = m5_head_diameter; // M5 socket head diameter
screw_head_height = m5_head_depth;   // M5 socket head height
countersink_angle = 90;    // Countersink angle in degrees

// Additional design parameters
wall_thickness = 3.0;      // Minimum wall thickness
bottom_thickness = 5.0;    // Thickness of the bottom part
chamfer_size = 1.5;        // Size of chamfers for better printing
$fn = 100;                 // Smoothness of circl

module base_foot() {
  // Main body - cylinder with chamfered top edge
  translate([0, 0, chamfer_size]) {
    union() {
      // Main cylinder
      cylinder(d=foot_outer_diameter, h=foot_total_height - chamfer_size);

      // Chamfered top
      translate([0, 0, foot_total_height - chamfer_size])
        cylinder(d1=foot_outer_diameter, d2=foot_outer_diameter - 2*chamfer_size, h=chamfer_size);

      // Chamfered bottom
      translate([0, 0, - chamfer_size])
        cylinder(d1=foot_outer_diameter - 2*chamfer_size, d2=foot_outer_diameter, h=chamfer_size);
    }
  }
}

// Inner void space
// translate([0, 0, bottom_thickness])
//   cylinder(d=foot_inner_diameter, h=foot_inner_height);

module screw_hole() {
  // Screw hole
  union() {
    // Screw shaft hole
    translate([0, 0, -0.1])
      cylinder(d=screw_diameter, h=100.00);

    // Countersink for screw head
    translate([0, 0, -0.1])
      cylinder(d1=screw_head_diameter * 1.5, d2=screw_diameter, h=foot_inner_height);
  }
}

module anti_slip() {
  // Add some anti-slip pattern on the bottom (optional)
  for (i = [0:30:330]) {
    rotate([0, 0, i])
      translate([foot_outer_diameter/4, 0, -0.1])
        cylinder(d=2, h=0.5);
  }
}

module foot() {
  difference() {
    base_foot();
    screw_hole();
    anti_slip();
  }
}

// Render the foot
foot();


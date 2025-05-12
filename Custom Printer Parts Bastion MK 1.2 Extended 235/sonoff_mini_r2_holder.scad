// Sonoff Mini R2 Holder for Bastion Printer. Designed to mount to PSU

include <../shared_helper.scad>;
revision = 1.0;

tolerance  = 0.2;
width = 42.30;
height = 43.50;
depth = 19.70;

case_thickness = 2.00;
case_base_thickness = case_thickness + 6.00;
case_depth = depth + case_thickness;

mounting_hole_margin = 21.81 + m4_hole_diameter;

module inner_space() {
  translate([case_thickness / 2.0, case_thickness / 2.0, case_base_thickness]) {
    cube([width + tolerance, height + tolerance, case_depth]);
  }
}

module mounting_holes() {
  // m4_head_diameter

  rotate([0, 90, 0]) {
    translate([0, 0, 0]) {
      cylinder(d=m4_hole_diameter, h=100.00);
    }

    translate([0, mounting_hole_margin, 0]) {
      cylinder(d=m4_hole_diameter, h=100.00);
    }
  }
}

difference() {
  cube([width + case_thickness, height + case_thickness, case_depth]);
  inner_space();
  mounting_holes();
}

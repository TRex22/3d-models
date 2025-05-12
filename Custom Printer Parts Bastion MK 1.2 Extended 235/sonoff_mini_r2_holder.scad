// Sonoff Mini R2 Holder for Bastion Printer. Designed to mount to PSU

include <../shared_helper.scad>;
revision = 1.0;

tolerance = 0.2;
width = 42.30;
height = 43.50;
depth = 19.70;

case_thickness = 4.00;
case_base_thickness = case_thickness + 6.00;
case_depth = depth + case_thickness;

mounting_hole_margin = 21.81 + m4_hole_diameter;

cutout_distance_from_edge = 5.80;
cutout_length = 33.00 + 1.70; //31.00;
cutout_height = 15.00;
cutout_base_height = 4.60;

module inner_space() {
  translate([case_thickness / 2.0, case_thickness / 2.0, case_base_thickness]) {
    cube([width + tolerance, height + tolerance, case_depth]);
  }
}

module mounting_holes() {
  rotate([0, 0, 90]) {
    translate([width / 2.0, - (mounting_hole_margin + ((height - 5.0) / 4)), 0]) {
      cylinder(d=m4_hole_diameter, h=100.00);

      translate([0, mounting_hole_margin, 0]) {
        cylinder(d=m4_hole_diameter, h=100.00);
      }
    }
  }
}

module countersunk_holes() {
  rotate([0, 0, 90]) {
    translate([width / 2.0, - (mounting_hole_margin + ((height - 5.0) / 4)), case_base_thickness - m4_head_depth]) {
      cylinder(d=m4_head_diameter, h=m4_head_depth);

      translate([0, mounting_hole_margin, 0]) {
        cylinder(d=m4_head_diameter, h=m4_head_depth);
      }
    }
  }
}

module cutout_wall() {
  rotate([0, 0, 0]) {
    translate([cutout_distance_from_edge, 0, cutout_base_height + case_base_thickness]) {
      cube([cutout_length, cutout_height, 100.00]);
    }
  }
}

difference() {
  cube([width + case_thickness, height + case_thickness, case_depth]);
  inner_space();
  mounting_holes();
  countersunk_holes();
  cutout_wall();
}

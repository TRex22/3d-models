include <hotend_slider_helpers.scad>

module Casing() {
  total_height = slider_height + slider_movement + casing_wall_thickness;
  m3_head_diameter = 6.0;
  m3_head_depth = 3.0;

  difference() {
    // Outer casing
    cube([slider_width + casing_wall_thickness, total_height, slider_depth + casing_wall_thickness]);

    // Inner cavity for slider
    translate([casing_wall_thickness / 2.00, casing_wall_thickness / 2.00, -1])
      cube([slider_width, slider_height + slider_movement, slider_depth + 1.00]);

    // Countersunk holes for brass nails
    translate([-1, total_height-spring_back_space-casing_wall_thickness / 2.00, slider_depth / 2.00 + casing_wall_thickness / 2.00]) {
      rotate([0, 90, 0]) {
        translate([0, -0.0, 0]) {
          cylinder(d=brass_nail_diameter, h=slider_width + casing_wall_thickness + 2.00);
          cylinder(d=brass_nail_head_diameter, h=brass_nail_head_depth);
        }
        translate([0, -(total_height - (casing_wall_thickness * 2.00) + 1.00), 0]) {
          cylinder(d=brass_nail_diameter, h=slider_width + casing_wall_thickness + 2.00);
          cylinder(d=brass_nail_head_diameter, h=brass_nail_head_depth);
        }
      }
    }

    // Mounting holes with countersinking - horizontal, through-holes, properly positioned
    translate([((slider_width / 2.00) + casing_wall_thickness / 2.00), total_height - casing_wall_thickness - 2.50, slider_depth / 2.00 + casing_wall_thickness / 2.00]) {
      rotate([0, 0, 90]) {
        translate([0.0, 0, 0]) {
          cylinder(d=M3_Hole_Diameter, h=slider_depth + casing_wall_thickness + 2.00, center=true);
          translate([0, 0, casing_wall_thickness - m3_head_depth])
            cylinder(d=m3_head_diameter, h=m3_head_depth + 1);
        }

        translate([-stand_off_width_distance, 0, 0]) {
          cylinder(d=M3_Hole_Diameter, h=slider_depth + casing_wall_thickness + 2.00, center=true);
          translate([0, 0, casing_wall_thickness - m3_head_depth])
            cylinder(d=m3_head_diameter, h=m3_head_depth + 1);
        }
      }
    }
  }
}

Casing();

include <hotend_slider_helpers.scad>

module Casing() {
  total_casing_height = slider_height + slider_movement + casing_wall_thickness + 1.15;
  total_casing_width = slider_width + casing_wall_thickness;
  total_casing_depth = slider_depth + casing_bottom_thickness;

  difference() {
    // Outer casing
    cube([total_casing_width, total_casing_height, total_casing_depth]);

    // Inner cavity for slider
    translate([casing_wall_thickness / 2.00, casing_wall_thickness / 2.00, -1])
      cube([slider_width, slider_height + slider_movement, slider_depth + 1.00]);

    // Single centered countersunk hole for brass nail
    translate([-1, total_cassing_height / 2.00, (total_casing_depth) / 2.00]) {
      rotate([0, 90, 0]) {
        cylinder(d=brass_nail_diameter, h=total_casing_width + 2.00);
        cylinder(d=brass_nail_head_diameter, h=brass_nail_head_depth);
      }
    }

    // Mounting holes with countersinking - horizontal, through-holes, properly positioned
    translate([((slider_width / 2.00) + casing_wall_thickness / 2.00), total_casing_height - casing_wall_thickness - 3.0, slider_depth / 2.00 + casing_wall_thickness / 2.00]) {
      rotate([0, 0, 90]) {
        translate([0.0, 0, 0]) {
          cylinder(d=M3_Hole_Diameter, h=total_casing_depth + 2.00, center=true);
          translate([0, 0, 0])
            cylinder(d=m3_head_diameter, h=m3_head_depth + 1);
        }

        translate([-stand_off_width_distance, 0, 0]) {
          cylinder(d=M3_Hole_Diameter, h=total_casing_depth + 2.00, center=true);
          translate([0, 0, 0])
            cylinder(d=m3_head_diameter, h=m3_head_depth + 1);
        }
      }
    }
  }
}

Casing();

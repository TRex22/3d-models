include <hotend_slider_helpers.scad>

module Casing() {
  total_casing_height = slider_height + slider_movement + casing_wall_thickness;
  total_casing_width = slider_width + casing_wall_thickness;
  total_casing_depth = slider_depth + casing_bottom_thickness;

  difference() {
    cube([total_casing_width, total_casing_height, total_casing_depth]);

    // Slider Puck
    translate([casing_wall_thickness / 2.00, casing_wall_thickness - slider_movement, casing_wall_thickness]) {
      cube([slider_width + hole_tight_tolerance, slider_height + slider_movement, slider_depth]);
    }

    // Mounting holes with countersinking - horizontal, through-holes, properly positioned
    translate([casing_wall_thickness + 1.50, total_casing_height / 2.0, total_casing_depth / 2.0]) {
      translate([0.0, 0.0, 0.0]) {
        cylinder(d=m3_hole_diameter, h=total_casing_depth + 2.00, center=true);
      }

      // Countersink
      translate([0.0, 0.0, 0.0]) {
        cylinder(d=m3_head_diameter, h=4 + m3_head_depth + 3, center=true);
      }

      translate([stand_off_width_distance, 0, 0]) {
        cylinder(d=m3_hole_diameter, h=total_casing_depth + 2.00, center=true);
      }

      // Countersink
      translate([stand_off_width_distance, 0, 0]) {
        cylinder(d=m3_head_diameter, h=4 + m3_head_depth + 3, center=true);
      }
    }

    // Nail holes
    translate([total_casing_width / 2, 0.0, ((total_casing_depth) / 2.00) + 1.0]) {
      rotate([0, 90, 90]) {
        cylinder(d=brass_nail_diameter, h=100 + 2.00);
        cylinder(d=brass_nail_head_diameter, h=brass_nail_head_depth);
      }
    }

    // Spring hole
    translate([total_casing_width / 2, casing_wall_thickness - 2.5, ((total_casing_depth) / 2.00) + 1.0]) {
      rotate([0, 90, 90]) {
        cylinder(d=spring_diameter + 0.55, h=1.00);
      }
    }

    // Magnet hole

    // Inside
    // translate([total_casing_width - (casing_wall_thickness + small_magent_position), casing_wall_thickness - (1.5 + small_magnet_height), ((total_casing_depth) / 2.00) + 1.0]) {
    //   rotate([0, 90, 90]) {
    //     cylinder(d=small_magnet_diameter + hole_tight_tolerance, h=(small_magnet_height));
    //   }
    // }

    // Outside magnet hole
    translate([total_casing_width - (casing_wall_thickness + small_magent_position), 0.0, ((total_casing_depth) / 2.00) + 1.0]) {
      rotate([0, 90, 90]) {
        cylinder(d=small_magnet_diameter + hole_tight_tolerance, h=(small_magnet_height - 1.0));
      }
    }

    // D2F Switch
    translate([casing_wall_thickness / 2.00, 0.0, 0.0]) {
      cube([d2f_depth, d2f_width, d2f_length]);
    }
  }
}

Casing();

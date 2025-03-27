include <hotend_slider_helpers.scad>

module Casing() {
  casing_top_buffer = 1.50;
  casing_top_extension = 1.60;
  casing_top_edge_buffer = 1.65 + casing_top_extension;

  total_casing_height = casing_top_buffer + slider_height + slider_movement + casing_wall_thickness;
  total_casing_width = slider_width + casing_wall_thickness;
  total_casing_depth = casing_top_edge_buffer + slider_depth + casing_bottom_thickness;

  // Top/Down of nail holes
  nail_position_z = ((total_casing_depth) / 2.00) + 1.5 + 1.5 - 0.2 - 0.4 + 0.1 + 0.2; // - 0.05 will make the slider bind

  extra_tolerance_for_switch_holes = 0.12;
  switch_hole_hight = 22.00;

  difference() {
    cube([total_casing_width, total_casing_height, total_casing_depth]);

    translate([0.0, casing_top_buffer, 0.0]) {
      // Slider Puck
      translate([(casing_wall_thickness / 2.00), casing_wall_thickness - slider_movement, casing_wall_thickness + casing_top_extension]) {
        cube([slider_width + hole_loose_tolerance, slider_height + slider_movement, slider_depth]);
      }

      // Mounting holes with countersinking - horizontal, through-holes, properly positioned
      translate([casing_wall_thickness + 0.80, total_casing_height / 2.0, (total_casing_depth / 2.0) - (2.8 + 2.3)]) {
        cylinder(d=m3_hole_diameter, h=total_casing_depth + 2.00, center=true);
        cylinder(d=m3_head_diameter + hole_loose_tolerance, h=4 + m3_head_depth + 6 + 1.8 + casing_top_extension);

        translate([stand_off_width_distance, 0, 0]) {
          cylinder(d=m3_hole_diameter, h=total_casing_depth + 2.00, center=true);
          cylinder(d=m3_head_diameter + hole_loose_tolerance, h=4 + m3_head_depth + 6 + 1.8 + casing_top_extension);
        }
      }

      // Spring hole
      // translate([total_casing_width / 2, casing_wall_thickness - 3.0, nail_position_z]) {
      //   rotate([0, 90, 90]) {
      //     cylinder(d=spring_diameter + 0.55, h=1.25 + 2.00);
      //   }
      // }
    }

    // Nail holes
    translate([total_casing_width / 2, 0.0, nail_position_z]) {
      rotate([0, 90, 90]) {
        cylinder(d=m4_hole_diameter + 1.00, h=100.00);
        // cylinder(d=brass_nail_head_diameter + hole_loose_tolerance, h=brass_nail_head_depth);
      }
    }

    // translate([total_casing_width / 2, total_casing_height + 1.0 - brass_nail_head_depth, nail_position_z]) {
    //   rotate([0, 90, 90]) {
    //     cylinder(d=brass_nail_head_diameter + hole_loose_tolerance, h=brass_nail_head_depth);
    //   }
    // }

    // Second guide hole. Offset from mounting holes
    // translate([total_casing_width - (casing_wall_thickness + small_magent_position) - 0.6 + 0.2, 0.0, nail_position_z]) {
    //   rotate([0, 90, 90]) {
    //     cylinder(d=brass_nail_diameter - hole_loose_tolerance, h=100.00);
    //     cylinder(d=brass_nail_head_diameter + hole_loose_tolerance, h=brass_nail_head_depth);
    //   }
    // }

    // translate([total_casing_width - (casing_wall_thickness + small_magent_position) - 0.6 + 0.2, total_casing_height + 1.0 - brass_nail_head_depth, nail_position_z]) {
    //   rotate([0, 90, 90]) {
    //     cylinder(d=brass_nail_head_diameter + hole_loose_tolerance, h=brass_nail_head_depth);
    //   }
    // }

    // D2F Switch Space
    switch_base = 0.2 + 0.7 + 1.50 + 0.55;
    translate([casing_wall_thickness / 2.00, 0.0, switch_base]) {
      cube([d2f_depth, d2f_width + 1.05 + 0.75 - 0.95, d2f_length + casing_top_edge_buffer]); // 1.05
    }

    // Switch Mount Holes
    translate([0.0, 1.75, ((total_casing_depth) / 2.00) + 1.5 + 0.2 - 0.8 + 1.5]) {
      rotate([90, 0, 90]) {
        translate([0.0, d2f_hole_position_from_centre, 0.0]) {
          cylinder(d=m2_hole_diameter + hole_tight_tolerance + extra_tolerance_for_switch_holes, h=switch_hole_hight);
        }

        translate([0.0, -(d2f_hole_position_from_centre + m2_hole_offset), 0.0]) {
          cylinder(d=m2_hole_diameter + hole_tight_tolerance + extra_tolerance_for_switch_holes, h=switch_hole_hight);
        }
      }
    }
  }
}

Casing();

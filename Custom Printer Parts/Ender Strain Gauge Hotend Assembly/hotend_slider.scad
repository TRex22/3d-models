include <hotend_slider_helpers.scad>


module Slider() {
  difference() {
    // Main body
    cube([slider_width, slider_height, slider_depth]);

    // Hotend mounting holes (M3)
    rotate([0, 0, -90]) {
      translate([-3.50, slider_height / 1.25, -1.00]) {
        cylinder(d=M3_Hole_Diameter, h=slider_depth + 2.00);
        translate([-stand_off_width_distance, 0, 0])
          cylinder(d=M3_Hole_Diameter, h=slider_depth + 2.00);
      }
    }

    // Spring holes
    translate([slider_width / 2.00 - spring_hole_offset, spring_diameter - 1.00, slider_depth / 2.00]) {
      rotate([0, -90, 0]) {
        cylinder(d=spring_diameter, h=slider_width);
        // translate([spring_hole_offset * 2, 0, 0])
        // translate([0, -(total_height - (casing_wall_thickness * 2.00) + 1.00), 0]) {
        //   cylinder(d=spring_diameter, h=slider_width);
        // }
      }
    }

    // Guide holes for brass nails
    translate([slider_width / 2.00 - spring_hole_offset, spring_diameter - 1.00, slider_depth / 2.00]) {
      rotate([0, -90, 0]) {
        cylinder(d=slider_guide_hole_diameter, h=slider_width);
        translate([spring_hole_offset * 2, 0, 0])
          cylinder(d=slider_guide_hole_diameter, h=slider_width);
      }
    }
  }
}

Slider();

include <hotend_slider_helpers.scad>

module Slider() {
  difference() {
    // Main body
    cube([slider_width, slider_height, slider_depth]);

    // Hotend mounting holes (M3)
    translate([stand_off_width_distance, slider_height / 2.00, -1.00]) {
      cylinder(d=M3_Hole_Diameter, h=slider_depth+2);
      translate([-stand_off_width_distance, 0, 0])
        cylinder(d=M3_Hole_Diameter, h=slider_depth+2);
    }

    // Spring holes
    translate([slider_width / 2.00 - spring_hole_offset, slider_height-spring_back_space, -1.00]) {
      cylinder(d=spring_diameter, h=slider_depth+2);
      translate([spring_hole_offset * 2, 0.00, 0.00])
        cylinder(d=spring_diameter, h=slider_depth+2);
    }

    // Guide holes for brass nails
    translate([slider_width / 2.00, slider_height-spring_back_space, -1.00])
      cylinder(d=slider_guide_hole_diameter, h=slider_depth + 2.00);
  }
}

Slider();

include <hotend_slider_helpers.scad>

module Slider() {
  difference() {
    // Main body
    cube([slider_width, slider_height, slider_depth]);

    // Hotend mounting holes (M3)
    rotate([0, 0, -90]) {
      translate([-3.50, slider_height / 1.25, -1.00]) {
        cylinder(d=M3_Hole_Diameter + hole_tight_tolerance, h=slider_depth + 2.00);
        translate([-stand_off_width_distance, 0, 0])
          cylinder(d=M3_Hole_Diameter + hole_tight_tolerance, h=slider_depth + 2.00);
      }
    }

    // Single centered spring hole
    translate([spring_back_space, slider_height/2, slider_depth/2])
      rotate([0, 90, 0])
      cylinder(d=spring_diameter + 0.55, h=slider_width + 1);

    translate([0, slider_height/2, slider_depth/2])
      rotate([0, 90, 0])
      cylinder(d=slider_guide_hole_diameter, h=slider_width);
  }
}

Slider();

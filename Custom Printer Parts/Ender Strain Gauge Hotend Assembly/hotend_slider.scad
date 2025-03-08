include <hotend_slider_helpers.scad>

module Slider() {
  half_depth = slider_depth / 2.00;
  half_height = slider_height / 2.00;

  shortner = 5.00 + 1.15;
  magnet_position = slider_width - (shortner + small_magnet_height);

  difference() {
    // Main body
    cube([slider_width - shortner, slider_height, slider_depth]);

    // Hotend mounting holes (M3)
    rotate([0, 0, -90]) {
      translate([-3.50, half_height - 2.5, -1.00]) {
        cylinder(d=m3_hole_diameter + hole_tight_tolerance, h=slider_depth + 2.00);
        translate([-stand_off_width_distance, 0, 0])
          cylinder(d=m3_hole_diameter + hole_tight_tolerance, h=slider_depth + 2.00);
      }
    }

    // Single centered spring hole
    translate([spring_back_space, half_height, half_depth])
      rotate([0, 90, 0])
      cylinder(d=spring_diameter + 0.55, h=slider_width - shortner + 1.00);

    translate([0, half_height, half_depth])
      rotate([0, 90, 0])
      cylinder(d=slider_guide_hole_diameter, h=slider_width - shortner + 1.00);

    // Magnet Holes
    translate([magnet_position, small_magent_position, half_depth])
      rotate([0, 90, 0])
      cylinder(d=small_magnet_diameter + hole_tight_tolerance, h=magnet_position);

    translate([magnet_position, (slider_height - small_magent_position), half_depth])
      rotate([0, 90, 0])
      cylinder(d=small_magnet_diameter + hole_tight_tolerance, h=magnet_position);
  }
}

Slider();

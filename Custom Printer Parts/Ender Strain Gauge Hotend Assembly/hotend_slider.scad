include <hotend_slider_helpers.scad>

module Slider() {
  top_extension = 1.60 + 1.70 + 0.2;

  half_depth = slider_depth / 2.00;
  half_height = (slider_height - 0.80) / 2.00; // 1.02
  slider_tolerance = 0.40; // - 1.02

  slider_height_with_offsets = slider_height - slider_tolerance; // side dimensions
  slider_depth_with_offsets = slider_depth + top_extension - 0.32 - 0.2 - 3.60;

  slider_guide_hole_diameter = brass_nail_diameter + hole_loose_tolerance; // For brass nails

  shortner = (5.00 + 1.15 + 0.3) - 3.5;
  magnet_position = slider_width - (shortner + small_magnet_height);

  rotate([0, 180, 0]) { // Make sure right way up
    difference() {
      // Main body
      cube([slider_width - shortner, slider_height_with_offsets, slider_depth_with_offsets]);

      // Hotend mounting holes (M3)
      rotate([0, 0, -90]) {
        translate([-2.60, half_height - 1.2, - 1.00]) {
          cylinder(d=m3_hole_diameter + hole_tight_tolerance, h=slider_depth_with_offsets + 2.00);
          translate([-stand_off_width_distance, 0, 0]) {
            cylinder(d=m3_hole_diameter + hole_tight_tolerance, h=slider_depth_with_offsets + 2.00);
          }
        }
      }

      // Single centered spring hole
      translate([spring_back_space, half_height, half_depth]) {
        rotate([0, 90, 0])
        cylinder(d=spring_diameter + 0.55, h=slider_width - shortner);
      }

      // Guide hole
      translate([0, half_height, half_depth]) {
        rotate([0, 90, 0])
        cylinder(d=slider_guide_hole_diameter, h=slider_width - shortner + 1.00);
      }

      // Second guide hole. Offset from mounting holes
      translate([0.0, slider_height - 5.80, half_depth]) {
        rotate([0, 90, 0])
        cylinder(d=slider_guide_hole_diameter, h=100);
      }

      // Bottom guide hole
      translate([0.0, 5.0, half_depth]) {
        rotate([0, 90, 0])
        cylinder(d=slider_guide_hole_diameter, h=100);
      }
    }
  }
}

Slider();

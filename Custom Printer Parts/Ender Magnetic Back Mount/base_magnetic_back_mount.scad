// Redesign of the Ender 2 Pro Fan Holder Remix
// Aim is to make it parameterised for easy modification

include <../../shared_helper.scad>

base_thickness = 6.00;
// top_thickness = 5.00;
top_carve_out = 1.00;

medium_magnet_height_with_offset = medium_magnet_height - hole_tight_tolerance;
medium_magnet_diameter_with_offset = medium_magnet_diameter - hole_tight_tolerance;

base_height = 17.35;
base_width = 24.25 + 3.00;

outer_height = 38.35;
outer_width = 48.65;

mount_hole_diameter = 6.00 - (hole_tight_tolerance + hole_tight_tolerance);
mount_hole_diameter_offset = mount_hole_diameter / 2.0;
mount_hole_height = 100.00;
mount_hole_edge_distance = 4.50 + 2.00;
mount_hole_vertical_distance = (base_height / 2.0) - 1.0;

// 4 Magnets
// magnet_height_difference = 28.65;
// magnet_width_difference = 38.65;

// arms
arm_length = 18.90; // 15.00 + ±4 - 4.00
arm_width = 8.90;
arm_magnet_hole_diameter = 5.00;
arm_corner_radius = 2.50;
arm_magnet_distance_from_edge = 4.00;

round_diameter = 9.00;
shift_from_rounding = round_diameter / 2.0;

DEG_TO_RAD = 0.01745329252; // PI / 180;

extra_tolerance_for_m2 = 0.14;

// Can be modified for different mounting options
module MountingHoles() {
  translate([mount_hole_edge_distance, mount_hole_vertical_distance, 0]) {
    cylinder(d=mount_hole_diameter, h=mount_hole_height);
  }

  translate([base_width - mount_hole_edge_distance, mount_hole_vertical_distance, 0]) { // mount_hole_diameter_offset
    cylinder(d=mount_hole_diameter, h=mount_hole_height);
  }
}

module BackCleranceCutout() {
  translate([-20.00, (base_height / 2.0) + (mount_hole_diameter / 2.0) + 2.0, 0]) {
    cube([100.00, 100.00, top_carve_out]);
  }
}

module Arm(x, y, rotation) {
  translate([x, y, 0]) {
    rotate([0, 0, rotation]) {
      difference() {
        union() {
          // Arms
          translate([0.0, 3.5, 0.0]) {
            cube([arm_width, arm_length - shift_from_rounding, base_thickness]);
          }

          // Round mount points
          translate([arm_width / 2.00, arm_magnet_distance_from_edge, 0]) {
            cylinder(d=round_diameter, h=base_thickness);
          }
        }

        translate([arm_width / 2.00, arm_magnet_distance_from_edge, 0]) { // arm_magnet_distance_from_edge
          cylinder(d=m2_hole_diameter + hole_loose_tolerance + extra_tolerance_for_m2 - hole_tight_tolerance, h=mount_hole_height);

          translate([0, 0, base_thickness - medium_magnet_height]) {
            cylinder(d=medium_magnet_diameter + hole_loose_tolerance + hole_loose_tolerance, h=medium_magnet_height);
          }
        }
      }
    }
  }
}

module Arms() {
  Arm(base_width + 6, -(base_height / 2.0) - 4, 45); // bottom right
  Arm(-12, -6, -45); // bottom left
  Arm(base_width + 12, -(base_height / 2.0) + 32, 135); // top right
  Arm(-6, -(base_height / 2.0) + 38, 225); // top left
}

module Base() {
  difference() {
    union() {
      cube([base_width, base_height, base_thickness]);
      Arms();
    }

    MountingHoles();
    BackCleranceCutout();
  }
}

Base();

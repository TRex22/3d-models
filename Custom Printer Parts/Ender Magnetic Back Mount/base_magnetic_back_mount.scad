// Redesign of the Ender 2 Pro Fan Holder Remix
// Aim is to make it parameterised for easy modification

include <../../shared_helper.scad>

base_thickness = 6.00;
// top_thickness = 5.00;
top_carve_out = 1.00;

medium_magnet_height_with_offset = medium_magnet_height - hole_tight_tolerance;
medium_magnet_diameter_with_offset = medium_magnet_diameter - hole_tight_tolerance;

base_height = 17.35;
base_width = 24.25;

outer_height = 38.35;
outer_width = 48.65;

mount_hole_diameter = 6.00;
mount_hole_height = 100.00;
mount_hole_edge_distance = 4.50;

// 4 Magnets
magnet_height_difference = 28.65;
magnet_width_difference = 38.65;

// arms
arm_length = 18.90; // 15.00 + ±4
arm_width = 8.90;
arm_magnet_hole_diameter = 5.00;
arm_corner_radius = 2.50;
arm_magnet_distance_from_edge = 4.00;

DEG_TO_RAD = 0.01745329252; // PI / 180;

// Can be modified for different mounting options
module MountingHoles() {
  translate([mount_hole_edge_distance, base_height / 2.0, 0]) {
    cylinder(d=mount_hole_diameter, h=mount_hole_height);
  }

  translate([base_width - mount_hole_edge_distance, base_height / 2.0, 0]) {
    cylinder(d=mount_hole_diameter, h=mount_hole_height);
  }
}

module Arm(x, y, rotation) {
  translate([x, y, 0]) {
    rotate([0, 0, rotation]) {
      difference() {
        cube([arm_width, arm_length, base_thickness]);

        translate([arm_width / 2.00, arm_magnet_distance_from_edge, 0]) { // arm_magnet_distance_from_edge
          cylinder(d=m2_hole_diameter, h=mount_hole_height);

          translate([0, 0, base_thickness - medium_magnet_height]) {
            cylinder(d=medium_magnet_diameter, h=medium_magnet_height);
          }
        }
      }
    }
  }
}

module Arms() {
  for (i = [0, 1, 2, 3]) {
    angle = i * 90; // 0, 90, 180, 270 degrees
    x_offset = base_width / 2.00 - arm_width / 2.00;
    y_offset = base_height / 2.00 - arm_length / 2.00;

    x = 0.0;
    y = 0.0;

    if (i % 2 == 0) {
      // Left side arms
      x = x_offset * cos(angle * DEG_TO_RAD) /- y_offset * sin(angle * DEG_TO_RAD);
      y = x_offset * sin(angle * DEG_TO_RAD) /+ y_offset * cos(angle * DEG_TO_RAD);
    } else {
      // Right side arms
      x = -x_offset * cos(angle * DEG_TO_RAD) /+ y_offset * sin(angle * DEG_TO_RAD);
      y = -x_offset * sin(angle * DEG_TO_RAD) /- y_offset * cos(angle * DEG_TO_RAD);
    }

    Arm(x, y, angle);
  }
}

module Base() {
  difference() {
    cube([base_width, base_height, base_thickness]);
    MountingHoles();
  }
}

union() {
  Base();
  Arms();

  // Arm(base_width + 2, 2 - arm_length, 45); // bottom right
  // Arm(1, 10, 45); // top left
  // Arm(base_width + arm_width + 4, 24, -225); // top right
  // Arm(base_width + arm_width - 4, -13, 45);
}

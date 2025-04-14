// Redesign of the Ender 2 Pro Fan Holder Remix
// Aim is to make it useable with the strain gauge

include <base_magnetic_back_mount.scad>

mount_expansion = base_thickness + 7.9 + 2.10;
mount_hole_diameter = 5.00 - hole_tight_tolerance; // 3mm for smaller diameter

extended_base_height = 20.00;
mount_hole_vertical_distance = (base_height / 2.0) - 1.0 + 19.5;

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
            cylinder(d=round_diameter, h=mount_expansion);
          }
        }

        translate([arm_width / 2.00, arm_magnet_distance_from_edge, 0]) { // arm_magnet_distance_from_edge
          cylinder(d=m2_hole_diameter + hole_loose_tolerance + extra_tolerance_for_m2 - hole_tight_tolerance, h=mount_hole_height);

          translate([0, 0, mount_expansion - medium_magnet_height]) {
            cylinder(d=medium_magnet_diameter + hole_loose_tolerance, h=medium_magnet_height);
          }
        }
      }
    }
  }
}

module Base() {
  difference() {
    union() {
      cube([base_width, base_height + extended_base_height, base_thickness]);
      Arms();
    }

    MountingHoles();
    BackCleranceCutout();
  }
}

Base();

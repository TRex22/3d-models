// This is the modified Ender 2 Pro X-Carriage design for 3D printing
// Rather than having

// Include original file to access all modules and variables
include <x_axis_carriage_printable_design.scad>

// Variables
// x_probe_mount_translation = - (25 + (plate_width - right_fork_width));
// y_probe_mount_translation = - ((68 - 2) + thickness);
// z_probe_mount_translation = 79.530 + fork_height + 1;

// Probe Mount will go over the fork blocking
// When guiding the belts will need to shift the motor back by about 2mm,
// can use washers
probe_mount_rotation = [180, 0, 0];

x_probe_mount_translation = 38.0;
y_probe_mount_translation = -30.0 - 0.50 - 2.0;
z_probe_mount_translation = 12 + 1.0; // + 0.94 // 1.44

// Probe Holder Overhang Extension
extension_x_translation = 20.0;
extension_y_translation = 0.0;
extension_z_translation = 0.0;

extension_width = 20.00;
extension_hieght = 10.00;
extension_depth = 5.00;

// Probe Holder Magnet Holes
magnet_hole_x_translation = 47.50;
magnet_hole_y_translation = 6.50;
magnet_hole_z_transation = 14.00;

magnet_hole_diameter = 5.15;
magnet_hole_outer_diameter = 8.00;
magnet_hole_height = 3.20;

magnet_hole_translation = 5.00 + 6.00;

module klackender_probe_mount() {
  translate([x_probe_mount_translation, y_probe_mount_translation, z_probe_mount_translation])
  rotate(probe_mount_rotation)
  import("Klackender_probe_holder_solid.stl");
  // import("Probe_Mount.stl");
}

// Disabled in favour of editing the stl
// module klackender_probe_mount_overhang_extension() {
//   translate([plate_width - 8.8 - 2.30 + 7.0, plate_height - 3.47 - 3.30 - 3.0, -1])
//   linear_extrude(height = thickness + 10.0)
//   hull() {
//     square([ziptie_hole_width, ziptie_hole_height]);
//   }
// }

// Rather clear and flatten the back
module klackender_probe_mount_back_removal() {
  translate([0.0, -20.0, -2])
  linear_extrude(height = 2.0)
  hull() {
    square([plate_width + 20.00, plate_height + 20.00]);
  }
}

module klackender_magent_holes() {
  // Right
  rotate([90, 0, 0])
  translate([magnet_hole_x_translation, magnet_hole_y_translation, magnet_hole_z_transation])
  difference() {
    linear_extrude(height = magnet_hole_height)
    circle(d = magnet_hole_outer_diameter);

    linear_extrude(height = magnet_hole_height)
    circle(d = magnet_hole_diameter);
  }

  // left
  rotate([90, 0, 0])
  translate([magnet_hole_x_translation + magnet_hole_translation, magnet_hole_y_translation, magnet_hole_z_transation])
  difference() {
    linear_extrude(height = magnet_hole_height)
    circle(d = magnet_hole_outer_diameter);

    linear_extrude(height = magnet_hole_height)
    circle(d = magnet_hole_diameter);
  }
}

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    union() {
      main_plate();
      // main_plate_with_chamfer();
      // standoffs(); // Remove stand-offs
      klackender_probe_mount();
      // klackender_probe_mount_overhang_extension();
      klackender_magent_holes();
      forks_and_eyelet();
      forks_blocking();
    }
    union() {
      central_cutout();
      clearance_of_bottom_extrusion();
      ziptie_hole();
      klackender_probe_mount_back_removal();
    }
  }
}

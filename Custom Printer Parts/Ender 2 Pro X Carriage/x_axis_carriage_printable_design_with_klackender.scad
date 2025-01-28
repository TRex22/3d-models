// This is the modified Ender 2 Pro X-Carriage design for 3D printing
// Rather than having

// Include original file to access all modules and variables
include <x_axis_carriage_printable_design.scad>

// Variables
// x_probe_mount_translation = - (25 + (plate_width - right_fork_width));
// y_probe_mount_translation = - ((68 - 2) + thickness);
// z_probe_mount_translation = 79.530 + fork_height + 1;
probe_mount_rotation = [180, 0, 0];

x_probe_mount_translation = 38.0;
y_probe_mount_translation = -30.0 - 0.50;
z_probe_mount_translation = 12 + 0.94; // 1.44

module klackender_probe_mount() {
  translate([x_probe_mount_translation, y_probe_mount_translation, z_probe_mount_translation])
  rotate(probe_mount_rotation)
  import("Klackender_probe_holder_solid.stl");
  // import("Probe_Mount.stl");
}

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    union() {
      main_plate();
      klackender_probe_mount();
      forks_and_eyelet();
    }
    central_cutout();
  }
}

// This is the modified Ender 2 Pro X-Carriage design for 3D printing
// Rather than having

// Include original file to access all modules and variables
include <x_axis_carriage_printable_design.scad>

// Variables
x_probe_mount_translation = - (25 + (plate_width - right_fork_width));
y_probe_mount_translation = - (68 + thickness);
z_probe_mount_translation = 79.530 + fork_height;

module klackender_probe_mount() {
  // rotate([180, 0, 0]);
  // translate([x_probe_mount_translation, 0, z_probe_mount_translation]);

  translate([x_probe_mount_translation, y_probe_mount_translation, z_probe_mount_translation])
  rotate([180, 0, 0])
  import("Probe_Mount.stl");
}

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    union() {
      main_plate();

      // standoffs(); // Remove stand-offs

      klackender_probe_mount();

      forks_and_eyelet();
    }
    central_cutout();
  }
}

// Custom design hotend z-height sensor using the original
// Creality Endstop PCB and pinout
// Version 1.0

include <../../shared_helper.scad>

revision = 1.0;

mount_width = 45.6;
mount_height = 16.00;
mount_thickness = 6.00;
mount_wall_depth = 9.00;

module CompileModel() {
  union() {
    cube([mount_width, mount_height, mount_thickness]);

  }
}

CompileModel();

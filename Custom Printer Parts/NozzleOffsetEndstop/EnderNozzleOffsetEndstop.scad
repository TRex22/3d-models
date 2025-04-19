// Custom design hotend z-height sensor using the original
// Creality Endstop PCB and pinout

include <../../shared_helper.scad>

mount_width = 4.00 + creality_endstop_board_width;
mount_height = 29.00 + creality_endstop_board_height + creality_endstop_plug_height_extension;
mount_thickness = 9.00;

// creality_endstop_hole_diameter
// creality_endstop_hole_offset
// creality_endstop_board_back_space

module CrealityEndstopMountHoles() {
  cylinder(d=creality_endstop_hole_diameter, h=100.00, center=true);

  translate([creality_endstop_hole_offset, 0, 0]) {
    cylinder(d=creality_endstop_hole_diameter, h=100.00, center=true);
  }
}

difference() {
  cube([mount_width, mount_height, mount_thickness]);
  translate([0, 0, 0]) {
    CrealityEndstopMountHoles();
  }
}

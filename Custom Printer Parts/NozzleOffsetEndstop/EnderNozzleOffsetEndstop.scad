// Custom design hotend z-height sensor using the original
// Creality Endstop PCB and pinout

include <../../shared_helper.scad>

switch_buffer = 4.00;
switch_height = 29.00;
mount_width = switch_buffer + creality_endstop_board_width;
mount_height = switch_height + creality_endstop_board_height + creality_endstop_plug_height_extension;
mount_thickness = 9.00;

// creality_endstop_board_back_space
module CreateSingeMountHolePair(new_switch_height) {
  translate([switch_buffer + 0.50, new_switch_height, 0]) {
    CrealityEndstopMountHoles(mount_thickness + 10.00, true);
  }
}

module CreateAdjustableMountingHoles(base_switch_height) {
  CreateSingeMountHolePair(base_switch_height);

  added_height = creality_endstop_hole_diameter / 6.0;
  new_switch_height = base_switch_height + added_height;
  CreateSingeMountHolePair(new_switch_height);

  new_switch_height_2 = new_switch_height + added_height;
  CreateSingeMountHolePair(new_switch_height_2);

  new_switch_height_3 = new_switch_height + added_height;
  CreateSingeMountHolePair(new_switch_height_3);

  new_switch_height_4 = new_switch_height + added_height;
  CreateSingeMountHolePair(new_switch_height_4);

  new_switch_height_5 = new_switch_height + added_height;
  CreateSingeMountHolePair(new_switch_height_5);

  new_switch_height_6 = new_switch_height + added_height;
  CreateSingeMountHolePair(new_switch_height_6);
}

difference() {
  cube([mount_width, mount_height, mount_thickness]);

  CreateAdjustableMountingHoles(switch_height);
  CreateAdjustableMountingHoles(switch_height + (creality_endstop_hole_diameter - 1.0));
  CreateAdjustableMountingHoles(switch_height + 2 * (creality_endstop_hole_diameter - 1.0));
  CreateAdjustableMountingHoles(switch_height + 3 * (creality_endstop_hole_diameter - 1.0));

  translate([switch_buffer - 0.4, switch_height - 1.0, (mount_thickness - creality_endstop_back_thickness)]) {
    base_cutout_extension = (creality_endstop_hole_diameter - 1.0) * 6.0 + 1.0;
    CrealityEndstopBackSpace(base_cutout_extension);
  }
}

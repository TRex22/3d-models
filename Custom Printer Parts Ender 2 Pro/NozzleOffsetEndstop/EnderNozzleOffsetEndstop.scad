// Custom design hotend z-height sensor using the original
// Creality Endstop PCB and pinout
// Version 1.3

include <../../shared_helper.scad>

revision = 1.3;

switch_buffer = 4.00;
switch_height = 29.00 - 8.00;

mount_width = switch_buffer + creality_endstop_board_width;
mount_height = switch_height + creality_endstop_board_height + creality_endstop_plug_height_extension - 6.50;
mount_thickness = 9.00;

foot_mount_width = 8.00;
foot_mount_height = 6.00;
foot_mount_width_distance = 15.00;
foot_mount_edge_distance = 4.50;

wire_cutout_size = 2.80;

module CreateCountersunkM3Holes() {
  rotate([-90, 0, 0]) {
    translate([foot_mount_edge_distance, - (foot_mount_width / 2.0), 0]) {
      cylinder(d=m3_hole_diameter + hole_very_loose_tolerance, h=100.00);

      translate([foot_mount_width_distance, 0, 0]) {
        cylinder(d=m3_hole_diameter + hole_very_loose_tolerance, h=100.00);
      }

      // Countersink
      translate([0, 0, (foot_mount_height + hole_very_loose_tolerance - m3_head_depth)]) {
        cylinder(d=m3_head_diameter + hole_very_loose_tolerance, h=m3_head_depth);

        translate([foot_mount_width_distance, 0, 0]) {
          cylinder(d=m3_head_diameter + hole_very_loose_tolerance, h=m3_head_depth);
        }
      }
    }
  }
}

module CreateBackMountBlock() {
  translate([0.0, 0.0, 1.0 - mount_thickness]) {
    difference() {
      cube([mount_width, foot_mount_height, foot_mount_width]);
      CreateCountersunkM3Holes();
    }
  }
}

module CreateWireCutout() {
  translate([(mount_width / 2.0) - 1.5, 0.0, -20.0]) {
    cube([wire_cutout_size, wire_cutout_size, 100.00]);
  }
}

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

module CompileModel() {
  difference() {
    union() {
      cube([mount_width, mount_height, mount_thickness]);
      CreateBackMountBlock();
    }

    CreateAdjustableMountingHoles(switch_height);
    CreateAdjustableMountingHoles(switch_height + (creality_endstop_hole_diameter - 1.0));
    CreateAdjustableMountingHoles(switch_height + 2 * (creality_endstop_hole_diameter - 1.0));
    CreateAdjustableMountingHoles(switch_height + 3 * (creality_endstop_hole_diameter - 1.0));
    CreateAdjustableMountingHoles(switch_height + 4 * (creality_endstop_hole_diameter - 1.0));

    translate([switch_buffer - 0.4, switch_height - 1.0, (mount_thickness - creality_endstop_back_thickness)]) {
      base_cutout_extension = (creality_endstop_hole_diameter - 1.0) * 6.0 + 1.0 + 1.0;
      CrealityEndstopBackSpace(base_cutout_extension);
    }

    CreateWireCutout();
  }
}

CompileModel();

// Shared Helper variables and modules

// Variables
quality_value = 100;
$fn = quality_value;

// Screw Holes
m2_hole_diameter = 1.85; // 1.95;
m2_loose_diameter = 2.50;
m2_counter_sink_diameter = 3.80;
m2_counter_sink_length = 2.00;
m2_hole_offset = m2_hole_diameter / 2.0;
m2_hole_height = 100.00;
m2_nut_outer_width = 3.90;
m2_nut_outer_height = 4.40;
m2_nut_outer_depth = 1.50;
// M2_Counter_Sink_Depth

m3_hole_diameter = 2.9; // 2.8
m3_hole_offset = m3_hole_diameter / 2.0;
m3_hole_height = 100.00;
m3_head_diameter = 6.2;
m3_head_depth = 3.0; // 2.5??, 3.0

m4_hole_diameter = 3.85; // 3.90
m4_hole_offset = m4_hole_diameter / 2.0;
m4_hole_height = 100.00;
m4_head_diameter = 7.55;
m4_head_depth = 3.0; // 2.5??, 3.0

// Tolerances
hole_tight_tolerance = 0.05;
hole_loose_tolerance = 0.20;
hole_very_loose_tolerance = 0.40;

// Springs
spring_diameter = 5.45;
spring_length = 35.00;

// Nails
brass_nail_diameter = 2.4; // 2.00; // 1.95 at the beginning it tapers
brass_nail_length = 29.54;
brass_nail_head_diameter = 3.20; // 3.00; // oval 2.84 - 3.1 mm
brass_nail_head_depth = 1.80; //1.00; // 1.80; // 2.00;

// General Variables
v_wheel_hole_diameter = 5.20;
v_wheel_offset = (v_wheel_hole_diameter / 2.0) + 2.0;

// Hot-End Holes
stand_off_hole_diameter = m3_hole_diameter;
stand_off_width_distance = 11.60 + stand_off_hole_diameter;

// Magnets
// Small Magnet (Neo)
small_magnet_height = 2.00; // ±2.00 1.97
small_magnet_diameter = 3.00; // ±3.00 // 2.98

// Medium Magnet (Neo)
medium_magnet_height = 2.96; // ±3.00
medium_magnet_diameter = 5.00;

// Large Magnet (ferrite)
large_magnet_height = 2.98; // ±3.00
large_magnet_diameter = 9.79; // ±10.00

// Switches
// D2F Switch
d2f_length = 12.88; // ±12.70
d2f_width = 5.84; // ±5.70
d2f_depth = 6.20; // ±7.00 (5 + 2) ... ±6.50
d2f_pins = 9.00 - 6.50;
d2f_plunger_length = 2.64;
d2f_plunger_width = 0.97; // ±1.00
d2f_plunger_depth = 0.39; // ±0.50
d2f_mount_hole_position = 2.10;
d2f_hole_position_from_centre = 2.85;
d2f_pin_pre_travel = 0.50;
d2f_mount_hole_shift = 4.40 + m2_hole_offset + m2_hole_offset;
d2f_switch_base = 0.2 + 0.7 + 1.50 + 0.55 - 1.0;
d2f_switch_hole_hight = 22.00;
d2f_extra_tolerance_for_switch_holes = 0.12;

// 10t85 Switch
10t85_length = 20.04; // ±19.90
10t85_width = 6.34; // ±6.40
10t85_depth = 10.64; // ±10.70
10t85_plunger_length = 3.28; // ±4.00
10t85_plunger_width = 1.96;
10t85_plunger_depth = 1.30;

// Creality Endstop Board, 2208 V2.0
// creality_endstop_hole_diameter = m3_hole_diameter + hole_loose_tolerance; // Hole is M3 sized but meant for a loose M2
creality_endstop_hole_diameter = m2_hole_diameter + hole_tight_tolerance;
creality_endstop_hole_offset = 15.00;
creality_endstop_board_height = 20.30;
creality_endstop_plug_height_extension = 2.00;
creality_endstop_board_width = 20.20;
creality_endstop_board_thickness = 1.30;
creality_endstop_board_pins_thickness = 3.20 - creality_endstop_board_thickness;
creality_endstop_board_switch_thickness = 8.50 - creality_endstop_board_thickness;
creality_endstop_board_back_space = 2.00; // Taken from the rail mount bracket
creality_endstop_board_back_height = 14.90;
creality_endstop_board_back_width = 16.80;
creality_endstop_back_thickness = 3.30;
creality_endstop_back_hole_wall_spacing = 1.50; //3.00;

// Small Tactile Switch
small_tactile_switch_length = 6.21;
small_tactile_switch_width = 6.17;
small_tactile_switch_depth = 3.18;
small_tactile_switch_plunger_diameter = 3.40;
small_tactile_switch_plunger_depth = 1.40;

// Large Tactile Switch
large_tactile_switch_length = 12.03;
large_tactile_switch_width = 11.95;
large_tactile_switch_depth = 3.12;
large_tactile_switch_plunger_length = 3.75;
large_tactile_switch_plunger_width = 3.70;
large_tactile_switch_plunger_depth = 3.94;

// Button
button_topper_top_diameter = 11.65;
button_topper_bottom_diameter = 12.96;
button_topper_depth = 5.64;
button_topper_bottom_depth = 4.38;

// Belts
// GT2

// Modules
// Creality Mounting Holes
module CrealityCounterSunkHotEndMountingHoles(total_casing_depth, casing_top_extension) {
  // Mounting holes with countersinking - horizontal, through-holes, properly positioned
  cylinder(d=m3_hole_diameter, h=total_casing_depth + 2.00, center=true);
  cylinder(d=m3_hole_diameter, h=total_casing_depth + 2.00, center=true);

  translate([stand_off_width_distance, 0, 0]) {
    cylinder(d=m3_hole_diameter, h=total_casing_depth + 2.00, center=true);
    cylinder(d=m3_head_diameter + hole_loose_tolerance, h=4 + m3_head_depth + 6 + 1.8 + casing_top_extension);
  }
}

module CrealityHotEndMountingHoles(total_casing_depth) {
  cylinder(d=m3_hole_diameter, h=total_casing_depth + 2.00, center=true);

  translate([stand_off_width_distance, 0, 0]) {
    cylinder(d=m3_hole_diameter, h=total_casing_depth + 2.00, center=true);
  }
}

module CrealityEndstopMountHoles(height, include_back_nut_cutout) {
  cylinder(d=creality_endstop_hole_diameter, h=height, center=true);

  translate([creality_endstop_hole_offset, 0, 0]) {
    cylinder(d=creality_endstop_hole_diameter, h=height, center=true);
  }

  if (include_back_nut_cutout) {
    back_depth = m2_nut_outer_depth;

    translate([-2.0, -2.0, 0]) {
      cube([m2_nut_outer_width, m2_nut_outer_height, back_depth]);

      translate([creality_endstop_hole_offset, 0, 0]) {
        cube([m2_nut_outer_width, m2_nut_outer_height, back_depth]);
      }
    }
  }
}

module CrealityEndstopBackSpace(base_cutout_extension) {
  // Smaller gap between screw holes
  translate([creality_endstop_hole_diameter + creality_endstop_back_hole_wall_spacing, 0.0, 0.0]) {
    cube([creality_endstop_board_back_width - 2 * (creality_endstop_hole_diameter + creality_endstop_back_hole_wall_spacing), base_cutout_extension, creality_endstop_back_thickness + 1.0]);
  }

  // Top gap part
  translate([0.0, base_cutout_extension, 0]) {
    cube([creality_endstop_board_back_width, (creality_endstop_board_back_height + base_cutout_extension), creality_endstop_back_thickness + 1.0]);
  }
}

// D2F Switch Mounting
module D2F_Switch_Space() { // Should be used as a negative / difference space
  // D2F Switch Space
  // switch_base = 0.2 + 0.7 + 1.50 + 0.55;
  // switch_base = 0.2 + 0.7 + 1.50 + 0.55 - 1.0;
  switch_base = d2f_switch_base;

  // cube([d2f_depth, d2f_width + 1.05 + 0.75 - 0.95, d2f_length + casing_top_edge_buffer]); // 1.05
  cube([d2f_length, (d2f_width + 2.00) + d2f_pins, d2f_depth]);
}

module D2F_Switch_Mount_Holes() {
  rotate([0, 0, 90]) {
    translate([0.0, d2f_hole_position_from_centre, 0.0]) {
      cylinder(d=m2_hole_diameter + hole_tight_tolerance + (d2f_extra_tolerance_for_switch_holes * 3), h=d2f_switch_hole_hight);
    }

    translate([0.0, -(d2f_hole_position_from_centre + m2_hole_offset), 0.0]) {
      cylinder(d=m2_hole_diameter + hole_tight_tolerance + (d2f_extra_tolerance_for_switch_holes * 3), h=d2f_switch_hole_hight);
    }
  }
}

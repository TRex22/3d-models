// Shared Helper variables and modules

// Variables
quality_value = 100;
$fn = quality_value;

// Screw Holes
m2_hole_diameter = 1.85; // 1.95;
m2_hole_offset = m2_hole_diameter / 2.0;
m2_hole_height = 100.00;
// M2_Counter_Sink_Depth

m3_hole_diameter = 2.9; // 2.8
m3_hole_offset = m3_hole_diameter / 2.0;
m3_hole_height = 100.00;
m3_head_diameter = 6.2;
m3_head_depth = 3.0; // 2.5??, 3.0

// Tolerances
hole_tight_tolerance = 0.05;
hole_loose_tolerance = 0.20;

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
d2f_depth = 6.20; // ±7.00 (5 + 2)
d2f_plunger_length = 2.64;
d2f_plunger_width = 0.97; // ±1.00
d2f_plunger_depth = 0.39; // ±0.50
d2f_mount_hole_position = 2.10;
d2f_hole_position_from_centre = 2.85;
d2f_mount_hole_shift = 4.40 + m2_hole_offset + m2_hole_offset;

// 10t85 Switch
10t85_length = 20.04; // ±19.90
10t85_width = 6.34; // ±6.40
10t85_depth = 10.64; // ±10.70
10t85_plunger_length = 3.28; // ±4.00
10t85_plunger_width = 1.96;
10t85_plunger_depth = 1.30;

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


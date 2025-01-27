// Ender 2 Pro X-Axis Mounting Carriage Plate
// All measurements are from the closest edge of each hole

// High quality settings
quality_value = 100;
$fn = quality_value;

// Variables
// Base Dimensions
thickness = 2.52;
base_plate_height = 132.88;
base_plate_width = 94.00;

base_plate_radius = 8.00; // 45 degrees??
neck_transition_radius = 10.00; // Radius for the outward curve at neck transition

base_plate_head_height = 50.00;
base_plate_head_width = base_plate_width;
base_plate_head_top_height = 48.45;
base_plate_head_bottom_height = 17.00;

base_plate_stem_width = 20.00;
base_plate_stem_height = 82.76;

base_plate_stem_offset = 36.85;
base_plate_offset_at_neck = base_plate_stem_offset - (23.20 - base_plate_stem_width);

// Hole variables
hole_z_height = 100.00;

// V-Wheel Holes
v_wheel_diameter = 5.30;
v_wheel_distance_between_top_holes = 70.40;

v_wheel_distance_from_adjustable_hole = 60.43;
adjustable_v_wheel_from_bottom = 32.70; // measured + 9.50

v_wheel_offset = (v_wheel_diameter / 2.0);
top_v_wheel_distance_from_bottom_edge = adjustable_v_wheel_from_bottom + v_wheel_offset + v_wheel_distance_from_adjustable_hole; // base_plate_stem_height + (9.50 + v_wheel_offset); // 94.24

left_v_wheel_diameter = v_wheel_diameter;
left_v_wheel_offset = v_wheel_offset;
left_v_wheel_distance_from_left = (8.90 + left_v_wheel_offset);

right_v_wheel_diameter = v_wheel_diameter;
right_v_wheel_offset = v_wheel_offset;
right_v_wheel_distance_from_left = base_plate_head_width - left_v_wheel_distance_from_left;

// Motor hole - centered
motor_hole_diameter = 23.10 - 1.10; // Reduce clearance for a tight fit
motor_hole_offset = (motor_hole_diameter / 2.0);
motor_hole_distance_from_left = base_plate_width / 2.0;  // Centers the hole horizontally // base_plate_width - (37.00 + motor_hole_offset); // 27.6
motor_hole_distance_from_top = base_plate_height - (10.7 + motor_hole_offset);

// Motor mount holes
motor_mount_hole_diameter = 3.59;
motor_mount_hole_offset = (motor_mount_hole_diameter / 2.0);
motor_mount_hole_spacing = 31.04;  // Standard NEMA17 mounting hole spacing

top_left_motor_mount_hole_distance_from_left = motor_hole_distance_from_left - (motor_mount_hole_spacing / 2.0);
top_left_motor_mount_hole_distance_from_top = motor_hole_distance_from_top - (motor_mount_hole_spacing / 2.0);

bottom_left_motor_mount_hole_distance_from_left = top_left_motor_mount_hole_distance_from_left;
bottom_left_motor_mount_hole_distance_from_top_left_hole = motor_hole_distance_from_top + (motor_mount_hole_spacing / 2.0);

bottom_right_motor_mount_hole_distance_from_left = motor_hole_distance_from_left + (motor_mount_hole_spacing / 2.0);
bottom_right_motor_mount_hole_distance_from_top_right_hole = bottom_left_motor_mount_hole_distance_from_top_left_hole;

top_right_motor_mount_hole_distance_from_left = bottom_right_motor_mount_hole_distance_from_left;
top_right_motot_mount_hole_distance_from_top = top_left_motor_mount_hole_distance_from_top;

// Old way
// top_left_motor_mount_hole_distance_from_left = (29.70 + motor_mount_hole_offset);
// top_left_motor_mount_hole_distance_from_top = base_plate_height - (5.00 + motor_mount_hole_offset);

// bottom_left_motor_mount_hole_distance_from_left = (29.70 + motor_mount_hole_offset);
// bottom_left_motor_mount_hole_distance_from_top_left_hole = base_plate_height - (27.60 + motor_mount_hole_offset + top_left_motor_mount_hole_distance_from_top);

// bottom_right_motor_mount_hole_distance_from_left = 27.60 + bottom_left_motor_mount_hole_distance_from_left + motor_mount_hole_offset;
// bottom_right_motor_mount_hole_distance_from_top_right_hole = bottom_left_motor_mount_hole_distance_from_top_left_hole;

// top_right_motor_mount_hole_distance_from_left = bottom_right_motor_mount_hole_distance_from_left;
// top_right_motot_mount_hole_distance_from_top = top_left_motor_mount_hole_distance_from_top;

// Mounting hole 1
mounting_hole_1_diameter = 4.20;
mounting_hole_1_offset = (mounting_hole_1_diameter / 2.0);
// mounting_hole_1_distance_from_motor_hole = 16.32 + (motor_hole_offset + mounting_hole_1_offset);
mounting_hole_1_distance_from_bottom = 78.90 + mounting_hole_1_offset;
mounting_hole_1_distance_from_left = base_plate_width / 2.0; // 10.2 + mounting_hole_1_offset;

// Mounting hole 2
mounting_hole_2_diameter = 4.27;
mounting_hole_2_offset = (mounting_hole_2_diameter / 2.0);
// mounting_hole_2_distance_from_mounting_hole_1 = 22.00 + (mounting_hole_1_offset + mounting_hole_2_offset);
mounting_hole_2_distance_from_bottom = 52.90 + mounting_hole_2_offset;
mounting_hole_2_distance_from_left = base_plate_width / 2.0; // 8.0 + mounting_hole_2_offset;

// Adjustable V-Wheel Hole
adjustable_v_wheel_hole_diameter = v_wheel_diameter;
adjustable_v_wheel_hole_offset = (adjustable_v_wheel_hole_diameter / 2.0);
// adjustable_v_wheel_hole_distance_from_mounting_hole_2 = 15.00 + (mounting_hole_2_offset + adjustable_v_wheel_hole_offset);
adjustable_v_wheel_hole_distance_from_bottom = adjustable_v_wheel_from_bottom + adjustable_v_wheel_hole_offset;
adjustable_v_wheel_hole_distance_from_left = base_plate_width / 2.0; // 7.38 + adjustable_v_wheel_hole_offset;

// Mounting hole 3
mounting_hole_3_diameter = 4.10;
mounting_hole_3_offset = (mounting_hole_3_diameter / 2.0);
// mounting_hole_3_distance_from_adjustable_v_wheel_hole = 20.60 + (adjustable_v_wheel_hole_offset + mounting_hole_3_offset);
mounting_hole_3_distance_from_bottom = 7.90 + mounting_hole_3_offset;
mounting_hole_3_distance_from_left = base_plate_width / 2.0; // 7.95 + mounting_hole_3_offset;

// Functions
module create_hull_hole(hole_size, x, y) {
  translate([y, x, 0]) {  // Swapped x and y coordinates here
    cylinder(h = hole_z_height, d = hole_size, center = true);
  }
  translate([0, 0, 0]);
}

module main_mounting_plate() {
  // Calculations
  plate_head_top_radius = (base_plate_head_height + base_plate_radius);
  plate_head_curve_length = (base_plate_head_height - base_plate_head_bottom_height); // should be ±40.00mm
  plate_head_top_midpoint = (base_plate_head_width - base_plate_head_top_height) / 2.00;
  plate_bottom_radius_offset = (base_plate_height - base_plate_radius);

  // Base plate
  translate([0, 0, 0])
  linear_extrude(height = thickness)
  minkowski() {
    difference() {
      union() {
        // Top part with angled corners
        polygon(points = [
          [base_plate_radius, base_plate_height - plate_head_top_radius],                                                            // Bottom left of top section
          [base_plate_radius, base_plate_height - plate_head_curve_length],                                                          // Start of angle on left
          [plate_head_top_midpoint + base_plate_radius, plate_bottom_radius_offset],                                                 // Top left point
          [base_plate_head_width - plate_head_top_midpoint - base_plate_radius, plate_bottom_radius_offset],                         // Top right point
          [base_plate_head_width - base_plate_radius, base_plate_height - plate_head_curve_length],                                  // Start of angle on right
          [base_plate_head_width - base_plate_radius, base_plate_height - plate_head_top_radius],                                    // Bottom right of top section
          [base_plate_head_width - base_plate_radius, base_plate_stem_height + base_plate_radius],                                   // Bottom right before stem
          [(base_plate_head_width + base_plate_stem_width) / 2.00, base_plate_stem_height + base_plate_radius],                      // Right side stem start
          [(base_plate_head_width + base_plate_stem_width) / 2.00 - base_plate_radius, base_plate_stem_height],                      // Right corner of neck
          [(base_plate_head_width + base_plate_stem_width) / 2.00 - base_plate_radius, base_plate_radius],                           // Bottom right of stem
          [(base_plate_head_width - base_plate_stem_width) / 2.00 + base_plate_radius, base_plate_radius],                           // Bottom left of stem
          [(base_plate_head_width - base_plate_stem_width) / 2.00 + base_plate_radius, base_plate_stem_height],                      // Left corner of neck
          [(base_plate_head_width - base_plate_stem_width) / 2.00, base_plate_stem_height + base_plate_radius],                      // Left side stem start
          [base_plate_radius, base_plate_stem_height + base_plate_radius]                                                            // Bottom left before stem
        ]);
      }
    }
    circle(r = base_plate_radius, $fn = quality_value);
  }
}

module create_holes() {
  // Top V-Wheels
  create_hull_hole(left_v_wheel_diameter, top_v_wheel_distance_from_bottom_edge, left_v_wheel_distance_from_left);
  create_hull_hole(right_v_wheel_diameter, top_v_wheel_distance_from_bottom_edge, right_v_wheel_distance_from_left);

  // Motor Hole
  create_hull_hole(motor_hole_diameter, motor_hole_distance_from_top, motor_hole_distance_from_left);

  // Motor Mount Holes
  create_hull_hole(motor_mount_hole_diameter, top_left_motor_mount_hole_distance_from_top, top_left_motor_mount_hole_distance_from_left);
  create_hull_hole(motor_mount_hole_diameter, bottom_left_motor_mount_hole_distance_from_top_left_hole, bottom_left_motor_mount_hole_distance_from_left);
  create_hull_hole(motor_mount_hole_diameter, bottom_right_motor_mount_hole_distance_from_top_right_hole, bottom_right_motor_mount_hole_distance_from_left);
  create_hull_hole(motor_mount_hole_diameter, top_right_motot_mount_hole_distance_from_top, top_right_motor_mount_hole_distance_from_left);

  // Mounting Hole 1
  create_hull_hole(mounting_hole_1_diameter, mounting_hole_1_distance_from_bottom, mounting_hole_1_distance_from_left);

  // Mounting Hole 2
  create_hull_hole(mounting_hole_2_diameter, mounting_hole_2_distance_from_bottom, mounting_hole_2_distance_from_left);

  // Adjustable V-Wheel Hole
  create_hull_hole(adjustable_v_wheel_hole_diameter, adjustable_v_wheel_hole_distance_from_bottom, adjustable_v_wheel_hole_distance_from_left);

  // Mounting Hole 3
  create_hull_hole(mounting_hole_3_diameter, mounting_hole_3_distance_from_bottom, mounting_hole_3_distance_from_left);
}

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    union() {
      main_mounting_plate();
    }
    union() {
      create_holes();
    }
  }
}

main_assembly();

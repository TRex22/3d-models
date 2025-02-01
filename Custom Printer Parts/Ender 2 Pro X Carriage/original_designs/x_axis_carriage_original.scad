// Ender 2 Pro X Axis Carriage Plate Model
// High quality settings
$fn = 100;

// Main dimensions
plate_width = 61.00; // 61.25;
plate_height = 47.30; // 45.30;
total_height = 64.00;
thickness = 2.50;

// Hole sizes
m3_hole_diameter = 2.8;
m3_error = 0.2; // error in calculation for difference between holes
v_wheel_hole_diameter = 5.20;
v_wheel_offset = (v_wheel_hole_diameter / 2.0) + 2.0;
small_hole_diameter = 3.5;
standoff_diameter = 4.15;
eyelet_hole_diameter = 7.30;

// Stand-off locations
original_stand_off_offset = 23.60;
stand_off_height_location = plate_height - original_stand_off_offset;
stand_off_width_location = 27.00;
stand_off_width_distance = 11.60;

// Fork dimensions
left_fork_width = 13.50;
right_fork_width = 11.50;
fork_height = 20.38;
fork_slot_width = 1.75;
fork_slot_depth = 10.50;
left_fork_slot_offset = 6.90;
right_fork_slot_offset = 4.90;

// Eyelet dimensions
eyelet_width = 24.04;
eyelet_base_height = 18.70;
eyelet_hole_bottom_offset = -1.8; //-2.3; // -4.5; // 8.5; // -8.7;
left_fork_to_eyelet_gap = 5.25;
right_fork_to_eyelet_gap = 5.6;

module main_plate() {
  difference() {
    // Base plate
    translate([0, 0, 0])
    linear_extrude(height = thickness)
    hull() {
      translate([8, 0, 0])
      square([plate_width - 16, plate_height]);
      translate([8, plate_height - 8, 0])
      circle(r = 8);
      translate([plate_width - 8, plate_height - 8, 0])
      circle(r = 8);
      square([plate_width, plate_height - 8]);
    }

    // Left side notches
    translate([-1, 6.50, -1]) {
      cube([2.30 + 1, 5.20, thickness + 10]);
      translate([0, 13.60 + 5.20, 0])
      cube([2.03 + 1, 5.40, thickness + 10]);
    }

    // Right side notch
    translate([plate_width - 2.30, 10.30, -1])
    cube([3.04 + 1, 6.40, thickness + 10]);

    // Left side M3 holes
    translate([17.00, plate_height - 25.60, -1]) {
      cylinder(d = m3_hole_diameter, h = thickness + 2);
      translate([0, -13.80, 0])
      cylinder(d = m3_hole_diameter, h = thickness + 2);
    }

    // Right side M3 holes
    translate([plate_width - 4.8, 17.50 + 5.75, -1]) {
      cylinder(d = m3_hole_diameter, h = thickness + 2);
      translate([0, 4.6 + (m3_hole_diameter - m3_error), 0])
      cylinder(d = m3_hole_diameter, h = thickness + 2);
    }

    // Top small hole
    translate([23.00, plate_height - 3.41, -1])
    cylinder(d = small_hole_diameter, h = thickness + 2);

    // Top rectangle hole
    translate([plate_width - 8.8 - 2.30, plate_height - 1.75 - 3.47, -1])
    cube([2.30, 3.40, thickness + 2]);

    // V-wheel holes
    translate([9.45 + 2.41, plate_height - (9.30 + v_wheel_offset), -1]) // + 2.22
    cylinder(d = v_wheel_hole_diameter, h = thickness + 2);
    translate([plate_width - (9.45), plate_height - (9.30 + v_wheel_offset), -1]) // 2.41 - v_wheel_offset and y = + 2.22
    cylinder(d = v_wheel_hole_diameter, h = thickness + 2);

    // Standoff through holes
    translate([(stand_off_width_location + 0.87), plate_height - (stand_off_height_location + 0.77), -1])
    cylinder(d = m3_hole_diameter, h = thickness + 2);
    translate([(stand_off_width_location + stand_off_width_distance + 0.87 + 2.59), plate_height - (stand_off_height_location + 0.77), -1])
    cylinder(d = m3_hole_diameter, h = thickness + 2);
  }
}

module central_cutout() {
  translate([23, plate_height - 28.60 - 14.00, -1])
  hull() {
    for(x = [0, 22 - 3], y = [0, 14 - 3]) {
      translate([x + 1.5, y + 1.5, 0])
      cylinder(r = 1.5, h = thickness + 2);
    }
  }
}

module standoffs() {
  translate([stand_off_width_location, stand_off_height_location, -5.5]) {
    difference() {
      cylinder(d = standoff_diameter, h = 5.5);
      cylinder(d = m3_hole_diameter, h = 5.5 + 1);
    }
    translate([stand_off_width_distance, 0, 0]) {
      difference() {
        cylinder(d = standoff_diameter, h = 5.5);
        cylinder(d = m3_hole_diameter, h = 5.5 + 1);
      }
    }
  }
}

module forks_and_eyelet() {
  // Left fork
  translate([0, 0, 0])
  rotate([90, 0, 0])
  linear_extrude(height = thickness)
  difference() {
    square([left_fork_width, fork_height]);
    translate([left_fork_slot_offset, fork_height - fork_slot_depth])
    square([fork_slot_width, fork_slot_depth + 1]);
  }

  // Right fork
  translate([plate_width - right_fork_width, 0, 0])
  rotate([90, 0, 0])
  linear_extrude(height = thickness)
  difference() {
    square([right_fork_width, fork_height]);
    translate([right_fork_slot_offset, fork_height - fork_slot_depth])
    square([fork_slot_width, fork_slot_depth + 1]);
  }

  // Eyelet
  eyelet_start = left_fork_width + left_fork_to_eyelet_gap;
  translate([eyelet_start, -thickness, 0])
  difference() {
    linear_extrude(height = thickness)
    union() {
      square([eyelet_width, eyelet_base_height]);
      translate([eyelet_width/2, 0, 0])
      circle(d = eyelet_width);
    }
    translate([eyelet_width/2, eyelet_hole_bottom_offset, -1])
    cylinder(d = eyelet_hole_diameter, h = thickness + 2);
  }
}

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    union() {
      main_plate();
      standoffs();
      forks_and_eyelet();
    }
    central_cutout();
  }
}

main_assembly();

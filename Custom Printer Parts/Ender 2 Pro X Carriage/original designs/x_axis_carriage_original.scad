// Ender 2 Pro X Axis Carriage Plate Model
// High quality settings
$fn = 100;

// Main dimensions
plate_width = 61.00;
plate_height = 47.30;
total_height = 64.00;
thickness = 2.50;

// Hole sizes
m3_hole_diameter = 2.8;
v_wheel_hole_diameter = 5.20;
small_hole_diameter = 3.5;
standoff_diameter = 4.15;
eyelet_hole_diameter = 7.10;

// Hole position corrections (half diameters for edge-to-center conversion)
m3_offset = m3_hole_diameter/2;
v_wheel_offset = v_wheel_hole_diameter/2;
small_hole_offset = small_hole_diameter/2;
standoff_offset = standoff_diameter/2;
eyelet_offset = eyelet_hole_diameter/2;

// Standoff height
standoff_height = 5.5;

// Fork dimensions
left_fork_width = 13.50;
right_fork_width = 11.50;
fork_height = 20.38;
fork_slot_width = 1.75;
fork_slot_depth = 10.50;

// Eyelet dimensions
eyelet_width = 24.04;
eyelet_base_height = 18.70;

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
    translate([-1, 4.20, -1]) {
      cube([2.30 + 1, 5.20, thickness + 2]);
      translate([0, 13.60 + 5.20, 0])
      cube([2.03 + 1, 5.40, thickness + 2]);
    }

    // Right side notch
    translate([plate_width - 2.30, 7.00, -1])
    cube([3.04 + 1, 6.40, thickness + 2]);

    // Left side M3 holes
    translate([17.00 + m3_offset, 24.95 + m3_offset, -1]) {
      cylinder(d = m3_hole_diameter, h = thickness + 2);
      translate([0, -(11.70), 0])
      cylinder(d = m3_hole_diameter, h = thickness + 2);
    }

    // Right side M3 holes
    translate([plate_width - (4.8 + m3_offset), 0, -1]) {
      translate([0, 17.50 + 4.6 + m3_offset, 0])
      cylinder(d = m3_hole_diameter, h = thickness + 2);
      translate([0, 17.50 + m3_offset, 0])
      cylinder(d = m3_hole_diameter, h = thickness + 2);
    }

    // Top small hole
    translate([23 + small_hole_offset, plate_height - (2.23 + small_hole_offset), -1])
    cylinder(d = small_hole_diameter, h = thickness + 2);

    // Top rectangle hole
    translate([plate_width - 8.8 - 2.30, plate_height - 1.75 - 3.40, -1])
    cube([2.30, 3.40, thickness + 2]);

    // V-wheel holes
    translate([9.45 + v_wheel_offset, plate_height - (9.30 + v_wheel_offset), -1])
    cylinder(d = v_wheel_hole_diameter, h = thickness + 2);
    translate([plate_width - (9.45 + v_wheel_offset), plate_height - (9.30 + v_wheel_offset), -1])
    cylinder(d = v_wheel_hole_diameter, h = thickness + 2);

    // Standoff through holes
    translate([27 + m3_offset, 23.60 + m3_offset, -1])
    cylinder(d = m3_hole_diameter, h = thickness + 2);
    translate([27 + 11.60 + m3_offset, 23.60 + m3_offset, -1])
    cylinder(d = m3_hole_diameter, h = thickness + 2);
  }
}

module central_cutout() {
  translate([23, 23.60 - 2.94 - 14.00, -1])
  hull() {
    for(x = [0, 22 - 3], y = [0, 14 - 3]) {
      translate([x + 1.5, y + 1.5, 0])
      cylinder(r = 1.5, h = thickness + 2);
    }
  }
}

module standoffs() {
  translate([27 + standoff_offset, 23.60 + standoff_offset, -standoff_height]) {
    difference() {
      cylinder(d = standoff_diameter, h = standoff_height);
      cylinder(d = m3_hole_diameter, h = standoff_height + 1);
    }
    translate([11.60, 0, 0]) {
      difference() {
        cylinder(d = standoff_diameter, h = standoff_height);
        cylinder(d = m3_hole_diameter, h = standoff_height + 1);
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
    translate([6.90, fork_height - fork_slot_depth])
    square([fork_slot_width, fork_slot_depth + 1]);
  }

  // Right fork
  translate([plate_width - right_fork_width, 0, 0])
  rotate([90, 0, 0])
  linear_extrude(height = thickness)
  difference() {
    square([right_fork_width, fork_height]);
    translate([4.90, fork_height - fork_slot_depth])
    square([fork_slot_width, fork_slot_depth + 1]);
  }

  // Eyelet
  translate([left_fork_width + 5.25, -thickness, 0])
  difference() {
    linear_extrude(height = thickness)
    union() {
      square([eyelet_width, eyelet_base_height]);
      translate([eyelet_width/2, 0, 0])
      circle(d = eyelet_width);
    }
    translate([eyelet_width/2, -4.5, -1])
    cylinder(d = eyelet_hole_diameter, h = thickness + 2);
  }
}

// Final assembly
difference() {
  union() {
    main_plate();
    standoffs();
    forks_and_eyelet();
  }
  central_cutout();
}

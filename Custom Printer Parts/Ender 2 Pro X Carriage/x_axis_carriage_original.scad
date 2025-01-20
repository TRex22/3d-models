// Ender 2 Pro X Axis Carriage Plate Model
// High quality settings
$fn = 100;

// Main dimensions
plate_width = 61.00;
plate_height = 47.30;
total_height = 64.00;
thickness = 2.50;

// M3 thread hole size (slightly smaller for hand threading)
m3_hole = 2.8;

module main_plate() {
  difference() {
    // Base plate
    translate([0, 0, 0])
    linear_extrude(height = thickness)
    hull() {
      // Main rectangle with rounded top corners
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
    translate([17.00, 24.95, -1]) {
      cylinder(d = m3_hole, h = thickness + 2);
      translate([0, -11.70, 0])
      cylinder(d = m3_hole, h = thickness + 2);
    }

    // Right side M3 holes
    translate([plate_width - 4.8, 0, -1]) {
      translate([0, 17.50 + 4.6, 0])
      cylinder(d = m3_hole, h = thickness + 2);
      translate([0, 17.50, 0])
      cylinder(d = m3_hole, h = thickness + 2);
    }

    // Top small holes
    translate([23, plate_height - 2.23, -1])
    cylinder(d = 3.5, h = thickness + 2);

    translate([plate_width - 8.8 - 2.30, plate_height - 1.75 - 3.40, -1])
    cube([2.30, 3.40, thickness + 2]);

    // V-wheel holes
    translate([9.45, plate_height - 9.30, -1])
    cylinder(d = 5.20, h = thickness + 2);
    translate([plate_width - 9.45, plate_height - 9.30, -1])
    cylinder(d = 5.20, h = thickness + 2);

    // Standoff through holes
    translate([27, 23.60, -1])
    cylinder(d = m3_hole, h = thickness + 2);
    translate([27 + 11.60, 23.60, -1])
    cylinder(d = m3_hole, h = thickness + 2);
  }
}

module central_cutout() {
  // Central rounded rectangle cutout (repositioned below standoffs)
  translate([23, 23.60 - 2.94 - 14.00, -1])
  hull() {
    for(x = [0, 22 - 3], y = [0, 14 - 3]) {
      translate([x + 1.5, y + 1.5, 0])
      cylinder(r = 1.5, h = thickness + 2);
    }
  }
}

module standoffs() {
  // Heat-sink standoffs (moved to back of plate)
  translate([27, 23.60, 0]) {
    difference() {
      cylinder(d = 4.15, h = 5.5);
      cylinder(d = m3_hole, h = 5.5 + 1);
    }
    translate([11.60, 0, 0]) {
      difference() {
        cylinder(d = 4.15, h = 5.5);
        cylinder(d = m3_hole, h = 5.5 + 1);
      }
    }
  }
}

module forks_and_eyelet() {
  // Left fork (connected directly to plate)
  translate([0, 0, 0])
  rotate([90, 0, 0])
  linear_extrude(height = thickness)
  difference() {
    square([13.50, 20.38]);
    translate([6.90, 20.38 - 10.50])
    square([1.75, 10.50 + 1]);
  }

  // Right fork (connected directly to plate)
  translate([plate_width - 11.50, 0, 0])
  rotate([90, 0, 0])
  linear_extrude(height = thickness)
  difference() {
    square([11.50, 20.38]);
    translate([4.90, 20.38 - 10.50])
    square([1.75, 10.50 + 1]);
  }

  // Eyelet with through hole
  translate([13.50 + 5.25, -thickness, 0])
  difference() {
    linear_extrude(height = thickness)
    union() {
      square([24.04, 18.70]);
      translate([24.04/2, 0, 0])
      circle(d = 24.04);
    }
    // Center hole through plate
    translate([24.04/2, -4.5, -1])
    cylinder(d = 7.10, h = thickness + 2);
  }
}

// Combine all components
difference() {
  union() {
    main_plate();
    translate([0, 0, -5.5])
    standoffs();
    forks_and_eyelet();
  }
  central_cutout();
}

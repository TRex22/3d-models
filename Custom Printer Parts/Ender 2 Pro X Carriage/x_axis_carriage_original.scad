// Ender 2 Pro X Axis Carriage Plate Model
// High quality settings
$fn = 100;

// Main dimensions
plate_width = 61.25;
plate_height = 64.00;
plate_thickness = 2.50;
base_plate_height = 45.30;

module main_plate() {
  difference() {
    // Base plate with rounded top corners
    hull() {
      // Bottom corners
      translate([0, 0, 0])
        square([plate_width, base_plate_height]);

      // Top rounded corners
      translate([8, base_plate_height, 0])
        circle(r=8);
      translate([plate_width-8, base_plate_height, 0])
        circle(r=8);
    }

    // Left side notches
    translate([-0.1, 4.20, 0])
      square([2.30, 5.20]);
    translate([-0.1, 23.00, 0])
      square([2.03, 5.40]);

    // Right side notch
    translate([plate_width-2.04, 7.00, 0])
      square([3.04, 6.40]);

    // Central rounded rectangle cutout
    translate([23, 28.60, 0])
      offset(r=2)
        square([22, 14]);
  }
}

module forks() {
  // Left fork
  translate([0, -20.38, 0]) {
    difference() {
      square([13.50, 20.38]);
      translate([6.90, 10.50, 0])
        square([1.75, 10]);
    }
  }

  // Right fork
  translate([plate_width-11.50, -20.38, 0]) {
    difference() {
      square([11.50, 20.38]);
      translate([4.90, 10.50, 0])
        square([1.75, 10]);
    }
  }
}

module eyelet() {
  // Eyelet base dimensions
  eyelet_width = 24.04;
  eyelet_start = 13.50 + 5.25;

  translate([eyelet_start, -18.7, 0]) {
    difference() {
      union() {
        square([eyelet_width, 18.7]);
        translate([eyelet_width/2, 0, 0])
          circle(d=eyelet_width);
      }
      translate([eyelet_width/2, 8.5, 0])
        circle(d=7.10);
    }
  }
}

module mounting_holes() {
  // M3 threaded holes (2.5mm for hand threading)
  // Left side vertical holes
  translate([17, 24.95, 0]) circle(d=2.5);
  translate([17, 24.95+11.70, 0]) circle(d=2.5);

  // Right side vertical holes
  translate([plate_width-4.8, base_plate_height-17.50, 0]) circle(d=2.5);
  translate([plate_width-4.8, base_plate_height-17.50-4.6, 0]) circle(d=2.5);

  // Top small holes
  translate([23, 2.23, 0]) circle(d=3.5);
  translate([plate_width-8.8-2.30, 1.75, 0])
    square([2.30, 3.40]);

  // V-wheel mounting holes
  translate([9.45, 9.30, 0]) circle(d=5.20);
  translate([plate_width-9.45, 9.30, 0]) circle(d=5.20);
}

module standoffs() {
  // Heat-sink mounting standoffs
  module single_standoff() {
    difference() {
      cylinder(h=5.5, d=4.15);
      translate([0, 0, -0.1])
        cylinder(h=5.7, d=2.5);  // M3 thread
    }
  }

  translate([27, 23.60, 0]) single_standoff();
  translate([27+11.60, 23.60, 0]) single_standoff();
}

// Combine all components
linear_extrude(height=plate_thickness) {
  main_plate();
  forks();
  eyelet();
  mounting_holes();
}
standoffs();

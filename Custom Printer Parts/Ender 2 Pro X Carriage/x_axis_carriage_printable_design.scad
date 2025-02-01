// This is the modified Ender 2 Pro X-Carriage design for 3D printing
// Rather than having

// Include original file to access all modules and variables
include <original_designs/x_axis_carriage_original.scad>

// Variable Overrides
thickness = 4.00; // 4.50;
chamfer_size = 0.8; // 0.5mm chamfer

// Move stand-off location up for the stand-off plate offset
stand_off_height_location = plate_height - (original_stand_off_offset + 7.80); // plate_height - 23.60;

// Block out forks to make them stronger
fork_block_height = 10.0;
fork_block_width = 13.50;
fork_block_depth = 10.00 + (thickness - 1.0);

// blocking translations
x_fork_block_translation = 47.50;
y_fork_block_translation = -6.0;
z_fork_block_translation = 3.0 - (thickness - 1.0);
fork_block_shift = -47.50;

// clearance variable
bottom_extrusion_height = 5.00 + 5.00;
bottom_extrusion_width = plate_width + 3.30 + 3.00;
bottom_extrusion_depth = 9.50;

bottom_extrusion_x = -2.0;
bottom_extrusion_y = 2.0;
bottom_extrusion_z = 4.0;

// Ziptie hole
ziptie_hole_width = 2.50;
ziptie_hole_height = 2.50;

module forks_blocking() {
  // Right block
  translate([x_fork_block_translation, y_fork_block_translation, z_fork_block_translation])
  linear_extrude(height = fork_block_depth)
  hull() {
    square([fork_block_width, fork_block_height]);
  }

  // Left Block
  translate([x_fork_block_translation + fork_block_shift, y_fork_block_translation, z_fork_block_translation])
  linear_extrude(height = fork_block_depth)
  hull() {
    square([fork_block_width, fork_block_height]);
  }
}

module main_plate_with_chamfer() {
  difference() {
    main_plate();

    // Edge chamfers
    difference() {
      minkowski() {
        main_plate();
        cylinder(h=chamfer_size*2, r1=chamfer_size, r2=0, $fn=24);
      }
      minkowski() {
        main_plate();
        cylinder(h=chamfer_size*2, r=0.01, $fn=24);
      }
    }
  }
}

module clearance_of_bottom_extrusion() {
  translate([bottom_extrusion_x, bottom_extrusion_y, bottom_extrusion_z])
  linear_extrude(height = bottom_extrusion_depth)
  hull() {
    square([bottom_extrusion_width, bottom_extrusion_height]);
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
}

module ziptie_hole() {
  // translate([plate_width - 1.75 - 3.47, plate_height - 8.8 - 2.30, -1])
  // cube([3.40, 2.30, thickness + 2]);
  // rotate([0, 90, 0])

  // translate([plate_width - 8.8 - 2.30, plate_height - 3.47, -1])
  // cube([2.30, 3.40, thickness + 2]);

  translate([plate_width - 8.8 - 2.30 + 7.0, plate_height - 3.47 - 3.30 - 3.0, -1])
  linear_extrude(height = thickness + 10.0)
  hull() {
    square([ziptie_hole_width, ziptie_hole_height]);
  }
}

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    union() {
      main_plate();
      // main_plate_with_chamfer();
      // standoffs(); // Remove stand-offs
      forks_and_eyelet();
      forks_blocking();
    }
    union() {
      central_cutout();
      clearance_of_bottom_extrusion();
      ziptie_hole();
    }
  }
}

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
fork_block_height = 13.5;
fork_block_width = 6.00;
fork_block_length = 10.00;

// blocking translations
x_fork_block_translation = 48.0;
y_fork_block_translation = -6.0;
z_fork_block_translation = 3.0;
fork_block_shift = -48.00;

module forks_blocking() {
  translate([x_fork_block_translation, y_fork_block_translation, z_fork_block_translation]) {
    cube([fork_block_height, fork_block_height, fork_block_length]);
    translate([fork_block_shift, 0, 0]) {
      cube([fork_block_height, fork_block_height, fork_block_length]);
    }
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
    central_cutout();
  }
}

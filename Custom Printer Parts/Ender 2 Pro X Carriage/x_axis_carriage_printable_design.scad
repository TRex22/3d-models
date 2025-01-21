// This is the modified Ender 2 Pro X-Carriage design for 3D printing
// Rather than having

// Include original file to access all modules and variables
include <original_designs/x_axis_carriage_original.scad>

// Variable Overrides
thickness = 4.00; // 4.50;
chamfer_size = 0.5; // 0.5mm chamfer

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
    }
    central_cutout();
  }
}

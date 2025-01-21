// This is the modified Ender 2 Pro X-Carriage design for 3D printing
// Rather than having

// Include original file to access all modules and variables
include <original_designs/x_axis_carriage_original.scad>

// Variable Overrides
thickness = 4.00; // 4.50;
chamfer_size = 0.5; // 0.5mm chamfer

module main_plate_with_chamfer() {
  minkowski() {
    main_plate();
    cylinder(r=chamfer_size, h=0.01, $fn=8);
  }
}

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    union() {
      main_plate_with_chamfer();
      // standoffs(); // Remove stand-offs
      forks_and_eyelet();
    }
    central_cutout();
  }
}

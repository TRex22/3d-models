// This is the modified Ender 2 Pro X-Carriage design for 3D printing
// Rather than having

// Include original file to access all modules and variables
include <original_designs/x_axis_carriage_original.scad>

// Variable Overrides
thickness = 4.50;

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    union() {
      main_plate();
      // standoffs(); // Remove stand-offs
      forks_and_eyelet();
    }
    central_cutout();
  }
}

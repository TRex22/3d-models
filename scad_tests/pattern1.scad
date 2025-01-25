// Set the dimensions
length = 4;
width = 4;

// Create the square
cube([length, width, 1], center = true);

// Create the surface pattern
translate([0, 0, 0.5]) {
  linear_extrude(height = 0.2) {
    square([length/2, width/2], center = true);
  }
}

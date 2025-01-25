// Set the dimensions
length = 4;
width = 4;

// Create the square
cube([length, width, 1], center = true);

// Create the honeycomb pattern
translate([0, 0, 0.5]) {
  linear_extrude(height = 0.2) {
    union() {
      for (x = [-length/4:length/8:length/4]) {
        for (y = [-width/4:width/8:width/4]) {
          translate([x, y, 0]) {
            circle(d = length/8, $fn = 6);
          }
        }
      }
    }
  }
}

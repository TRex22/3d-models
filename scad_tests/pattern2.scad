// Set the dimensions
length = 4;
width = 4;

// Create the square
cube([length, width, 1], center = true);

// Create the hexagon pattern
translate([0, 0, 0.5]) {
  linear_extrude(height = 0.2) {
    polygon(points = [
      [0, 0],
      [length/4, width/8],
      [length/4, 3*width/8],
      [0, width/2],
      [-length/4, 3*width/8],
      [-length/4, width/8]
    ], paths = [[0,1,2,3,4,5]]);
  }
}

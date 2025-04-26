// IR LED Holder for testing
// High quality settings
$fn = 100;

// Main dimensions
plate_width = 8.00;
plate_height = 12.00;
thickness = 4.00;

hole_width = 5.60;
hole_height = 10.00;
hole_thickness = 16.00;

// Calculations
hole_x_translation = plate_width / 2.0;
hole_y_translation = plate_height / 2.0;

difference() {
  translate([0, 0, 0])
  linear_extrude(height = thickness)
  hull() {
    square([plate_width, plate_height]);
  }

  translate([hole_x_translation, hole_y_translation, 0])
  linear_extrude(height = hole_thickness)
  square([hole_width, hole_height], center = true);
}

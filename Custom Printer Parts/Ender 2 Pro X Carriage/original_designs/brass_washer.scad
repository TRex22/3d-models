// Washer Model with High Smoothness
// All measurements in millimeters

// Define key parameters
thickness = 1.45;    // Washer thickness
outer_d = 8.00;   // Outer diameter
inner_d = 5.15; // 5.08;     // Inner diameter in mm
$fn = 100;        // Smoothness factor for circles

// Main washer construction
difference() {
  // Outer cylinder (main body)
  cylinder(h = thickness, d = outer_d, center = true);

  // Inner cylinder (hole)
  cylinder(h = thickness + 1, d = inner_d, center = true);
}

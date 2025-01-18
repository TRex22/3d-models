// Spacer Model Parameters
length = 8.33;      // Length of spacer in mm
outer_d = 7.95;     // Outer diameter in mm
inner_d = 5.10;     // Inner diameter in mm
smoothness = 100;   // High smoothness factor for cylinder faces

// Main spacer body
difference() {
  // Outer cylinder
  cylinder(
    h = length,
    d = outer_d,
    $fn = smoothness
  );

  // Inner hole (subtracted from outer cylinder)
  cylinder(
    h = length,
    d = inner_d,
    $fn = smoothness
  );
}

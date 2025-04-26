// Spacer Model Parameters
// M3 thread hole size (slightly smaller for hand threading)
m3_hole = 2.8;

length = 8.36;      // Length of spacer in mm
outer_d = 4.15;     // Outer diameter in mm
inner_d = m3_hole;  // Inner diameter in mm
smoothness = 100;   // High smoothness factor for cylinder faces

// Main heatsink spacer body
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

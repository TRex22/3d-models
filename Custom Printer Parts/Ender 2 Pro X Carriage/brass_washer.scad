// Washer Model with Precise Measurements

// Main variables
outer_diameter = 8.02;  // Outer diameter in mm
inner_diameter = 5.02;  // Inner diameter in mm
thickness = 1;          // Thickness in mm

// Create the washer by subtracting the inner cylinder from the outer cylinder
difference() {
    // Outer cylinder (main body of the washer)
    cylinder(h = thickness,           // Height of 1mm
             d = outer_diameter,      // Diameter of 8.02mm
             $fn = 100);             // High smoothness for circular shape

    // Inner cylinder (the hole)
    cylinder(h = thickness,           // Same height as outer cylinder
             d = inner_diameter,      // Diameter of 5.02mm
             $fn = 100);             // High smoothness for circular shape
}

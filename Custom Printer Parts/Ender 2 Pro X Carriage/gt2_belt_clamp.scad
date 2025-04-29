model_quality = 100;

$fn = model_quality;

// GT2 Belt Clamp Parameters
clamp_width = 9.0;    // Width of the clamp
clamp_length = 40.0;  // Length of the clamp
clamp_height = 3.0;   // Height/thickness of the clamp

// GT2 Belt tooth parameters
tooth_spacing = 1.10;  // Space between teeth
tooth_width = 1.10;    // Width of each tooth
tooth_depth = 0.9;    // Depth of the teeth
num_teeth = 37; //floor(clamp_length / tooth_spacing) + 1;  // Added +1 for complete coverage

// Center hole parameters
hole_diameter = 3.2;  // M3 screw hole

module gt2_belt_clamp() {
  difference() {
    // Main body
    cube([clamp_length, clamp_width, clamp_height]);

    // Create teeth pattern
    translate([tooth_spacing/2, 0, clamp_height - tooth_depth + 0.1])
    for(i = [0:num_teeth-1]) {
      translate([i * tooth_spacing, 0, 0])
      cube([tooth_width, clamp_width, tooth_depth]);
    }

    // Single center hole
    translate([clamp_length/2, clamp_width/2, 0])
    cylinder(h=clamp_height, d=hole_diameter, $fn=32);
  }
}

// Render the clamp
gt2_belt_clamp();

// GT2 Belt Clamp Parameters
clamp_width = 9;    // Width of the clamp
clamp_length = 40;  // Length of the clamp
clamp_height = 3;   // Height/thickness of the clamp

// GT2 Belt tooth parameters
tooth_spacing = 1.1;  // Space between teeth
tooth_width = 0.85;   // Width of each tooth
tooth_depth = 0.9;    // Depth of the teeth
num_teeth = floor(clamp_length / tooth_spacing);  // Calculate number of teeth

// Screw hole parameters
hole_diameter = 3.2;  // M3 screw holes
hole_distance = 32;   // Distance between screw holes
hole_margin = (clamp_length - hole_distance) / 2;

module gt2_belt_clamp() {
  difference() {
    // Main body
    cube([clamp_length, clamp_width, clamp_height]);

    // Create teeth pattern
    translate([tooth_spacing/2, 0, (clamp_height - tooth_depth) + 0.1 ])
    for(i = [0:num_teeth-1]) {
      translate([i * tooth_spacing, 0, 0])
      cube([tooth_width, clamp_width, tooth_depth]);
    }

    // Screw holes
    translate([hole_margin, clamp_width/2, 0]) {
      cylinder(h=clamp_height, d=hole_diameter, $fn=32);
      translate([hole_distance, 0, 0])
      cylinder(h=clamp_height, d=hole_diameter, $fn=32);
    }
  }
}

// Render the clamp
gt2_belt_clamp();

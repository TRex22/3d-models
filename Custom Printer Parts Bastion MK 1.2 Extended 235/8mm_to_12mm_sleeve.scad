// 8mm to 12mm Rod Sleeve Adapter
// This sleeve converts an 8mm linear stainless rod to 12mm mounting holes
// Uses shared_helper.scad for tolerances and quality settings

include <../shared_helper.scad>;

// Rod dimensions
inner_rod_diameter = 8.0 + hole_loose_tolerance;
outer_sleeve_diameter = 12.0 - hole_loose_tolerance;
sleeve_length = 25.5; //30.0;  // Adjust as needed

// Tolerances
inner_tolerance = hole_tight_tolerance;  // Tight fit for the 8mm rod
outer_tolerance = hole_loose_tolerance;  // Slightly looser fit for the 12mm mounting holes

// Gap parameters for installation
gap_width = 1.0;  // Width of the gap to allow squeezing

// Create the sleeve
rotate([0, 180, 0]) {
  difference() {
    // Outer cylinder
    cylinder(d=outer_sleeve_diameter - outer_tolerance, h=sleeve_length, center=true);

    // Inner hole for 8mm rod
    cylinder(d=inner_rod_diameter + inner_tolerance, h=sleeve_length + 1, center=true);

    // Gap to allow squeezing for installation
    translate([0, 0, -sleeve_length/2 - 0.5])
    cube([gap_width, outer_sleeve_diameter + 1, sleeve_length + 1], center=true);
  }
}

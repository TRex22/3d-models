// LM8LUU to LM12UU Linear Bearing Adapter Sleeve
// This sleeve converts an LM8LUU linear bearing to fit in a 12mm bearing mount
// Uses shared_helper.scad for tolerances and quality settings

include <../shared_helper.scad>;

// Linear bearing dimensions
lm8luu_outer_diameter = 15.00 + hole_loose_tolerance; //15.05;  // Standard outer diameter of LM8LUU bearing
lm12uu_outer_diameter = 21.0 - hole_loose_tolerance;  // Standard outer diameter of LM12UU bearing
lm8luu_length = 45.0;          // Standard length of LM8LUU bearing
lm12uu_length = 30.0;          // Standard length of LM12UU bearing

// Use the longer of the two bearings for the sleeve length
sleeve_length = lm8luu_length;

// Tolerances
inner_tolerance = hole_tight_tolerance;  // Tight fit for the LM8LUU bearing
outer_tolerance = hole_loose_tolerance;  // Slightly looser fit for mounting in LM12UU housing

// Gap parameters for installation
gap_width = 1.5;  // Width of the gap to allow squeezing

// Create the sleeve
difference() {
  // Outer cylinder - matches LM12UU outer diameter
  cylinder(d=lm12uu_outer_diameter - outer_tolerance, h=sleeve_length, center=true);

  // Inner hole - matches LM8LUU outer diameter
  cylinder(d=lm8luu_outer_diameter + inner_tolerance, h=sleeve_length + 1, center=true);

  // Gap to allow squeezing for installation
  translate([0, 0, -sleeve_length/2 - 0.5])
  cube([gap_width, lm12uu_outer_diameter + 1, sleeve_length + 1], center=true);
}

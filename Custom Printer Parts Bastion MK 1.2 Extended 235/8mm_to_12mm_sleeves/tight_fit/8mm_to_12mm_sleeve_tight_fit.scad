// 8mm to 12mm Rod Sleeve Adapter

// This sleeve converts an 8mm linear stainless rod to 12mm mounting holes
// Uses shared_helper.scad for tolerances and quality settings

include <../../../shared_helper.scad>;

revision = 1.6;

// Rod dimensions
inner_rod_diameter = 8.0;
outer_sleeve_diameter = 12.0;
sleeve_length = 25.5; //30.0;  // Adjust as needed // +1.5

// Tolerances
// inner_tolerance = (2 * hole_tight_tolerance) + hole_loose_tolerance;    // Tight perfect fit for the 8mm rod
inner_tolerance = hole_tight_tolerance + hole_loose_tolerance;    // Tight fit for the 8mm rod
outer_tolerance = hole_tight_tolerance;  // Slightly looser fit for the 12mm mounting holes

// Gap parameters for installation
gap_width = 2.0;  // Width of the gap to allow squeezing

// Create the sleeve
rotate([0, 180, 0]) {
  difference() {
    // Outer cylinder
    cylinder(d=outer_sleeve_diameter - outer_tolerance, h=sleeve_length, center=true);

    // Inner hole for 8mm rod
    rotate([0, 0, 180]) {
      translate([0, 0, -sleeve_length + 12.5 - 0.5 -1.0])
      cylinder(d=inner_rod_diameter + inner_tolerance, h=sleeve_length);
    }

    // Small hole to push rod out
    cylinder(d=m3_hole_diameter - 0.1, h=sleeve_length + 1.0, center=true);

    // Gap to allow squeezing for installation
    translate([0, 0, -sleeve_length/2 - 0.5])
    cube([gap_width, outer_sleeve_diameter + 1, sleeve_length + 1], center=true);
  }
}

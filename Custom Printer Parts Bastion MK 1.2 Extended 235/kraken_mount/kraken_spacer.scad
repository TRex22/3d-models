// 4x Spacers for mounting the kraken to the printable mount
include <../../shared_helper.scad>;
revision = 1.4;

// Dimensions
inner_rod_diameter = m3_loose_diameter;
outer_sleeve_diameter = 4.50;
sleeve_length = 5.00; //30.0;  // Adjust as needed // +1.5

// Tolerances
inner_tolerance = 0.00;
outer_tolerance = 0.00;

// Gap parameters for installation
gap_width = 0.0;  // Width of the gap to allow squeezing

generate_sleeve(outer_sleeve_diameter, outer_tolerance, sleeve_length, inner_rod_diameter, inner_tolerance, m3_hole_diameter, gap_width);

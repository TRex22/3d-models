// Redesign of the Ender 2 Pro Fan Holder Remix
// Aim is to make it parameterised for easy modification

include <../../shared_helper.scad>

base_thickness = 6.00;
// top_thickness = 5.00;
top_carve_out = 1.00;

medium_magnet_height_with_offset = medium_magnet_height - hole_tight_tolerance;
medium_magnet_diameter_with_offset = medium_magnet_diameter - hole_tight_tolerance;

base_height = 17.35;
base_width = 24.25;

outer_height = 38.35;
outer_width = 48.65;

// 4 Magnets
magnet_height_difference = 28.65;
magnet_width_difference = 38.65;

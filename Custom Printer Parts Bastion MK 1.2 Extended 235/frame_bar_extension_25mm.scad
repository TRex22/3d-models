// Frame Bar Extension
// This extension piece connects two frame bars with a configurable middle section

include <../shared_helper.scad>;

// Frame bar connector dimensions
connector_width = 20.0;       // Width of the frame bar connector
connector_height = 30.0;      // Height of the frame bar connector
female_depth = 25.0;          // Depth of the female connector
male_depth = 25.0;            // Depth of the male connector
extension_length = 25.0;      // Length of the extension middle section (adjustable)

// Hole specifications
hole_diameter = m3_hole_diameter;  // Using M3 holes from shared_helper
hole_top_margin = 3.7;        // Distance from top edge to first hole center
hole_spacing = 13.4;          // Distance between hole centers
hole_front_margin = 10.2;     // Distance from front edge to hole centers

// Tolerance for better fit
fit_tolerance = 0.2;          // Tolerance for male connector to fit into female

// Derived values
total_length = female_depth + extension_length + male_depth;

module frame_bar_extension() {
  difference() {
    union() {
      // Female connector (left side)
      translate([0, 0, 0])
        cube([female_depth, connector_width, connector_height]);

      // Extension middle section
      translate([female_depth, 0, 0])
        cube([extension_length, connector_width, connector_height]);

      // Male connector (right side)
      translate([female_depth + extension_length, 0, 0])
        cube([male_depth, connector_width - fit_tolerance*2, connector_height - fit_tolerance*2]);
    }

    // Holes in female connector
    translate([0, 0, 0])
      frame_bar_holes(female_depth);

    // Holes in male connector
    translate([female_depth + extension_length, 0, 0])
      frame_bar_holes(male_depth);
  }
}

module frame_bar_holes(section_length) {
  // Top hole
  translate([-1, connector_width/2, connector_height - hole_top_margin])
    rotate([0, 90, 0])
      cylinder(d=hole_diameter, h=section_length+2);

  // Bottom hole
  translate([-1, connector_width/2, hole_top_margin + hole_spacing])
    rotate([0, 90, 0])
      cylinder(d=hole_diameter, h=section_length+2);
}

// Render the extension piece
frame_bar_extension();

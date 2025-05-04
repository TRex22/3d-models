// Frame Bar Extension
// This extension piece connects two frame bars with a configurable middle section
include <../../shared_helper.scad>;

revision = 1.2;

// TODO: Add in M4 Alternative
// TODO: Add in NUT Alternatives for M4 and M3

// Adjustable values
extension_length = 25.0;                  // Length of the extension middle section (adjustable)

hole_diameter = m3_hole_diameter;         // Using M3 holes from shared_helper

countersunk_hole_diameter = m3_head_diameter;
countersunk_hole_depth = m3_head_depth + 0.5;

knurled_insert_diameter = m3_type1_knurled_insert_diameter;
knurled_insert_depth = m3_type1_knurled_insert_depth;

// Frame bar connector dimensions
connector_width = 20.0;                   // Width of the frame bar connector
connector_height = 30.0;                  // Height of the frame bar connector
mount_depth = 25.0;                       // Depth of the connector interfaces

// Hole specifications
hole_top_margin = 3.7 + (2.3);            // Distance from top edge to first hole center
hole_spacing = 13.4;                      // Distance between hole centers
hole_front_margin = 10.2 - (2.3) + 4.675; // Distance from front edge to hole centers

// Tolerance for better fit
fit_tolerance = 0.2;                      // Tolerance for male connector to fit into female

// Derived values
mounting_width_void = connector_width / 3.0;

module mounting_holes() {
  translate([0, hole_front_margin, hole_top_margin]) {
    rotate([0, 90, 0]) {
      cylinder(d=hole_diameter, h=100.00);
    }
  }

  translate([0, hole_front_margin, connector_height - hole_top_margin]) {
    rotate([0, 90, 0]) {
      cylinder(d=hole_diameter, h=100.00);
    }
  }
}

module countersunk_holes() {
  translate([0, hole_front_margin, hole_top_margin]) {
    rotate([0, 90, 0]) {
      cylinder(d=countersunk_hole_diameter, h=countersunk_hole_depth);
    }
  }

  translate([0, hole_front_margin, connector_height - hole_top_margin]) {
    rotate([0, 90, 0]) {
      cylinder(d=countersunk_hole_diameter, h=countersunk_hole_depth);
    }
  }
}

module heat_insert_holes() {
  translate([(connector_width - knurled_insert_depth), hole_front_margin, hole_top_margin]) {
    rotate([0, 90, 0]) {
      cylinder(d=knurled_insert_diameter, h=knurled_insert_depth);
    }
  }

  translate([(connector_width - knurled_insert_depth), hole_front_margin, connector_height - hole_top_margin]) {
    rotate([0, 90, 0]) {
      cylinder(d=knurled_insert_diameter, h=knurled_insert_depth);
    }
  }
}

module female_mount() {
  difference() {
    cube([connector_width, mount_depth, connector_height]);
    // Mounting space
    translate([mounting_width_void, 0, 0]) {
      cube([mounting_width_void, mount_depth, connector_height]);
    }

    mounting_holes();
    countersunk_holes();
    heat_insert_holes();
  }
}

module male_mount() {
  difference() {
    // Apply tolerance to the male connector width and height
    translate([fit_tolerance/2, 0, fit_tolerance/2]) {
      cube([connector_width - fit_tolerance, mount_depth + fit_tolerance, connector_height - fit_tolerance]);
    }

    // Mounting spaces - adjusted for the new position
    translate([fit_tolerance/2, 0, fit_tolerance/2]) {
      cube([mounting_width_void - fit_tolerance/2, mount_depth + fit_tolerance, connector_height - fit_tolerance]);
    }

    translate([connector_width - mounting_width_void, 0, fit_tolerance/2]) {
      cube([mounting_width_void - fit_tolerance/2, mount_depth + fit_tolerance, connector_height - fit_tolerance]);
    }

    // Holes - keep original positions to maintain alignment
    mounting_holes();
  }
}

module extension() {
  cube([connector_width, extension_length, connector_height]);
}

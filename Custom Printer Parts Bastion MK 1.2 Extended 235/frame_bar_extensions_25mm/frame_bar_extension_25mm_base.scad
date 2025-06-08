// Frame Bar Extension
// This extension piece connects two frame bars with a configurable middle section
include <../../shared_helper.scad>;

revision = 1.5;

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

// Motor Mount Dimensions (Should not change)
motor_mount_height = 44.567;
motor_mount_width = 33.859;
motor_mount_length = 42.00;

motor_mount_triangle_length = 14.576;
motor_mount_triangle_height = 14.577;
motor_mount_triangle_hypotenuse = 20.614;

motor_mount_countersink_diameter = 7.00;
motor_mount_countersink_diameter_depth = 24.859; // + 7.83 + 3.915; // 9.198;
motor_mount_diameter = 3.20;
motor_mount_position_from_top = 3.90;
motor_mount_position_from_mount_side = 3.90;
motor_mount_position_between_bottom_holes = 27.80;

motor_mount_motor_diameter = 24.00;
motor_mount_motor_depth = 25.224;

motor_mount_central_holes_depth = 8.635;

motor_mount_top_cutout_length = 11.00;
motor_mount_top_cutout_width = 19.00; // depth is 100%
motor_mount_top_cutout_distance_from_edge = 8.635;
motor_mount_top_cutout_distance_from_cube_base = 11.50; //40.233;

// Idler Mount Dimensions (Should not change)
idler_mount_width = 28.00;
idler_mount_length = 50.00;
idler_mount_height = 30.00;

idler_mount_triangle_height = 8.00;
idler_mount_triangle_length = 8.00;

// Hole specifications
hole_top_margin = 3.7 + (2.3);            // Distance from top edge to first hole center
hole_spacing = 13.4;                      // Distance between hole centers
hole_front_margin = 10.2 - (2.3) + 4.675; // Distance from front edge to hole centers

// Other Side-Holes
side_hole_diameter = 4.60;
side_hole_counter_sink_diameter = 0.00; // can change this to 6.00
side_hole_counter_sink_depth = m4_head_depth; // can change this to 6.00
side_hole_length_from_edge = 57.20;
side_hole_length_from_bottom = 12.70;
side_hole_distance_from_other_hole = 20.40;

// Other Top Holes
top_hole_diameter = 4.60;
top_hole_counter_sink_diameter = 0.00; // can change this to 6.00
top_hole_counter_sink_depth = m4_head_depth; // can change this to 6.00
top_hole_length_from_edge = 19.70 + mount_depth;
top_hole_length_from_bottom = 7.70; // Top-Face
top_hole_distance_from_other_hole = 20.40;

hole_depth = 100.00;

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

// Shifting has some error. Extra shift is to make up for that error
module side_holes() {
  rotate([0, 90, 0]) {
    translate([-(connector_height/2.0), side_hole_length_from_edge + 2.30, 0]) {
      cylinder(d=side_hole_diameter, h=hole_depth);

      // translate([0, 0, connector_width - side_hole_counter_sink_depth]) // Shift to "back"
      cylinder(d=side_hole_counter_sink_diameter, h=side_hole_counter_sink_depth); // counter-sink
    }
  }

  rotate([0, 90, 0]) {
    translate([-(connector_height/2.0), side_hole_length_from_edge + side_hole_distance_from_other_hole + 2.30 + 4.60, 0]) {
      cylinder(d=side_hole_diameter, h=hole_depth);

      // translate([0, 0, connector_width - side_hole_counter_sink_depth]) // Shift to "back"
      cylinder(d=side_hole_counter_sink_diameter, h=side_hole_counter_sink_depth); // counter-sink
    }
  }
}

module top_holes() {
  translate([(connector_width/2.0), top_hole_length_from_edge + 2.30 - 0.251, 0]) {
    cylinder(d=top_hole_diameter, h=hole_depth);
    cylinder(d=top_hole_counter_sink_diameter, h=top_hole_counter_sink_depth); // counter-sink
  }

  translate([(connector_width/2.0), top_hole_length_from_edge + (top_hole_distance_from_other_hole + 4.6) + 2.30, 0]) {
    cylinder(d=top_hole_diameter, h=hole_depth);
    cylinder(d=top_hole_counter_sink_diameter, h=top_hole_counter_sink_depth); // counter-sink
  }

  translate([(connector_width/2.0), top_hole_length_from_edge + (2 * (top_hole_distance_from_other_hole + 4.6)) + 2.30, 0]) {
    cylinder(d=top_hole_diameter, h=hole_depth);
    cylinder(d=top_hole_counter_sink_diameter, h=top_hole_counter_sink_depth); // counter-sink
  }
}

module motor_mount_top_hole() {
  translate([motor_mount_top_cutout_distance_from_edge, motor_mount_top_cutout_distance_from_cube_base, -40.00]) {
    cube([motor_mount_top_cutout_length, motor_mount_top_cutout_width, 100.00]);
  }
}

module motor_mount_side_hole() {
  rotate([0, 90, 0]) {
    translate([-(motor_mount_width / 2.0) - (6.646), (motor_mount_height / 2.0) - 1.284, motor_mount_motor_depth - (3.9 + 0.077)]) {
      cylinder(d=motor_mount_motor_diameter, h=motor_mount_motor_depth, center=true);
    }
  }
}

module motor_mount_mounting_holes() {
  rotate([0, 90, 0]) {
    translate([-motor_mount_position_from_top - 4.176, (motor_mount_position_from_mount_side + 1.6), 0]) {
      cylinder(d=motor_mount_diameter, h=100.00, center=true);

      translate([0, 0, 4.599 + 7.83])
      cylinder(d=motor_mount_countersink_diameter, h=motor_mount_countersink_diameter_depth, center=true);
    }
  }

  rotate([0, 90, 0]) {
    translate([-motor_mount_position_from_top - 4.176, motor_mount_length - (motor_mount_position_from_mount_side + 1.6), 0]) {
      cylinder(d=motor_mount_diameter, h=100.00, center=true);

      translate([0, 0, 4.599 + 7.83])
      cylinder(d=motor_mount_countersink_diameter, h=motor_mount_countersink_diameter_depth, center=true);
    }
  }

  rotate([0, 90, 0]) {
    translate([-(motor_mount_position_from_top + 4.176 + 3.2 + motor_mount_position_between_bottom_holes), (motor_mount_position_from_mount_side + 1.6), 0]) {
      cylinder(d=motor_mount_diameter, h=100.00, center=true);

      translate([0, 0, 4.599 + 7.83])
      cylinder(d=motor_mount_countersink_diameter, h=motor_mount_countersink_diameter_depth, center=true);
    }
  }

  rotate([0, 90, 0]) {
    translate([-(motor_mount_position_from_top + 4.176 + 3.2 + motor_mount_position_between_bottom_holes), motor_mount_length - (motor_mount_position_from_mount_side + 1.6), 0]) {
      cylinder(d=motor_mount_diameter, h=100.00, center=true);

      translate([0, 0, 4.599 + 7.83])
      cylinder(d=motor_mount_countersink_diameter, h=motor_mount_countersink_diameter_depth, center=true);
    }
  }
}

module motor_mount_holes() {
  union() {
    motor_mount_top_hole();
    motor_mount_side_hole();
    motor_mount_mounting_holes();
  }
}

module motor_mount_triangle() {
  rotate([90, 0, 90]) {
    difference(){
      //creating a cube
      cube([motor_mount_triangle_height, motor_mount_triangle_length, connector_width]);

      //rotating the cube
      translate([0, 0, 0]){
        rotate([0, 0, 45]){
          cube([30, 30, motor_mount_width]);
        }
      }
    }
  }
}

module motor_mount_bottom() {
  difference() {
    union() {
      cube([connector_width, extension_length, connector_height]);

      // Must be in the middle
      translate([0, (extension_length / 2.0) - (motor_mount_length / 2.0), 0]) {
        cube([motor_mount_width, motor_mount_length, motor_mount_height]);
      }

      // Triangle Sides
      translate([0, (extension_length / 2.0) - (motor_mount_length / 2.0) - motor_mount_triangle_length, connector_height]) {
        motor_mount_triangle();
      }

      translate([connector_width, (extension_length / 2.0) + motor_mount_length - 6.423, connector_height]) {
        rotate([0, 0, 180])
        motor_mount_triangle();
      }
    }

    translate([0, (extension_length / 2.0) - (motor_mount_length / 2.0), 0]) {
      motor_mount_holes();
    }
  }
}

module idler_mount_triangle() {
  rotate([0, 0, 90]) {
    difference(){
      //creating a cube
      cube([idler_mount_triangle_height, idler_mount_triangle_length, idler_mount_height]);

      //rotating the cube
      translate([0, 0, 0]){
        rotate([0, 0, 45]){
          cube([100, 100, idler_mount_height]);
        }
      }
    }
  }
}

module idler_mount_top() {
  difference() {
    union() {
      cube([connector_width, extension_length, connector_height]);

      // Must be in the middle
      translate([0, (extension_length / 2.0) - (idler_mount_length / 2.0), 0]) {
        cube([idler_mount_width, idler_mount_length, idler_mount_height]);
      }

      // Triangle Sides
      translate([idler_mount_width, (extension_length / 2.0) - idler_mount_width + 3.00, 0]) {
        rotate([0, 0, 90])
        idler_mount_triangle();
      }

      translate([idler_mount_width - idler_mount_triangle_height, (extension_length / 2.0) + idler_mount_width + (idler_mount_triangle_length / 2.0) + 1.0, 0]) {
        rotate([0, 0, 180])
        idler_mount_triangle();
      }
    }
  }
}

module extension() {
  cube([connector_width, extension_length, connector_height]);
}

module extension_with_psu_mounting_holes() {
  difference() {
    extension();

    // Shorter PSU Hole
    // 158
    // 12 hole shift

    // Longer PSU Holes
    // + 10mm
    // 150
    // 2 mm

    // PSU holes use M4 threads

    translate([0, 3.5, connector_height / 2.0]) {
      rotate([0, 90, 0]) {
        cylinder(d=m4_loose_hole_diameter, h=100.00);
        cylinder(d=m4_head_diameter, h=m4_head_depth + 0.5);
      }
    }
  }
}

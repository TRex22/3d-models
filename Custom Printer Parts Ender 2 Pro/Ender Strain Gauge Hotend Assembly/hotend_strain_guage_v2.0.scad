include <hotend_slider_helpers.scad>

casing_top_buffer = 1.50 + 3.50 + 3.00;
casing_top_extension = 1.60;
casing_top_edge_buffer = 1.65 + casing_top_extension;
casing_side_extension = 2.00 + 2.00;

total_casing_height = slider_height + 4.00 + 4.00;
total_casing_width = slider_width + casing_wall_thickness + casing_side_extension;
total_casing_depth = casing_bottom_thickness + 2.00 + 4.00;

extra_tolerance_for_switch_holes = 0.12;
switch_hole_hight = 22.00;
switch_arm_hole_height = 8.00;
switch_wall_shift = 1.75 + 0.25 + 1.00;

cut_distance = 22.00;
cut_width = 1.00;
rounded_cut_hole_diameter = m2_hole_diameter;

// See Version 3
// TODO: Wire holder
// TODO: New Holder Plate with new height

module rounded_spacer() {
  cube([cut_distance, cut_width, 30]);

  translate([cut_distance, cut_width / 2.0, 2.0]) {
    cylinder(d=rounded_cut_hole_diameter, h=100.00, center=true);
  }

  side_m2_screw_hole();
}

module switch_cut_out() {
  // D2F Switch Space
  translate([(casing_wall_thickness / 2.00) + casing_side_extension, d2f_pins - 1.50, switch_base]) {
    D2F_Switch_Space();
  }

  // Switch Mount Holes
  translate([(casing_wall_thickness / 2.00) + (d2f_length / 2.0) - (m2_hole_offset / 2.0) + casing_side_extension, (d2f_width / 2.00) + 2.00 + m2_hole_offset, 0.0]) {
    D2F_Switch_Mount_Holes();
  }

  // Cut in connector
  translate([casing_wall_thickness + casing_side_extension + 6.00, 10.0, switch_base + 2.00]) {
    cube([2, 10, d2f_depth]);
  }
}

module side_m2_screw_hole() {
  translate([switch_wall_shift, 14.0, (total_casing_depth / 2.0)]) {
    rotate([90, 0, 0]) {
      cylinder(d=m2_hole_diameter + hole_tight_tolerance + extra_tolerance_for_switch_holes, h=switch_hole_hight);
    }
  }

  // Make hole larger
  translate([switch_wall_shift, 0.0, (total_casing_depth / 2.0)]) {
    rotate([90, 0, 0]) {
      cylinder(d=m2_loose_diameter, h=switch_arm_hole_height); // Make Loose
    }
  }

  // Countersink hole
  translate([switch_wall_shift, m2_counter_sink_length - switch_arm_hole_height, (total_casing_depth / 2.0)]) {
    rotate([90, 0, 0]) {
      cylinder(d=m2_counter_sink_diameter, h=m2_counter_sink_length);
    }
  }
}

module StrainGuage() {
  difference() {
    cube([total_casing_width, total_casing_height, total_casing_depth]);

    translate([0.0, casing_top_buffer, 0.0]) {
      // Mounting holes with countersinking - horizontal, through-holes, properly positioned
      translate([casing_wall_thickness + 0.80 + casing_side_extension - 2.00, total_casing_height / 2.0 + d2f_pins - 1.00, (total_casing_depth / 2.0)]) {
        CrealityCounterSunkHotEndMountingHoles(total_casing_depth, casing_top_extension);
      }

      rounded_spacer();
      switch_cut_out();

      // Bottom mounting holes
      translate([casing_side_extension - 2.00, - (total_casing_height) + casing_top_buffer + 2.5 - 0.50, 0.0]) {
        // Mounting holes with countersinking - horizontal, through-holes, properly positioned
        translate([casing_wall_thickness + 0.80, total_casing_height / 2.0, (total_casing_depth / 2.0)]) {
          CrealityHotEndMountingHoles(total_casing_depth);
        }
      }
    }
  }
}

StrainGuage();

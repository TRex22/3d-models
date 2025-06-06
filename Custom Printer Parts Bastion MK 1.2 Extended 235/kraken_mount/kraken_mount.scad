// Kraken PCB 90-degree mount for custom 3D printer frame
include <../../shared_helper.scad>;
revision = 1.3;

// PCB Dimensions - Kraken is 200x113mm
pcb_mount_width = 200.00;
pcb_mount_height = 113.00;
pcb_mount_depth = 3.30;

// PCB hole spacing (corners)
pcb_hole_distance_width = 190.00;
pcb_hole_distance_height = 102.00 + (1.17 / 2.0);

// Raspberry Pi 4 B+ dimensions
pi_mount_width = 85.00;
pi_mount_height = 56.00;
pi_hole_distance_width = 58.00;
pi_hole_distance_height = 49.00;
pi_offset_from_edge_x = 3.50;
pi_offset_from_edge_y = 3.50;

// Frame mount dimensions - 144mm beam with 4 holes
frame_mount_length = 144.00;
frame_mount_width = 25.00;
frame_mount_depth = 3.30;
frame_mount_hole_spacing_length = 114.00;
frame_mount_hole_spacing_width = 15.10;

// Stand-offs
standoff_height = 7.00;
standoff_diameter = 8.0;
pi_standoff_height = 7.00;
pi_standoff_diameter = 6.0;
hole_diameter = m3_hole_diameter + hole_tight_tolerance;
pi_hole_diameter = m2_hole_diameter + hole_tight_tolerance;

cutout_margin = 10.00;

add_pi_standoffs = true;
add_kraken_standoffs = true;

// Main PCB mounting plate (horizontal) with material-saving cutouts
module pcb_mount_plate() {
  difference() {
    union() {
      // Main plate
      cube([pcb_mount_width, pcb_mount_height, pcb_mount_depth]);

      // PCB standoffs at corners (front side)
      translate([(pcb_mount_width - pcb_hole_distance_width) / 2, (pcb_mount_height - pcb_hole_distance_height) / 2, 0]) {
        for (i = [0, 1]) {
          for (j = [0, 1]) {
            translate([i * pcb_hole_distance_width, j * pcb_hole_distance_height, pcb_mount_depth]) {
              if(add_kraken_standoffs)
                cylinder(d = standoff_diameter, h = standoff_height);
            }
          }
        }
      }

      // Pi mounting area is now part of the main PCB plate (no separate cube needed)

      // Pi standoffs - lengthways (85mm along X) and flipped 180° from Kraken - on bottom surface
      translate([(pcb_mount_width - pi_mount_width) / 2, (pcb_mount_height - pi_mount_height) / 2, -pi_standoff_height]) {
        for (i = [0, 1]) {
          for (j = [0, 1]) {
            translate([
              pi_offset_from_edge_x + i * pi_hole_distance_width,  // 85mm lengthways
              pi_offset_from_edge_y + j * pi_hole_distance_height, // 56mm across
              0
            ]) {
              if (add_pi_standoffs)
                cylinder(d = pi_standoff_diameter, h = pi_standoff_height);
            }
          }
        }
      }
    }

    // Material-saving cutouts in the middle areas - avoid Pi mounting plate area
    pi_area_start_x = (pcb_mount_width - pi_mount_width) / 2;
    pi_area_end_x = pi_area_start_x + pi_mount_width;
    pi_area_start_y = (pcb_mount_height - pi_mount_height) / 2;
    pi_area_end_y = pi_area_start_y + pi_mount_height;

    // Front cutout (before Pi area)
    if (pi_area_start_x > cutout_margin) {
      translate([cutout_margin, cutout_margin, -0.1]) {
        cube([pi_area_start_x - cutout_margin, pcb_mount_height - 2 * cutout_margin, pcb_mount_depth + 0.2]);
      }
    }

    // Back cutout (after Pi area)
    if (pi_area_end_x < pcb_mount_width - cutout_margin) {
      translate([pi_area_end_x, cutout_margin, -0.1]) {
        cube([pcb_mount_width - cutout_margin - pi_area_end_x, pcb_mount_height - 2 * cutout_margin, pcb_mount_depth + 0.2]);
      }
    }

    // No cutouts in Pi area - keep Pi plate connected to main PCB plate

    // PCB mounting holes (front side)
    translate([(pcb_mount_width - pcb_hole_distance_width) / 2, (pcb_mount_height - pcb_hole_distance_height) / 2, -0.1]) {
      for (i = [0, 1]) {
        for (j = [0, 1]) {
          translate([i * pcb_hole_distance_width, j * pcb_hole_distance_height, 0]) {
            cylinder(d = hole_diameter, h = pcb_mount_depth + standoff_height + 0.2);
          }
        }
      }
    }

    // Pi mounting holes (back side, lengthways and flipped) - through Pi plate and standoffs
    translate([(pcb_mount_width - pi_mount_width) / 2, (pcb_mount_height - pi_mount_height) / 2, -pi_standoff_height - 0.1]) {
      for (i = [0, 1]) {
        for (j = [0, 1]) {
          translate([
            pi_offset_from_edge_x + i * pi_hole_distance_width,
            pi_offset_from_edge_y + j * pi_hole_distance_height,
            0
          ]) {
            cylinder(d = pi_hole_diameter, h = pcb_mount_depth + pi_standoff_height + 0.2);
          }
        }
      }
    }
  }
}

// Frame mounting back plate (vertical, at back edge)
module frame_mount_plate() {
  difference() {
    cube([frame_mount_length, frame_mount_depth, frame_mount_width]);

    // Frame mounting holes - 4 holes, 114mm apart lengthwise, 15.1mm apart height-wise
    for (i = [0, 1]) {
      for (j = [0]) {
        translate([
          (frame_mount_length - frame_mount_hole_spacing_length) / 2 + i * frame_mount_hole_spacing_length,
          -0.1,
          (frame_mount_width - frame_mount_hole_spacing_width) / 2 + j * frame_mount_hole_spacing_width
        ]) {
          translate([0, 5, 0])
          rotate([90, 0, 0])
          cylinder(d = hole_diameter, h = frame_mount_depth + 100.00);
        }
      }
    }
  }
}

// Thin rectangular connections around Pi mounting plate - connecting to main PCB plate
module pi_plate_connections() {
  connection_width = 3;

  pi_area_start_x = (pcb_mount_width - pi_mount_width) / 2;
  pi_area_end_x = pi_area_start_x + pi_mount_width;
  pi_area_start_y = (pcb_mount_height - pi_mount_height) / 2;
  pi_area_end_y = pi_area_start_y + pi_mount_height;

  // Left side connection
  translate([pi_area_start_x - connection_width, pi_area_start_y, 0]) {
    cube([connection_width, pi_mount_height, pcb_mount_depth]);
  }

  // Right side connection
  translate([pi_area_end_x, pi_area_start_y, 0]) {
    cube([connection_width, pi_mount_height, pcb_mount_depth]);
  }

  // Front side connection
  translate([pi_area_start_x - connection_width, pi_area_start_y - connection_width, 0]) {
    cube([pi_mount_width + 2 * connection_width, connection_width, pcb_mount_depth]);
  }

  // Back side connection
  translate([pi_area_start_x - connection_width, pi_area_end_y, 0]) {
    cube([pi_mount_width + 2 * connection_width, connection_width, pcb_mount_depth]);
  }
}

// Chamfered strengthening cube module
module chamfered_strengthening_cube() {
  strength_height = pi_standoff_height - 1.0;
  chamfer_size = 3;

  difference() {
    cube([pcb_mount_width, strength_height + 1.0, strength_height]);

    // 45-degree chamfer on front edge
    translate([-0.1, strength_height + 1.0, -0.1]) {
      rotate([45, 0, 0]) {
        cube([pcb_mount_width + 0.2, chamfer_size * sqrt(2), chamfer_size * sqrt(2)]);
      }
    }

    // 45-degree chamfer on top edge
    translate([-0.1, -0.1, strength_height]) {
      rotate([0, 45, 0]) {
        cube([chamfer_size * sqrt(2), strength_height + 1.2, chamfer_size * sqrt(2)]);
      }
    }
  }
}

// Complete L-bracket assembly
module l_bracket_assembly() {
  union() {
    // Horizontal PCB mounting plate with Pi standoffs
    pcb_mount_plate();

    // Vertical frame mounting plate at back edge (same side as Pi mount)
    translate([-(frame_mount_length - pcb_mount_width) / 2, pcb_mount_height, -frame_mount_width + pcb_mount_depth]) {
      frame_mount_plate();
    }

    // Strengthening material for 90-degree joint with 45-degree chamfers
    strength_height = pi_standoff_height - 1.0;
    translate([(pcb_mount_width - frame_mount_length) / 2.0, pcb_mount_height - (strength_height + 1.0), -strength_height]) {
      // chamfered_strengthening_cube();
      cube([frame_mount_length, strength_height + 1.0, strength_height]);
    }

    // Thin rectangular connections around Pi mounting plate
    pi_plate_connections();
  }
}

l_bracket_assembly();

// Custom design hotend z-height sensor using the original
// Creality Endstop PCB and pinout
// Version 1.2

include <../../shared_helper.scad>

revision = 1.2;

mount_width = 45.6 + 4.00 + 4.00;
mount_height = 24.50;
mount_thickness = 6.00;

mount_wall_depth = 9.00;
mount_wall_thickness = 4.00;

mount_edge_distance = 4.50;
mount_hole_distance = 15.00;
mount_distance = 19.12 - 5.80 + 3.30;

// TODO:
// 45 degree cutoff

module CreateM3Holes() {
  rotate([0, 0, 0]) {
    translate([mount_distance, mount_edge_distance, 0]) {
      cylinder(d=m3_hole_diameter + hole_very_loose_tolerance, h=100.00);

      translate([0, mount_hole_distance, 0]) {
        cylinder(d=m3_hole_diameter + hole_very_loose_tolerance, h=100.00);
      }
    }
  }
}

module CreateHoles() {
  CreateM3Holes();

  // Create nut holders at the same positions as the holes
  translate([mount_distance, mount_edge_distance, mount_thickness - m3_nut_outer_depth + 0.1]) {
    CreateM3Nut();

    translate([0, mount_hole_distance, 0]) {
      CreateM3Nut();
    }
  }
}

module CreateMountArms() {
  difference() {
    union() {
      // Left arm extending from the front face
      translate([0, 0, mount_thickness]) {
        cube([mount_wall_thickness, mount_height, mount_wall_depth]);
      }

      // Right arm extending from the front face
      translate([mount_width - mount_wall_thickness, 0, mount_thickness]) {
        cube([mount_wall_thickness, mount_height, mount_wall_depth]);
      }
    }

    // Mount Holes
    translate([0, mount_edge_distance, (mount_wall_depth + mount_wall_thickness + 8.0) / 2.0]) {
      rotate([0, 90, 0]) {
        cylinder(d=m3_hole_diameter + hole_very_loose_tolerance, h=100.00, $fn=100.00);
      }
    }

    translate([0, mount_height - mount_edge_distance, (mount_wall_depth + mount_wall_thickness + 8.0) / 2.0]) {
      rotate([0, 90, 0]) {
        cylinder(d=m3_hole_diameter + hole_very_loose_tolerance, h=100.00, $fn=100.00);
      }
    }

    // Back nut holders Side A
    translate([(mount_wall_thickness - m3_nut_outer_depth), mount_edge_distance, (mount_wall_depth + mount_wall_thickness + 8.0) / 2.0]) {
      rotate([0, 90, 0]) {
        CreateM3Nut();
      }
    }

    translate([(mount_wall_thickness - m3_nut_outer_depth), mount_height - mount_edge_distance, (mount_wall_depth + mount_wall_thickness + 8.0) / 2.0]) {
      rotate([0, 90, 0]) {
        CreateM3Nut();
      }
    }

    // Back nut holders Side B
    translate([(mount_width - mount_wall_thickness), mount_edge_distance, (mount_wall_depth + mount_wall_thickness + 8.0) / 2.0]) {
      rotate([0, 90, 0]) {
        CreateM3Nut();
      }
    }

    translate([(mount_width - mount_wall_thickness), mount_height - mount_edge_distance, (mount_wall_depth + mount_wall_thickness + 8.0) / 2.0]) {
      rotate([0, 90, 0]) {
        CreateM3Nut();
      }
    }
  }
}

module CompileModel() {
  difference() {
    union() {
      cube([mount_width, mount_height, mount_thickness]);
      CreateMountArms();
    }

    CreateHoles();
  }
}

CompileModel();

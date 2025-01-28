// Include original file to access all modules and variables
include <x_axis_carriage_mounting_plate.scad>

// TODO
// make magnet holes smaller
// print ir holder
// print simple plate

// Variable Overrides
plate_height = 14.00;
plate_width = 19.00;
m3_hole_diameter = 2.8;
m3_offset = m3_hole_diameter;
m3_hole_height = 100;
standoff_diameter = 4.15;

countersink_diameter = 5.65;
countersink_height = 2.10;

hole_distance = 11.60 + m3_offset;

block_thickness = 6.00; // 5.48;

magent_thickness = 3.00;
magnet_hole_diameter = 5.20;
magnet_hole_outer_diamter = 7.00;

magnet_pusher_diamter = 1.20;
magnet_pusher_height = 200.00;

module klackender_probe_mount() {
  // translate([x_probe_mount_translation, y_probe_mount_translation, z_probe_mount_translation])
  // rotate(probe_mount_rotation)
  import("ender2pro-mount.stl");
}

module block_old_magent_holes() {
  translate([-10.50, 0, 0])
  linear_extrude(height = block_thickness)

  hull() {
    square([plate_width, plate_height]);
  }
}

// 5.2 mm instead of 6.3mm
module make_magent_holes_5() {
  rotate([0, 180, 0])
  translate([21.00, 22.00, -(magent_thickness + 3.0)]) {
    difference() {
      cylinder(d = magnet_hole_outer_diamter, h = magent_thickness + 1.0);
      cylinder(d = magnet_hole_diameter, h = magent_thickness);
    }
  }

  rotate([0, 180, 0])
  translate([-19.00, 22.00, -(magent_thickness + 3.0)]) {
    difference() {
      cylinder(d = magnet_hole_outer_diamter, h = magent_thickness + 1.0);
      cylinder(d = magnet_hole_diameter, h = magent_thickness);
    }
  }

  rotate([0, 180, 0])
  translate([21.00, -8.0, -(magent_thickness + 3.0)]) {
    difference() {
      cylinder(d = magnet_hole_outer_diamter, h = magent_thickness + 1.0);
      cylinder(d = magnet_hole_diameter, h = magent_thickness);
    }
  }

  rotate([0, 180, 0])
  translate([-19.00, -8.0, -(magent_thickness + 3.0)]) {
    difference() {
      cylinder(d = magnet_hole_outer_diamter, h = magent_thickness + 1.0);
      cylinder(d = magnet_hole_diameter, h = magent_thickness);
    }
  }
}

module magnet_pusher_holes() {
  rotate([0, 180, 0])
  translate([21.00, 22.00, -(magent_thickness + 3.0)]) {
    cylinder(d = magnet_pusher_diamter, h = magnet_pusher_height);
  }

  rotate([0, 180, 0])
  translate([-19.00, 22.00, -(magent_thickness + 3.0)]) {
    cylinder(d = magnet_pusher_diamter, h = magnet_pusher_height);
  }

  rotate([0, 180, 0])
  translate([21.00, -8.0, -(magent_thickness + 3.0)]) {
    cylinder(d = magnet_pusher_diamter, h = magnet_pusher_height);
  }

  rotate([0, 180, 0])
  translate([-19.00, -8.0, -(magent_thickness + 3.0)]) {
    cylinder(d = magnet_pusher_diamter, h = magnet_pusher_height);
  }
}

module m3_stand_off_holes() {
  translate([-8.00, plate_height - 11.00, -5.5]) {
    cylinder(d = m3_hole_diameter, h = m3_hole_height);
    translate([hole_distance, 0, 0]) {
      cylinder(d = m3_hole_diameter, h = m3_hole_height);
    }
  }
}

module m3_holes() {
  m3_stand_off_holes();
  union() {
    translate([-8.00, plate_height - 3.00, -5.5]) {
      cylinder(d = m3_hole_diameter, h = m3_hole_height);
      translate([hole_distance, 0, 0]) {
        cylinder(d = m3_hole_diameter, h = m3_hole_height);
      }
    }
  }
}

// Main assembly
module main_assembly() {
  // Final assembly
  difference() {
    union() {
      klackender_probe_mount();
      block_old_magent_holes();
      make_magent_holes_5();
    }
    union() {
      m3_holes();
      magnet_pusher_holes();
    }
  }
}

main_assembly();

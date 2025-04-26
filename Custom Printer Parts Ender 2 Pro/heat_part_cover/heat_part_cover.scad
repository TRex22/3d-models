// Ender 2 Pro Modified bed heat cover. This is used to help heat cycles of PLA
// prints

// High quality settings
$fn = 100;

// Define variables for dimensions
box_width = 168.00; // width and height of the box
box_length = 168.00; // length and height of the box
box_height = 168.00; // height of the box
box_thickness = 1.50; // thickness of the box
hole_diameter = 2.00; // diameter of the holes

// Calculate hole positions (inset from edges by 10mm)
hole_inset = 10;

difference() {
  // Outer cube
  cube([box_width, box_length, box_height]);

  // Inner cube (hollow out the box)
  translate([box_thickness, box_thickness, box_thickness])
  cube([
    box_width - 2*box_thickness,
    box_length - 2*box_thickness,
    box_height - box_thickness
  ]);

  // Corner holes
  translate([hole_inset, hole_inset, 0])
  cylinder(h=box_thickness*2, d=hole_diameter, center=true);

  translate([box_width - hole_inset, hole_inset, 0])
  cylinder(h=box_thickness*2, d=hole_diameter, center=true);

  translate([hole_inset, box_length - hole_inset, 0])
  cylinder(h=box_thickness*2, d=hole_diameter, center=true);

  translate([box_width - hole_inset, box_length - hole_inset, 0])
  cylinder(h=box_thickness*2, d=hole_diameter, center=true);

  // Center hole
  translate([box_width/2, box_length/2, 0])
  cylinder(h=box_thickness*2, d=hole_diameter, center=true);
}

include <../../shared_helper.scad>

revision = 1.3;
inner_diameter = m4_loose_hole_diameter + 0.5;
outer_diameter = 9.00;

height = 1.0; //set in each file
// height_reduction = 1.00;

module CreateSpacer() {
  difference() {
    cylinder(d=outer_diameter, h=height, center=true);
    cylinder(d=inner_diameter, h=height, center=true);
  }
}

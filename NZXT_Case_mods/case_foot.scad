// FDM printable design of the NZXT Case feet
include <../../shared_helper.scad>


base_width = 51.56;
base_length = 21.80;
base_height = 22.75;

top_width = 43.00;
top_length = 19.73;

top_angle = 45;

module cut_walls() {
  rotate([top_angle, 0, 0]) {
    cube([1.00, base_length, base_height]);
  }
}

difference() {
  cube([base_width, base_length, base_height]);
  cut_walls();
}

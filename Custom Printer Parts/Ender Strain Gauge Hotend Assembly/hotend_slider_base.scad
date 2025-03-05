// Hotend Slider

// Variables
include <shared_helper.scad>

// Vehicle / Slider
slider_length = 20.00;
slider_height = 20.00;
slider_depth = 7.00;

// Back / Housing / Casing
casing_length = 30.00;
casing_height = 25.00;
casing_depth = 8.40;

// Spring Holes
spring_hole_diameter = spring_diamete + hole_loose_tolerance;
spring_hole_length = slider_length - 1.00;

// Guide Holes
slider_guide_hole_diameter = brass_nail_diameter + hole_loose_tolerance;
slider_guide_hole_length = slider_length;

casing_guide_hole_diameter = brass_nail_diameter - hole_tight_tolerance;
casing_guid_hole_length = casing_length;

module ScrewHole(diameter = M2_Hole_Diameter, height = M2_Hole_Height) {
  cylinder(h = height, r1 = diameter / 2.0, $fn = quality_value);
}

module M3ScrewHoles() {
  translate([M3_Hole_Offset, 0, 0]) {
    ScrewHole(diameter = M3_Hole_Diameter, height = M3_Hole_Height);
  }
}

module M2ScrewHoles() {
  translate([-slider_length / 2.0 + M2_Hole_Offset, slider_depth + M2_Hole_Offset, 0]) {
    ScrewHole(diameter = M2_Hole_Diameter, height = M2_Hole_Height);
  }
}

module SpringHoles() {
  translate([-spring_hole_length / 2.0 + hole_loose_tolerance, 0, 0]) {
    cylinder(h = slider_depth, r1 = spring_hole_diameter / 2.0, $fn = quality_value);
  }
}

module SliderGuideHoles() {
  translate([-slider_guide_hole_length / 2.0 + v_wheel_offset, slider_depth - hole_loose_tolerance, 0]) {
    cylinder(h = slider_height, r1 = slider_guide_hole_diameter / 2.0, $fn = quality_value);
  }
}

module Nail() {
  difference() {
    cylinder(h = brass_nail_length, r1 = brass_nail_diameter / 2.0, $fn = quality_value);
    translate([0, 0, brass_nail_head_depth]) {
      cylinder(h = (brass_nail_length - brass_nail_head_depth), r1 = brass_nail_diameter / 2.0, r2 = (brass_nail_diameter - 2 * hole_tight_tolerance) / 2.0, $fn = quality_value);
    }
  }
}

module CasingGuideHoles() {
  translate([-casing_guid_hole_length / 2.0 + v_wheel_offset, casing_depth - hole_tight_tolerance, 0]) {
    Nail();
  }
}

module Slider() {
  difference() {
    cube([slider_length, slider_depth, slider_height], center = true);
    M3ScrewHoles();
    SpringHoles();
    SliderGuideHoles();
  }
}

module Casing() {
  difference() {
    cube([casing_length, casing_depth, casing_height], center = true);
    M2ScrewHoles();
    CasingGuideHoles();
  }
}

// Slider();
// Casing();

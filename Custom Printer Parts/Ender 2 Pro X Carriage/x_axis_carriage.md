# Ender 2 Pro X-Axis Carriage Designs
## Original X Carriage Design Prompt

```
Using OpenSCAD code model the Ender 2 Pro X Axis Carriage Plate. This plate was originally made of a single stamped metal plate wit ha single bend and with two inserts to produce stand-offs to hold the standard Ender heat-sink and hot-end assembly.

Here is the break down of each component and relevant measurements:
  - The plate section excluding the bent forked parts of the model and the eyelet measures at 61.25mm across and 45.30 down. When considering the length including the eyelet its 61.25mm across and 64.00mm down.
  - The thickness of the plate is 2.50mm.
  - The forks are bent 90 degrees from the rest of the plate and have a matching length of 20.38mm. They are at the bottom of the plate. Both forks have slots that go from their top edge to where the gap ends. The top edge is open. The forks protrude out the front and the stand-offs protrude out of the back of the plate. The forks go all the way to the back of the plate, there is no gap between the edge of the plate and the forks.
  - The left fork when looking at the plate from the back (fork pointing towards the viewer) is 13.50mm wide with a gap from the top edge down 10.50mm with a width of 1.75mm. The gap is 6.90mm from the left side of the fork and 4.85mm from the right side of the fork
  - The right fork when looking at the plate from the back (fork pointing towards the viewer) is 11.50mm wide with a gap from the top edge down 10.50mm with a width of 1.75mm. The gap is 4.90mm from the left side of the fork and 4.85mm from the right side of the fork
  - The eyelet sits between the two forks and is 24.04mm wide. It has a hole in the centre of the eyelet which is 7.10mm in diameter and goes through the plate. There is a gap of 5.25mm from the right edge of the left fork (13.50mm fork) to the eyelet. There is another gap of 5.6mm from the left edge of the right fork (11.50mm fork). This eyelet sticks out the bottom of the plate and has a hole 8.5mm from the bottom and 8.5mm from either side as its centered in the middle of the eyelet. The eyelet is rounded towards from bottom half of the hole.
  - The left side of the plate has two notches. The notch closest to the bottom is 4.20mm from the boot of the plate where the left fork bends 90 degrees. It has a width of 5.20mm and a depth of 2.30mm. The next notch is 13.60mm from the top of the first notch and the bottom edge of the second notch. The second notch is 5.40mm wide and 2.03mm deep.
  - The right side of the plate has one notch. It is 7.00mm from the bottom of the plate where the right fork is bent 90 degrees from the plate. The notch is 6.40mm wide and 3.04 mm deep.
  - There is a cutout rectangle with rounded edges. It is 22.00mm by 14.00mm and is 23mm from the left side of the plate to its left side. It is 28.60mm from the top of the plate and is below the stand-offs.
  - There are two M3 threaded holes one above the other when looking on the front surface of the plate. They are 17.00mm from the left side of the plate. The top hole is 24.95mm from the top of the plate to the top of the hole. The second hole is 11.70mm from the bottom of the top hole and the top of the bottom hole.
  - The two stand-offs which hold the heat-sink are both M3 threaded holes with the holes going through the plate itself to be open through. The stand-offs are on the opposite side to the forks in relation to the plate. Each stand-off is 23.60mm from the top of the plate. The left most stand-off is 27.00 mm from the left side of the plate. The right stand-off is 11.60mm from the right side of the left stand-off to the left side of the right stand-off. The stand-offs are 5.5mm tall and the outer diameter is 4.15mm. The holes for the M3 bolts go through the plate below as well. It is one piece with the plate.
  - There are another two M3 holes on the other side (right side) of the plate. They are both 4.8mm from the right edge of the plate. The bottom of the top hole and the top of the bottom hole are 4.6mm from each other. The bottom of the bottom hole to the bottom of the plate (where the fork bends 90 degrees) is 17.50mm.
  - There is a 3.5mm hole near the top of the plate. It is 2.23mm from the top edge of the plate and 23.00mm from the left edge of the plate
  - There is a small rectangle hole near the top of the plate. It is 2.30mm by 3.40mm. Its 1.75mm from the top edge of the plate and 8.80mm from the right edge of the plate.
  - There are two 5.20mm holes near the top of the plate which used to hold the two V-Wheels. The left hole is 9.45mm from the left edge of the plate and the right hole is 9.45mm from the right edge of the plate. They are both 9.30mm from the top of each hole to the top edge of the plate.
  - The two top corners of the plate are rounded aggressively. There is an 8.00mm from the beginning of the bevel to where the top corners of the plate would be.

Comment each component in the outputted SCAD code. Ensure that the model has high smoothness. Tabs have two spaces. Threaded holes should be a hole that is slightly smaller so it can be threaded by hand.

Here is a starting point which a model close to what is specified with some issues:

```scad
// Ender 2 Pro X Axis Carriage Plate Model
// High quality settings
$fn = 100;

// Main dimensions
plate_width = 61.25;
plate_height = 45.30;
total_height = 64.00;
thickness = 2.50;

// M3 thread hole size (slightly smaller for hand threading)
m3_hole = 2.8;

module main_plate() {
  difference() {
    // Base plate
    translate([0, 0, 0])
    linear_extrude(height = thickness)
    hull() {
      // Main rectangle with rounded top corners
      translate([8, 0, 0])
      square([plate_width - 16, plate_height]);
      translate([8, plate_height - 8, 0])
      circle(r = 8);
      translate([plate_width - 8, plate_height - 8, 0])
      circle(r = 8);
      square([plate_width, plate_height - 8]);
    }

    // Left side notches
    translate([-1, 4.20, -1]) {
      cube([2.30 + 1, 5.20, thickness + 2]);
      translate([0, 13.60 + 5.20, 0])
      cube([2.03 + 1, 5.40, thickness + 2]);
    }

    // Right side notch
    translate([plate_width - 2.30, 7.00, -1])
    cube([3.04 + 1, 6.40, thickness + 2]);

    // Central rounded rectangle cutout
    translate([23, 28.60, -1])
    hull() {
      for(x = [0, 22 - 3], y = [0, 14 - 3]) {
        translate([x + 1.5, y + 1.5, 0])
        cylinder(r = 1.5, h = thickness + 2);
      }
    }

    // Left side M3 holes
    translate([17, 24.95, -1]) {
      cylinder(d = m3_hole, h = thickness + 2);
      translate([0, -11.70, 0])
      cylinder(d = m3_hole, h = thickness + 2);
    }

    // Right side M3 holes
    translate([plate_width - 4.8, 0, -1]) {
      translate([0, 17.50 + 4.6, 0])
      cylinder(d = m3_hole, h = thickness + 2);
      translate([0, 17.50, 0])
      cylinder(d = m3_hole, h = thickness + 2);
    }

    // Top small holes
    translate([23, plate_height - 2.23, -1])
    cylinder(d = 3.5, h = thickness + 2);

    translate([plate_width - 8.8 - 2.30, plate_height - 1.75 - 3.40, -1])
    cube([2.30, 3.40, thickness + 2]);

    // V-wheel holes
    translate([9.45, plate_height - 9.30, -1])
    cylinder(d = 5.20, h = thickness + 2);
    translate([plate_width - 9.45, plate_height - 9.30, -1])
    cylinder(d = 5.20, h = thickness + 2);
  }
}

module standoffs() {
  // Heat-sink standoffs
  translate([27, 23.60, thickness]) {
    difference() {
      cylinder(d = 4.15, h = 5.5);
      cylinder(d = m3_hole, h = 5.5 + 1);
    }
    translate([11.60, 0, 0]) {
      difference() {
        cylinder(d = 4.15, h = 5.5);
        cylinder(d = m3_hole, h = 5.5 + 1);
      }
    }
  }
}

module forks_and_eyelet() {
  // Left fork
  translate([0, 0, thickness])
  rotate([90, 0, 0])
  linear_extrude(height = thickness)
  difference() {
    square([13.50, 20.38]);
    translate([6.90, 20.38 - 10.50])
    square([1.75, 10.50 + 1]);
  }

  // Right fork
  translate([plate_width - 11.50, 0, thickness])
  rotate([90, 0, 0])
  linear_extrude(height = thickness)
  difference() {
    square([11.50, 20.38]);
    translate([4.90, 20.38 - 10.50])
    square([1.75, 10.50 + 1]);
  }

  // Eyelet
  translate([13.50 + 5.25, -thickness, 0])
  linear_extrude(height = thickness)
  difference() {
    union() {
      translate([0, 0, 0])
      square([24.04, 18.70]);
      translate([24.04/2, 0, 0])
      circle(d = 24.04);
    }
    translate([24.04/2, 8.5, 0])
    circle(d = 7.10);
  }
}

// Combine all components
union() {
  main_plate();
  standoffs();
  forks_and_eyelet();
}
```

The given code is close to the correct shape. The stand-offs are in the correct place and the forks are in the correct place. The eyelet is also located correctly, here are the issues to correct:
  - The Stand-offs protrude on the opposite side of the plate (the back of the plate) to the forks (the front of the plate).
  - Stand-offs must have their holes go through the plate so the screw can go through the plate as well.
  - The Forks do not have a gap between the bottom of the plate and where they meet the plate at 90 degrees. They do not float above the plate and are solidly connected to the plate.
  - The Eyelet is positioned correctly but has a 7.10mm diameter hole in the center of the rounded section that goes through the plate for the adjustable V-Wheel and spacer.
  - The rectangle cut-out should be below the stand-offs from its top edge with a solid gap of plate material and not above them on the plate. They are measured from the bottom edge of the plate. The top edge of the cut-out has a 2.94mm of material to the bottom edge of the stand-off holes. It cuts through a part of the eyelet section but there is solid material between the bottom of the cut-out and top of the eyelet hole of 6.00mm

Please fix these issues
```

### Maybe?
Some measurements had to include thickness

### TODO
[] GitHub Workflow and compile

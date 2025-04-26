// Ender 2 Pro X Axis Carriage Plate Model
// prompt: Using OpenSCAD model the Ender 2 Pro X Axis Carriage Plate

// Main plate dimensions
plate_width = 90;
plate_height = 50;
plate_thickness = 4;

// Mounting hole parameters
hole_diameter = 4;
hole_spacing_x = 31;
hole_spacing_y = 23;

module carriage_plate() {
    difference() {
        // Main plate
        cube([plate_width, plate_height, plate_thickness]);
        
        // V-wheel mounting holes
        for(x = [20, 20 + hole_spacing_x, 20 + 2*hole_spacing_x]) {
            for(y = [10, 10 + hole_spacing_y]) {
                translate([x, y, -1])
                    cylinder(h=plate_thickness + 2, d=hole_diameter, $fn=32);
            }
        }
        
        // Hotend mount holes
        translate([plate_width/2, plate_height/2, -1]) {
            for(x = [-20, 20]) {
                for(y = [-10, 10]) {
                    translate([x, y, 0])
                        cylinder(h=plate_thickness + 2, d=hole_diameter, $fn=32);
                }
            }
        }
        
        // Belt attachment slots
        translate([10, plate_height - 15, -1]) {
            cube([15, 6, plate_thickness + 2]);
        }
        translate([plate_width - 25, plate_height - 15, -1]) {
            cube([15, 6, plate_thickness + 2]);
        }
    }
}

carriage_plate();

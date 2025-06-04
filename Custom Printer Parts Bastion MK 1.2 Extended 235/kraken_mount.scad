// Kraken PCB 90-degree mount for custom 3D printer frame
include <../shared_helper.scad>;
revision = 1.0;

// PCB Dimensions - Kraken is 200x113mm
pcb_mount_width = 200.00;
pcb_mount_height = 113.00;
pcb_mount_depth = 3.30;

// PCB hole spacing (corners)
pcb_hole_distance_width = 190.00;
pcb_hole_distance_height = 102.00;

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
hole_diameter = m3_hole_diameter + hole_tight_tolerance;
pi_hole_diameter = m2_5_hole_diameter + hole_tight_tolerance;

// Frame mounting back plate (vertical)
module frame_mount_plate() {
    difference() {
        cube([frame_mount_length, frame_mount_width, frame_mount_depth]);
        
        // Frame mounting holes - 4 holes, 114mm apart lengthwise, 15.1mm apart width-wise
        for (i = [0, 1]) {
            for (j = [0, 1]) {
                translate([
                    (frame_mount_length - frame_mount_hole_spacing_length) / 2 + i * frame_mount_hole_spacing_length,
                    (frame_mount_width - frame_mount_hole_spacing_width) / 2 + j * frame_mount_hole_spacing_width,
                    -0.1
                ]) {
                    cylinder(d = hole_diameter, h = frame_mount_depth + 0.2);
                }
            }
        }
    }
}

// PCB mounting plate (horizontal) with material-saving cutouts
module pcb_mount_plate() {
    difference() {
        union() {
            // Main plate
            cube([pcb_mount_width, pcb_mount_height, pcb_mount_depth]);
            
            // PCB standoffs at corners
            standoff_diameter = 8.0;
            translate([(pcb_mount_width - pcb_hole_distance_width) / 2, (pcb_mount_height - pcb_hole_distance_height) / 2, 0]) {
                for (i = [0, 1]) {
                    for (j = [0, 1]) {
                        translate([i * pcb_hole_distance_width, j * pcb_hole_distance_height, pcb_mount_depth]) {
                            cylinder(d = standoff_diameter, h = standoff_height);
                        }
                    }
                }
            }
        }
        
        // Material-saving cutouts in the middle areas
        cutout_margin = 20;
        translate([cutout_margin, cutout_margin, -0.1]) {
            cube([pcb_mount_width - 2 * cutout_margin, pcb_mount_height - 2 * cutout_margin, pcb_mount_depth + 0.2]);
        }
        
        // PCB mounting holes
        translate([(pcb_mount_width - pcb_hole_distance_width) / 2, (pcb_mount_height - pcb_hole_distance_height) / 2, -0.1]) {
            for (i = [0, 1]) {
                for (j = [0, 1]) {
                    translate([i * pcb_hole_distance_width, j * pcb_hole_distance_height, 0]) {
                        cylinder(d = hole_diameter, h = pcb_mount_depth + standoff_height + 0.2);
                    }
                }
            }
        }
    }
}

// Raspberry Pi mounting standoffs (on opposite side)
module pi_mount_standoffs() {
    standoff_diameter = 6.0;
    pi_standoff_height = 7.0;
    
    // Position Pi lengthwise on the opposite side
    translate([pcb_mount_width + 10, (pcb_mount_height - pi_mount_width) / 2, pcb_mount_depth]) {
        for (i = [0, 1]) {
            for (j = [0, 1]) {
                translate([
                    pi_offset_from_edge_x + i * pi_hole_distance_height,  // Note: swapped for lengthwise orientation
                    pi_offset_from_edge_y + j * pi_hole_distance_width,
                    0
                ]) {
                    difference() {
                        cylinder(d = standoff_diameter, h = pi_standoff_height);
                        translate([0, 0, -0.1]) {
                            cylinder(d = pi_hole_diameter, h = pi_standoff_height + 0.2);
                        }
                    }
                }
            }
        }
    }
}

// Extension plate for Pi mounting
module pi_extension_plate() {
    extension_width = pi_mount_width + 20;
    extension_height = pi_mount_height + 10;
    
    translate([pcb_mount_width, (pcb_mount_height - extension_width) / 2, 0]) {
        difference() {
            cube([extension_height, extension_width, pcb_mount_depth]);
            
            // Material saving cutout
            translate([10, 10, -0.1]) {
                cube([extension_height - 20, extension_width - 20, pcb_mount_depth + 0.2]);
            }
        }
    }
}

// 90-degree L-bracket assembly
module l_bracket_assembly() {
    union() {
        // Horizontal PCB mounting plate
        pcb_mount_plate();
        
        // Pi extension plate
        pi_extension_plate();
        
        // Pi standoffs
        pi_mount_standoffs();
        
        // Vertical frame mounting plate
        translate([0, 0, pcb_mount_depth]) {
            rotate([90, 0, 0]) {
                translate([-(frame_mount_length - pcb_mount_width) / 2, 0, -frame_mount_width]) {
                    frame_mount_plate();
                }
            }
        }
    }
}

l_bracket_assembly();

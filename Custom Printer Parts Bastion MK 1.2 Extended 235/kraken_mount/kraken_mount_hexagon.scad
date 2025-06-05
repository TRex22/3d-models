// Kraken mount with hexagon cutouts for reduced plastic usage
// Imports the original design and adds hexagonal material-saving features

use <kraken_mount.scad>
revision = 1.2;

// Hexagon parameters
hex_size = 6;           // Distance from center to vertex (smaller for better coverage)
hex_spacing = 12;       // Distance between hexagon centers (tighter spacing)
hex_depth = 2.0;        // How deep to cut into the material

add_kraken_standoffs = false;

// Create a hexagon shape
module hexagon(size, height) {
    cylinder(d = size * 2, h = height, $fn = 6);
}

// Generate hexagon cutouts for the main PCB plate
module pcb_plate_hexagons() {
    // PCB plate dimensions from original
    pcb_width = 200.00;
    pcb_height = 113.00;
    
    // Avoid areas around standoffs and mounting holes
    standoff_margin = 10;
    edge_margin = 8;
    
    // PCB standoff positions (from original file)
    pcb_hole_distance_width = 190.00;
    pcb_hole_distance_height = 102.00;
    standoff_x1 = (pcb_width - pcb_hole_distance_width) / 2;
    standoff_x2 = standoff_x1 + pcb_hole_distance_width;
    standoff_y1 = (pcb_height - pcb_hole_distance_height) / 2;
    standoff_y2 = standoff_y1 + pcb_hole_distance_height;
    
    // Pi area to avoid (from original file)
    pi_width = 85.00;
    pi_height = 56.00;
    pi_x1 = (pcb_width - pi_width) / 2;
    pi_x2 = pi_x1 + pi_width;
    pi_y1 = (pcb_height - pi_height) / 2;
    pi_y2 = pi_y1 + pi_height;
    
    // Generate hexagon grid
    for (x = [edge_margin : hex_spacing : pcb_width - edge_margin]) {
        for (y = [edge_margin : hex_spacing : pcb_height - edge_margin]) {
            // Offset every other row
            x_pos = x + ((floor(y / hex_spacing) % 2) * hex_spacing / 2);
            
            // Check if position is valid and not in restricted areas
            if (x_pos >= edge_margin && x_pos <= pcb_width - edge_margin) {
                // Check distance from standoffs
                dist_to_standoffs = min(
                    sqrt(pow(x_pos - standoff_x1, 2) + pow(y - standoff_y1, 2)),
                    sqrt(pow(x_pos - standoff_x2, 2) + pow(y - standoff_y1, 2)),
                    sqrt(pow(x_pos - standoff_x1, 2) + pow(y - standoff_y2, 2)),
                    sqrt(pow(x_pos - standoff_x2, 2) + pow(y - standoff_y2, 2))
                );
                
                // Check if outside Pi area and standoff areas
                outside_pi = (x_pos < pi_x1 - 3 || x_pos > pi_x2 + 3 || y < pi_y1 - 3 || y > pi_y2 + 3);
                away_from_standoffs = dist_to_standoffs > standoff_margin;
                
                if (outside_pi && away_from_standoffs) {
                    translate([x_pos, y, -0.1]) {
                        hexagon(hex_size, hex_depth + 0.2);
                    }
                }
            }
        }
    }
}

// Generate hexagon cutouts for the vertical frame mount
module frame_plate_hexagons() {
    // Frame plate dimensions from original
    frame_length = 144.00;
    frame_width = 25.00;
    
    // Mounting hole positions to avoid
    hole_spacing = 114.00;
    hole_margin = 12;
    hole_x1 = (frame_length - hole_spacing) / 2;
    hole_x2 = hole_x1 + hole_spacing;
    hole_y = frame_width / 2;
    
    edge_margin = 6;
    
    // Generate hexagon grid
    for (x = [edge_margin : hex_spacing : frame_length - edge_margin]) {
        for (y = [edge_margin : hex_spacing : frame_width - edge_margin]) {
            // Offset every other row
            x_pos = x + ((floor(y / hex_spacing) % 2) * hex_spacing / 2);
            
            if (x_pos >= edge_margin && x_pos <= frame_length - edge_margin) {
                // Check distance from mounting holes
                dist_to_holes = min(
                    sqrt(pow(x_pos - hole_x1, 2) + pow(y - hole_y, 2)),
                    sqrt(pow(x_pos - hole_x2, 2) + pow(y - hole_y, 2))
                );
                
                if (dist_to_holes > hole_margin) {
                    translate([x_pos, y, -0.1]) {
                        hexagon(hex_size, hex_depth + 0.2);
                    }
                }
            }
        }
    }
}

// Generate hexagon cutouts for the strengthening block
module strengthening_block_hexagons() {
    frame_length = 144.00;
    strength_height = 6.0;  // pi_standoff_height - 1.0 from original
    
    small_hex_size = 4;
    small_hex_spacing = 8;
    
    // Generate smaller hexagons in the strengthening area
    for (x = [small_hex_size : small_hex_spacing : frame_length - small_hex_size]) {
        for (z = [small_hex_size : small_hex_spacing : strength_height - small_hex_size]) {
            translate([x, 3.5, z]) {  // Middle of the block depth
                rotate([90, 0, 0]) {
                    cylinder(d = small_hex_size * 2, h = 1.5, $fn = 6);
                }
            }
        }
    }
}

// Main assembly with hexagon cutouts
module kraken_mount_with_hexagons() {
    difference() {
        // Original kraken mount
        l_bracket_assembly();
        
        // Hexagon cutouts in main PCB plate
        pcb_plate_hexagons();
        
        // Hexagon cutouts in vertical frame mount plate
        translate([-(144 - 200) / 2, 113, -(25 - 3.3)]) {
            rotate([90, 0, 0]) {
                frame_plate_hexagons();
            }
        }
        
        // Hexagon cutouts in strengthening block
        translate([(200 - 144) / 2.0, 113 - (6.0 + 1.0), -6.0]) {
            strengthening_block_hexagons();
        }
    }
}

// Render the final assembly
kraken_mount_with_hexagons();

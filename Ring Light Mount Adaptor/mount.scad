// Please help me make a SCAD model for an adaptor for a special nut.
// The nut is 6 sided with a distance between two sides being 7.82mm.
// The adaptor needs to be a rectangle which is 8.35mm x 10.23mm.
// Each dimensional size needs to be a variable at the top of the scad.
// The nut is 5.9mm tall

// Hex Nut Adapter
// All dimensions in millimeters

// ===== ADAPTER DIMENSIONS =====
adapter_width = 8.35;      // Short side of rectangle
adapter_length = 10.23;    // Long side of rectangle
adapter_height = 5.9;      // Height/thickness of adapter (matches nut height)

// ===== NUT DIMENSIONS =====
nut_flat_to_flat = 7.82;   // Distance between parallel sides of hexagon
nut_height = 5.9;          // Height of the nut

// ===== TOLERANCE =====
tolerance = 0.2;           // Extra clearance for nut (adjust for fit)

// ===== CALCULATED VALUES =====
// For a hexagon, the circumradius (corner-to-corner / 2) is flat_to_flat / (2 * cos(30))
nut_circumdiameter = (nut_flat_to_flat + tolerance) / cos(30);

// ===== MODEL =====
difference() {
    // Outer rectangular body
    translate([0, 0, adapter_height/2])
        cube([adapter_length, adapter_width, adapter_height], center=true);

    // Hexagonal hole for nut - extends all the way through
    translate([0, 0, -0.1])
        cylinder(h=adapter_height+0.2, d=nut_circumdiameter, $fn=6);
}

// ===== NOTES =====
// - The hexagon is oriented with flat sides parallel to the Y-axis
// - To rotate the hex 30 degrees, add: rotate([0, 0, 30])
// - Adjust adapter_height based on your needs
// - Adjust tolerance for a tighter or looser fit

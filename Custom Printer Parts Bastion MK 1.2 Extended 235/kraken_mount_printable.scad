// Printable version of Kraken PCB mount - split into two halves for smaller print beds
include <kraken_mount.scad>

// Split parameters
split_position = pcb_mount_width / 2;  // Split at middle
slot_width = 4.0;
slot_depth = 2.0;
slot_height = pcb_mount_depth;

// Number of interlocking slots along the split edge
num_slots = 3;
slot_spacing = (pcb_mount_height - 20) / (num_slots - 1);  // Leave margins

add_pi_standoffs = true;
add_kraken_standoffs = false;

// Interlocking slot pattern
module slot_pattern(is_male = true) {
  slot_start_y = 10;  // Start margin
  
  for (i = [0 : num_slots - 1]) {
    translate([0, slot_start_y + i * slot_spacing, 0]) {
      if (is_male) {
        // Male connector (protrudes)
        cube([slot_depth, slot_width, slot_height]);
      } else {
        // Female connector (cuts into material)
        translate([-0.1, 0, -0.1]) {
          cube([slot_depth + 0.1, slot_width, slot_height + 0.2]);
        }
      }
    }
  }
}

// Left half of the mount (includes male connectors)
module kraken_mount_left_half() {
  difference() {
    union() {
      // Original model intersected with left half
      intersection() {
        l_bracket_assembly();
        // Cut to left half
        translate([-1, -1, -50]) {
          cube([split_position + 1, pcb_mount_height + 2, 100]);
        }
      }
      
      // Add male connectors
      translate([split_position, 0, 0]) {
        slot_pattern(true);
      }
    }
    
    // Cut female slots for the right half's male connectors
    translate([split_position - slot_depth, 0, 0]) {
      slot_pattern(false);
    }
  }
}

// Right half of the mount (includes female connectors)
module kraken_mount_right_half() {
  difference() {
    union() {
      // Original model intersected with right half
      intersection() {
        l_bracket_assembly();
        // Cut to right half
        translate([split_position, -1, -50]) {
          cube([pcb_mount_width - split_position + 1, pcb_mount_height + 2, 100]);
        }
      }
      
      // Add male connectors on the other pattern positions
      translate([split_position - slot_depth, 0, 0]) {
        // Offset slots to interlock with left half
        slot_start_y = 10 + slot_spacing / 2;
        
        for (i = [0 : num_slots - 2]) {  // One less slot, offset pattern
          translate([0, slot_start_y + i * slot_spacing, 0]) {
            cube([slot_depth, slot_width, slot_height]);
          }
        }
      }
    }
    
    // Cut female slots for the left half's male connectors
    translate([split_position - slot_depth, 0, 0]) {
      slot_pattern(false);
    }
  }
}

// Display options - uncomment the one you want to render
// For printing left half:
kraken_mount_left_half();

// For printing right half (comment out left half above):
// kraken_mount_right_half();

// For assembly view (comment out individual halves above):
// kraken_mount_left_half();
// kraken_mount_right_half();

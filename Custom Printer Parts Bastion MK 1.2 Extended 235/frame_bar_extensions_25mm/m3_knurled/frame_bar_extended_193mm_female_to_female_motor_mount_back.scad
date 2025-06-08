// Frame Bar Original - 144.00 mm
original_length = 94.00;
original_mount_depth = 25.0;
original_side_hole_length_from_edge = 57.20; // original
original_top_hole_length_from_edge = 19.70 + original_mount_depth; // original

include <frame_bar_original_female_to_female_motor_mount_back.scad>;

revision = 1.0;
extension_length = 193.00 - (2 * 25.00);
side_hole_length_from_edge = original_side_hole_length_from_edge + ((extension_length - original_length) / 2.0);
top_hole_length_from_edge = original_top_hole_length_from_edge + ((extension_length - original_length) / 2.0);

side_hole_length_from_edge = original_side_hole_length_from_edge + ((extension_length - original_length) / 2.0);
top_hole_length_from_edge = original_top_hole_length_from_edge + ((extension_length - original_length) / 2.0);

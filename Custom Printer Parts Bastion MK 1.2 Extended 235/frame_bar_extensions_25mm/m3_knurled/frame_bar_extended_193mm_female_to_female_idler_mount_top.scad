// Rear top Idler Mount
original_length = 94.00;
original_mount_depth = 25.0;
original_idler_top_side_hole_distance_from_connector = 19.70 + original_mount_depth;

include <frame_bar_original_female_to_female_idler_mount_top.scad>;

revision = 1.0;

extension_length = 193.00 - (2 * 25.00);
extension_shift = ((extension_length - original_length) / 2.0);
idler_top_side_hole_distance_from_connector = original_idler_top_side_hole_distance_from_connector + extension_shift;

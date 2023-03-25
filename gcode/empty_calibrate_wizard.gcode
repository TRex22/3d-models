;FLAVOR:Marlin
;Layer height: 0.2
M190 S60
M104 S0
M109 S0
M82 ;absolute extrusion mode
;Basic settings:
;Layer height: 0.2
;Walls: 0.8
;Top/Bottom: 0.6
;Fill: 10
;Retraction Distance: 4
;Retraction Speed: 45
G28 ;Home

G1 Z10 ; Lift Z axis
G1 X32 Y35 ; Move to Position 1
G1 Z0
M0 ; Pause print
G1 Z10 ; Lift Z axis
G1 X32 Y135 ; Move to Position 2
G1 Z0
M0 ; Pause print
G1 Z10 ; Lift Z axis
G1 X202 Y135 ; Move to Position 3
G1 Z0
M0 ; Pause print
G1 Z10 ; Lift Z axis
G1 X202 Y35 ; Move to Position 4
G1 Z0
M0 ; Pause print
G1 Z10 ; Lift Z axis
G1 X32 Y35 ; Move to Position 1
G1 Z0
M0 ; Pause print
G1 Z10 ; Lift Z axis
G1 X32 Y135 ; Move to Position 2
G1 Z0
M0 ; Pause print
G1 Z10 ; Lift Z axis
G1 X202 Y135 ; Move to Position 3
G1 Z0
M0 ; Pause print
G1 Z10 ; Lift Z axis
G1 X202 Y35 ; Move to Position 4
G1 Z0
M0 ; Pause print
G1 Z10 ; Lift Z axis
G1 X32 Y35 ; Move to Position 1
G1 Z0
M0 ; Pause print
G1 Z10 ; Lift Z axis
G1 X32 Y135 ; Move to Position 2
G1 Z0
M0 ; Pause print
G1 Z10 ; Lift Z axis
G1 X202 Y135 ; Move to Position 3
G1 Z0
M0 ; Pause print
G1 Z10 ; Lift Z axis
G1 X202 Y35 ; Move to Position 4
G1 Z0
M0 ; Pause print
G1 Z50 ; Move Z Axis up 50 mm to allow trimming filament

M190 S60
M104 S210
M109 S210

G28
G1 Z15.0 F6000 ;Move the platform down 15mm
;Prime the extruder
G92 E0
G1 F200 E3
G92 E0
G92 E0
G1 F3600 E-7
;LAYER_COUNT:2
;LAYER:0
M107
M204 S5000
M205 X30 Y30
G0 F3600 X26.401 Y26.181 Z0.2
M204 S500
M205 X20 Y20
;TYPE:SKIRT

;print the layer test


M204 S4000
M220 S100 ; Reset Speed factor override percentage to default (100%)
M221 S100 ; Reset Extrude factor override percentage to default (100%)
G91
G1 F1800 E-4
G1 F3000 Z20 ; Move Z Axis up 20 mm to allow clearance
G90
M117 YOU ROCK
G1 X0 Y{machine_depth} F1000 ; Move Heat Bed to the front for easy print removal
M106 S0 ; turn off cooling fan
M104 S0 ; turn off extruder
M140 S0 ; turn off bed
M82 ;absolute extrusion mode
M104 S0
M107 ; Turn off Fan
M84 ; disable motors
M84 ; Disable stepper motors
;End of Gcode
;SETTING_3 {"extruder_quality": ["[general]\\nversion = 4\\nname = Ender3 0.2\\n
;SETTING_3 definition = fdmprinter\\n\\n[metadata]\\nsetting_version = 4\\ntype 
;SETTING_3 = quality_changes\\nposition = 0\\nquality_type = normal\\n\\n[values
;SETTING_3 ]\\nbottom_thickness = =top_bottom_thickness\\nbrim_line_count = 5\\n
;SETTING_3 infill_pattern = triangles\\ninfill_sparse_density = 10\\nline_width 
;SETTING_3 = 0.35\\nmaterial_diameter = 1.75\\nmaterial_flow = 90\\nmaterial_pri
;SETTING_3 nt_temperature = =default_material_print_temperature\\noptimize_wall_
;SETTING_3 printing_order = True\\nraft_margin = 5\\nretraction_amount = 7\\nret
;SETTING_3 raction_speed = 60\\nskirt_line_count = 3\\nspeed_infill = =speed_pri
;SETTING_3 nt\\nspeed_layer_0 = =speed_print * 30 / 60\\nspeed_travel = =speed_p
;SETTING_3 rint if magic_spiralize else 120\\nspeed_wall_0 = =speed_wall\\nsuppo
;SETTING_3 rt_angle = 70\\nsupport_interface_enable = True\\nsupport_z_distance 
;SETTING_3 = 0.2\\ntop_bottom_pattern = lines\\ntop_thickness = =top_bottom_thic
;SETTING_3 kness\\ntravel_avoid_supports = True\\nwall_line_count = 3\\nz_seam_t
;SETTING_3 ype = back\\n\\n"], "global_quality": "[general]\\nversion = 4\\nname
;SETTING_3  = Ender3 0.2\\ndefinition = fdmprinter\\n\\n[metadata]\\nsetting_ver
;SETTING_3 sion = 4\\ntype = quality_changes\\nquality_type = normal\\n\\n[value
;SETTING_3 s]\\nadaptive_layer_height_variation = 0.3\\nadaptive_layer_height_va
;SETTING_3 riation_step = 0.08\\nadhesion_type = skirt\\ndefault_material_bed_te
;SETTING_3 mperature = 45\\nlayer_height = 0.2\\nmaterial_bed_temperature = =def
;SETTING_3 ault_material_bed_temperature\\nprime_tower_size = 10.0\\nretraction_
;SETTING_3 combing = noskin\\nsupport_enable = False\\nsupport_type = everywhere
;SETTING_3 \\n\\n"}

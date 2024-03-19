include <parameters.scad>
include <stabilizer_spacing.scad>

//layout-esrille-36-L-TH
//只有拇指

//// Horizontal unit size (18mm for choc keycaps)
//h_unit = 18;
//// Vertical unit size (17mm for choc keycaps)
//v_unit = 18;
//

/* [Layout Values] */
/* Layout Format (each key):
    [//labels(4)                                // Center label, Only used for marking keys
        [                                       // Location Data
            [x_location, y_location],
            key_size,
            [rotation, rotation_x, rotation_y],
        ],
        [                                       // Borders
            top_border,
            bottom_border,
            left_border,
            right_border
        ],
        extra_data,                            // Extra data (depending on component type)
        labels(4)                              //Center label, Only used to compare which key
    ]
*/

// Keyswitch Layout
//     (extra_data = rotate_column)


////pcb.scad add:
////left feet
//translate([5.4121*unit+1.43,-6.1165*unit+2.6,-4])
//    rotate_p(-21.41+90+180,[0,0,0])
//    #cube([socket_size,2,2]);
//
////right feet
//translate([(7.2504)*unit+8.7,(-7.2777)*unit-18.95,-4])
////    rotate_p(-43.16,[7.7504,7.7777,0])
//    rotate_p(-43.16,[0,0,0])
//    #cube([2,socket_size,2]);
//

//16mm
//iBorder=5
//18mm
//Border=2.1


//
//base_switch_layout = [
//  [//Shift
//[[5.4121,6.1165],1,[-21.41+90+0,5.9121,6.6165]],[2.1,2.1,0,0],[false,switch_type]],
//  [//Backspace
//[[6.3906,6.6073],1,[-32.31+90+0,6.8906,7.1073]],[2.1,2.1,0,0],[false,switch_type]],
//  [//Alt
//[[7.2504,7.2777],1,[-43.16+90+0,7.7504,7.7777]],[2.1,2.1,0,0],[false,switch_type]],
//];


//base_switch_layout = [
//  [//Shift
//[[5.4121,6.1165],1,[-21.41+90-90,5.9121,6.6165]],[0,0,2.3,2.1],[false,switch_type]],
//  [//Backspace
//[[6.3906,6.6073],1,[-32.31+90-90,6.8906,7.1073]],[0,0,2.1,2.1],[false,switch_type]],
//  [//Alt
//[[7.2504,7.2777],1,[-43.16+90-90,7.7504,7.7777]],[0,0,2.1,2.3],[false,switch_type]],
//];


base_switch_layout = [
  [//Shift
[[5.4121,6.1165],1,[-21.41+90-90,5.9121,6.6165]],[0,0,2.5*h_mm,2.4*h_mm],[false,switch_type]],
  [//Backspace
[[6.3906,6.6073],1,[-32.31+90-90,6.8906,7.1073]],[0,0,1.8*h_mm,1.8*h_mm],[false,switch_type]],
  [//Alt
[[7.2504,7.2777],1,[-43.16+90-90,7.7504,7.7777]],[0,0,2.4*h_mm,2.5*h_mm],[false,switch_type]],
];



// MCU Position(s)
base_mcu_layout = [];

// TRRS Position(s)
base_trrs_layout = [];

// Stabilizer layout
//     (extra_data = [key_size, left_offset, right_offset, switch_offset=0])
//     (see stabilizer_spacing.scad for presets)
base_stab_layout = [];

// Via layout
//     (extra_data = [via_width, via_length])
base_via_layout = [];

// Plate Layout (if different than PCB)
//     (extra_data = component_type)
base_plate_layout = [];

// Whether to only use base_plate_layout to generate the plate footprint
use_plate_layout_only = false;

// Standoff layout
//     (extra_data = [standoff_integration_override, standoff_attachment_override])
base_standoff_layout = [];

// EC11 Position(s)
base_ec11_layout = [];

// EVQWGD001 Position(s)
base_evqwgd001_layout = [
];

//Microswitch (Reset button)
base_microswitch_layout = [];

// Whether to flip the layout
invert_layout_flag = false;

// Whether the layout is staggered-row or staggered-column
layout_type = "column";  // [column, row]

base_pcb_layout_outer=[
//hull all group
];

base_pcb_layout_outer2=[
];



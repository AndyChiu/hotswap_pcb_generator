include <parameters.scad>
include <stabilizer_spacing.scad>

//layout_corne36_L.scad

/* [Layout Values] */
/* Layout Format (each key):
    [
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
        extra_data                              // Extra data (depending on component type)
    ]
*/

// Keyswitch Layout
//     (extra_data = rotate_column)
base_switch_layout = [
  // Left Hand
//  [//FN7
//  [[0,0.375],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
//  [//FN8
//  [[0,1.375],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
//  [//FN9
//  [[0,2.375],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//Q
  [[1,0.375],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//A
  [[1,1.375],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//Z
  [[1,2.375],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//W
  [[2,0.125],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//S
  [[2,1.125],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//X
  [[2,2.125],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//E
  [[3,0],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//D
  [[3,1],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//C
  [[3,2],1,[0,0,0]],[3,5,3,3],[false,switch_type]],
  [//R
  [[4,0.125],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//F
  [[4,1.125],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//V
  [[4,2.125],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//T
  [[5,0.25],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//G
  [[5,1.25],1,[0,0,0]],[3,3,3,3],[false,switch_type]],
  [//B
  [[5,2.25],1,[0,0,0]],[3,3,5,3],[false,switch_type]],
  [//FN1
  [[3.5,3.16],1,[0,0,0]],[3,4,4,5],[false,switch_type]],
  [//FN2
  [[4.5,3.16],1,[-15,4.5,4.16]],[4,6,5,5],[false,switch_type]],
  [//FN3
  [[3.966,3.419],1.5,[-120,5.466,4.419]],[3,3,2+0.25*unit*mm,5+0.25*unit*mm],[false,switch_type]],
];

// MCU Position(s)
base_mcu_layout = [
    [[[6,0.1],mcu_h_unit_size],[0,0,h_border_width,0]],
];

// TRRS Position(s)
base_trrs_layout = [
    [[[6.5,2.5],1,[-90,7,3]],[0,h_unit/2+h_border_width,2*mm,0]],
];

// Stabilizer layout
//     (extra_data = [key_size, left_offset, right_offset, switch_offset=0])
//     (see stabilizer_spacing.scad for presets)
base_stab_layout = [];

// Via layout
//     (extra_data = [via_width, via_length])
base_via_layout = [
//    [[[5.5,2.85]]]
];

// Plate Layout (if different than PCB)
//     (extra_data = component_type)
base_plate_layout = [];

// Whether to only use base_plate_layout to generate the plate footprint
use_plate_layout_only = false;

// Standoff layout
//     (extra_data = [standoff_integration_override, standoff_attachment_override])
base_standoff_layout = [
//    [[[1.5,0.125]]],
//    [[[1.5,3]]],
//    [[[3.5,1.5]]],
//    [[[4.07,3.3]]],
//    [[[4.5,0.25]]],
//    [[[5.1,4.45],1.5,[60,4.875,4.625]], [0,0,0,0]],
//    // PCB-Backplate standoffs
//    [[[0.5,-0.2+.05*mm]],[0,0,0,0],["plate", "backplate"]],
//    [[[0.5,3]],[0,0,0,0],["plate", "backplate"]],
//    [[[3.5,3.75]],[0,0,0,0],["plate", "backplate"]],
//    [[[3,-0.53125]],[0,0,0,0],["plate", "backplate"]],
//    [[[4.5,5.5],1.5,[60,4.875,4.625]],[0,0,0,0],["plate", "backplate"]],
//    [[[6.6,3]],[0,0,0,0],["plate", "backplate"]],
//    [[[5.6,-0.1875]],[0,0,0,0],["plate", "backplate"]],
//    [[[7.125,0]],[0,0,0,0],["plate", "backplate"]],
];

// EC11 Position(s)
base_ec11_layout = [
    ];

// EVQWGD001 Position(s)
base_evqwgd001_layout = [
];

//Microswitch (Reset button)
base_microswitch_layout = [];

// Whether to flip the layout
invert_layout_flag = false;

// Whether the layout is staggered-row or staggered-column
layout_type = "column";  // [column, row]

//https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Transformations#color
//Color: Red,Orange,Yellow,Green,Blue,Indigo,Purple


base_pcb_layout_outer=[
//hull all group
];

base_pcb_layout_outer2=[
//hull all group
];

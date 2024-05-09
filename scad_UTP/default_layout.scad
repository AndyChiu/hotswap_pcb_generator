include <parameters.scad>
include <stabilizer_spacing.scad>

/* kle_filename: default_layout.scad */


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
        extra_data,                            // Extra data (depending on component type)
    ]
*/

/*   Keyswitch Layout
     (extra_data = [
                        rotate_column, 
                        switch_type,
                        [switch angle and height data]
                        keycap legend,
                   ]
                   
     [switch angle and height data] = srp,rx,ry,h,w
     
     srp(switch rotation position): LU,L,LD,U,N,D,RU,R,RD
                                    LU=Left-Up, RD=Right-Down, N=none,..etc.
     rx(X-axis angle): default 0
     ry(Y-axis angle): default 0
     h(Increase height): default 0
     w{wall thickness}: default 1
     bx((X-axis Base size): default h_unit
     by((y-axis Base size): default v_unit

*/
base_switch_layout = [
    [[[0,0.125],1,[0,0,0]],[0,1,0,2],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[0,1.125],1,[0,0,0]],[1,1,0,1],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[0,2.125],1,[0,0,0]],[1,1,0,1],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[0,3.125],1,[0,0,0]],[1,0,0,0],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[1,0],1,[0,0,0]],[0,1,0,0],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[1,1],1,[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[1,2],1,[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[1,3],1,[0,0,0]],[1,0,2,2],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[2,0.125],1,[0,0,0]],[0,1,2,2],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[2,1.125],1,[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[2,2.125],1,[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[2,3.125],1,[0,0,0]],[1,0,0,0],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[3,0],1,[0,0,0]],[0,1,0,0],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[3,1],1,[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[3,2],1,[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[3,3],1,[0,0,0]],[1,0,2,2],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[4,0.125],1,[0,0,0]],[0,1,2,0],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[4,1.125],1,[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[4,2.125],1,[0,0,0]],[1,1,1,0],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[4,3.125],1,[0,0,0]],[1,0,0,0],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[5,0.25],1,[0,0,0]],[0,1,2,0],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[5,1.25],1,[0,0,0]],[1,1,2,0],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[5,2.25],1,[0,0,0]],[1,1+15*mm,2,0],[false,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[4.875,4.625],1.5,[60,4.875,4.625]],[30*mm,1,0.25*unit*mm,17.11*mm],[true,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
    [[[4.875,5.625],1.5,[60,4.875,4.625]],[1,0,0.25*unit*mm,17.11*mm],[true,switch_type,["N",0,0,0,1,h_unit,v_unit],""]],
];

// MCU Position(s)
base_mcu_layout = [
    [[[6,0.5],mcu_h_unit_size],[0,0,h_border_width,0]],
];

// TRRS Position(s)
base_trrs_layout = [
    [[[6.5,2.5],1,[-90,7,3]],[0,h_unit/2+h_border_width,0,5.97]],
];

// Stabilizer layout
//     (extra_data = [key_size, left_offset, right_offset, switch_offset=0])
//     (see stabilizer_spacing.scad for presets)
base_stab_layout = [];

// Via layout
//     (extra_data = [via_width, via_length])
base_via_layout = [
    [[[5.5,3]]]
];

// Plate Layout (if different than PCB)
//     (extra_data = component_type)
base_plate_layout = [
//    concat(
//        slice(base_switch_layout, [0,-2], ["switch"]),
//        [[[[6,0.5],mcu_h_unit_size],[-2,0,h_border_width,0], ["mcu"]]],
//        slice(base_trrs_layout, [0,0], ["trrs"])
//    ),
//    slice(base_switch_layout, [-2,0], ["switch"])
];

// Whether to only use base_plate_layout to generate the plate footprint
use_plate_layout_only = false;

// Standoff layout
//     (extra_data = [standoff_integration_override, standoff_attachment_override])
base_standoff_layout = [
    // PCB-Plate standoffs
    [[[0.5,0.125]]],
    [[[0.5,3]]],
    [[[2.5,1.5]]],
    [[[3.5,3]]],
    [[[4.5,0.25]]],
    [[[4.875,5.125],1.5,[60,4.875,4.625]], [0,0,0,0]],
    [[[6,2.5]]],
    // PCB-Backplate standoffs
    [[[-0.5,-0.375]],[0,0,0,0],["plate", "backplate"]],
    [[[-0.5,3.625]],[0,0,0,0],["plate", "backplate"]],
    [[[4,3.625]],[0,0,0,0],["plate", "backplate"]],
    [[[4.125,6.125],1.5,[60,4.875,4.625]],[0,0,0,0],["plate", "backplate"]],
    [[[6.5,3]],[0,0,0,0],["plate", "backplate"]],
    [[[5.5,-0.1875]],[0,0,0,0],["plate", "backplate"]],
    [[[7,0]],[0,0,0,0],["plate", "backplate"]],
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



/* 
   ====================================================   
   == PCB keyboardization design /PCB 鍵盤化設計 ========
   ====================================================   
*/   

/* Unit size setting / 軸體大小設定

    When designing the PCB keyboardization, what unit_size, h_unit_size 
    and v_unit_size value used. If the <parameters.scad> 
    unit size changes, it can be automatically scaled accordingly.

    PCB 鍵盤化設計時，使用的軸體大小(unit_size, h_unit_size, v_unit_size)
    如<parameters.scad>軸體大小設定有變更時時，讓設計可以跟著縮放
*/
base_pcb_layout_unit_size= 18;
base_pcb_layout_h_unit_size= 18;
base_pcb_layout_v_unit_size= 17;

/* Color marking / 顏色標記

   The location can be marked to make it easier to identify the location during design.
   可以標記位置，讓設計時，較為容易辨識位置
   
    For color codes, please refer to the following link:
    顏色代碼可以參考以下連結:
    https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Transformations#color

    Common colors:
    常用顏色:
    
    Red,Orange,Yellow,Green,Blue,Indigo,Purple
    Pink,Coral,LightYellow,LightGreen,LightBlue,SlateBlue,Violet

*/

base_pcb_layout_outer=[
/* PCB layout outer / PCB板外框位置
    Hull all location by group
    [
    [[x_location, y_location,z_location],circle size,"Color code","Index text"],
    [[x_location, y_location,z_location],circle size,"Color code","Index text"],
    ],
    [
    [[x_location, y_location,z_location],circle size,"Color code","Index text"],
    [[x_location, y_location,z_location],circle size,"Color code","Index text"],
    ],
*/

];

//PCB edge frame setting 
//PCB 邊緣框設定
base_pcb_layout_outer_EdgeFrame_size_x = 8;
base_pcb_layout_outer_EdgeFrame_size_y = 4;
base_pcb_layout_outer_EdgeFrame_hight = 5;

base_pcb_layout_Rubber_Pads=[
/* Concave surface for self-adhesive rubber pads
   圓形自黏膠墊凹槽
    [[location],[cylinder],"Color","Text"],
    =[[ x, y, z ],[diameter,height],"Color code","Index text"],        
*/
];

base_pcb_layout_IDC_Hole=[
/* IDC interface opening and dig deep
   IDC 接口 開口與挖深主板 
    [[location],[rotate],[cube],"Color"],
    =[[ x, y, z ],[r_x, r_y, r_x],[c_x, c_y, c_z],"Color code"],
*/
];

base_pcb_layout_IDC=[
/* IDC interface location / IDC 放置位置
    [[translate],[rotate],[cube],"Color"],
    =[[ x, y, z ],[r_x, r_y, r_x],"Show Color"],
*/
];

base_pcb_layout_Raised_Text=[
/* Write raised text content on the PCB board / 在PCB板上寫上凸起文字內容
    [[location],[rotate],linear_extrude_size,[text_value,text_font,text_size]]
    =[[x, y, z],[r_x, r_y, r_z],LE_size,[text,font,size],"Show Color"]
*/
];

base_pcb_layout_Indented_Text=[
/* Write recessed text content on the PCB board / 在PCB板上寫上內凹文字內容   
    [[location],[rotate],linear_extrude_size,[text_value,text_font,text_size]]
    =[[x, y, z],[r_x, r_y, r_z],LE_size,[text,font,size],"Show Color"]
*/
];


/*
    The dimensions of the virtual key switch and keycaps are used to check whether they interfere with each other key.
    虛擬軸體與鍵帽的尺寸，用來檢查是否會相互干擾
   
    Switch size 軸體尺寸 [x,y,z]
	
	Choc 14.9x14.9x5.5:
		VKeySwitch_Size=[14.9,14.9,5.5];
	MX 14x14x5.5:
		VKeySwitch_Size=[14.9,14.9,5.5];

	Keycaps size 鍵帽尺寸 [x,y,z]
	
	Choc 16.4x15.5x5.2:
		VKeycap_Size=[16.4,15.5,5.2];
	Choc 16.7x16.7x5.2:
		VKeycap_Size=[16.7,16.7,5.2];

	MX 18x18x8:
		VKeycap_Size=[18,18,8];
*/

//Switch size 軸體尺寸
VKeySwitch_Size=[14.9,14.9,5.5];

//Keycaps size 鍵帽尺寸
VKeycap_Size=[16.4,15.5,5.2];

//Keycaps color and alpha 鍵帽顏色與透明度
VKeycap_Color="DarkKhaki";
VKeycap_Alpha =0.8;

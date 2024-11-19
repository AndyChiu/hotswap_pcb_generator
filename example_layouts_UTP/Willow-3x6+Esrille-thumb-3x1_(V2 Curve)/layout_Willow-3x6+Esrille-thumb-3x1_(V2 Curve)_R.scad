include <parameters.scad>
include <stabilizer_spacing.scad>

/* Willow-3x6+Esrille-thumb-3x1_(V2 Curve)_R

    Main layout modified from willow layout:
    
        https://github.com/hanachi-ap/willow64-doc
        Willow Layout CC BY-SA 4.0 by Hanachi.

    Thumb layout inspired by NISSE keyboard:
        https://www.esrille.com/keyboard/layouts.en-us.html
        Esrille Inc.
   
    Need to confirm the following settings:
        <parameters.scad>
        switch_type = "choc";
        unit = 18;
        h_unit = 18;
        v_unit = 17;
  
*/

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
                                    LU=Left-Up, RD=Right-Down,N=none,..etc.
     rx(X-axis angle): default 0
     ry(Y-axis angle): default 0
     h(Increase height): default 0
     w{wall thickness}: default 1
     bx((X-axis Base size): default h_unit
     by((y-axis Base size): default v_unit

*/

base_switch_layout = [
  [//Fn6
[[0.0353,5.4549],1,[43.16,0.5353,5.9549]],[0,0,0,0],[false,"choc_holder",["RU",7,7,0,1,h_unit,v_unit,"C"],"Fn6"]],
  [//Fn5
[[0.8951,4.7845],1,[32.31,1.3951,5.2845]],[0,0,0,0],[false,"choc_holder",["RU",10,10,1.5,1,h_unit,v_unit,"C"],"Fn5"]],
  [//Fn4
[[1.8736,4.2937],1,[21.41,2.3736,4.7937]],[0,0,0,0],[false,"choc_holder",["RU",15,15,3,1,h_unit,v_unit,"C"],"Fn4"]],

  [//Y
[[0.6954,1.3325],1,[6,1.1954,1.8325]],[0,0,0,0],[false,"choc_holder",["LU",10,10,3,1,h_unit,v_unit,"C"],"Y"]],
  [//H
[[0.865,2.3824],1,[13.5,1.365,2.8824]],[0,0,0,0],[false,"choc_holder",["L",0,10,3,1,h_unit,v_unit,"C"],"H"]],
  [//N
[[1.1626,3.4066],1,[20.6,1.6626,3.9066]],[0,0,0,0],[false,"choc_holder",["LD",5,10,3,1,h_unit,v_unit,"C"],"N"]],

  [//U
[[1.6707,0.9304],1,[5.1,2.1707,1.4304]],[0,0,0,0],[false,"choc_holder",["LU",9,9,2,1,h_unit,v_unit,"C"],"U"]], 
  [//J
[[1.8224,1.9740],1,[11.5,2.3224,2.474]],[0,0,0,0],[false,"choc_holder",["L",0,9,2,1,h_unit,v_unit,"C"],"J"]],
  [//M
[[2.097,2.9997],1,[19,2.597,3.4997]],[0,0,0,0],[false,"choc_holder",["LD",5,9,2,1,h_unit,v_unit,"C"],"M"]],

  [//I
[[2.6602,0.5],1,[4.5,3.1602,1]],[0,0,0,0],[false,"choc_holder",["LU",8,8,1,1,h_unit,v_unit,"C"],"I"]],
  [//K
[[2.7689,1.5378],1,[9.9,3.2689,2.0378]],[0,0,0,0],[false,"choc_holder",["L",0,8,1,1,h_unit,v_unit,"C"],"K"]],
  [//,
[[3.0209,2.5756],1,[18.1,3.5209,3.0756]],[0,0,0,0],[false,"choc_holder",["LD",5,8,1,1,h_unit,v_unit,"C"],","]],

  [//O
[[3.6802,0.7199],1,[5.9,4.1802,1.2199]],[0,0,0,0],[false,"choc_holder",["LU",7,7,0.5,1,h_unit,v_unit,"C"],"O"]],
  [//L
[[3.8524,1.7688],1,[13.2,4.3524,2.2688]],[0,0,0,0],[false,"choc_holder",["L",0,7,0.5,1,h_unit,v_unit,"C"],"L"]],
  [//.
[[4.1736,2.7898],1,[21.5,4.6736,3.2898]],[0,0,0,0],[false,"choc_holder",["LD",5,7,0.5,1,h_unit,v_unit,"C"],"."]],

  [//P
[[4.7857,1.1872],1,[10,5.2857,1.6872]],[0,0,0,0],[false,"choc_holder",["LU",6,6,0,1,h_unit,v_unit,"C"],"P"]],
  [//;
[[5.0569,2.2281],1,[19,5.5569,2.7281]],[0,0,0,0],[false,"choc_holder",["L",0,6,0,1,h_unit,v_unit,"C"],";"]],
  [///
[[5.4657,3.1972],1,[24.9,5.9657,3.6972]],[0,0,0,0],[false,"choc_holder",["LD",5,6,0,1,h_unit,v_unit,"C"],"/"]],
];

// MCU Position(s)
base_mcu_layout = [
[[[-1,2],mcu_h_unit_size,[10,-1,2]],[1,1,1,5*mm]],
];

// TRRS Position(s)
base_trrs_layout = [];

/*  Stabilizer layout
     (extra_data = [key_size, left_offset, right_offset, switch_offset=0])
     (see stabilizer_spacing.scad for presets) */
base_stab_layout = [];

// Via layout
//     (extra_data = [via_width, via_length])
base_via_layout = [];

// Plate Layout (if different than PCB)
//     (extra_data = component_type)
base_plate_layout = [
    concat(
        slice(base_switch_layout, [0,-2], ["switch"]),
        [[[[-1,2],mcu_h_unit_size],[-2,0,h_border_width,0], ["mcu"]]] //,
//        slice(base_trrs_layout, [0,0], ["trrs"])
    ),
    slice(base_switch_layout, [-2,0], ["switch"])

];

// Whether to only use base_plate_layout to generate the plate footprint
use_plate_layout_only = true;

// Standoff layout
//     (extra_data = [standoff_integration_override, standoff_attachment_override])
base_standoff_layout = [];

// EC11 Position(s)
base_ec11_layout = [];

// EVQWGD001 Position(s)
base_evqwgd001_layout = [];

//Microswitch (Reset button)
base_microswitch_layout = [];

// Whether to flip the layout
invert_layout_flag = false;

// Whether the layout is staggered-row or staggered-column
layout_type = "column";  // [column, row]


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

[
[[ 48.17, -8.67, 0 ],2,"Green","A1"],
[[ 64.28, -7.67, 0 ],2,"Green","A2"],
[[ 21.11, -30.03, 0 ],12,"Green","A3"],
[[ -13.33, -35.39, 0 ],6,"Green","A4"],
[[ 8.59, -103.39, 0 ],15,"Green","A5"],
[[ 28.36, -93.12, 0 ],10,"Green","A6"],
],

[
[[ 28.36, -93.12, 0 ],10,"Orange","B1"],
[[ 47.51, -82.81, 0 ],15,"Orange","B2"],
],
[
[[ 64.28, -7.67, 0 ],2,"Indigo","C1"],
[[ 59.51, -25.65, 0 ],2,"Indigo","C2"],
[[ 100.74-2, -20.63, 0 ],8,"Indigo","C3"],
],
[
[[ 100.74-2, -20.63, 0 ],8,"Yellow","D1"],
[[ 105.66-2, -39.87, 0 ],8,"Yellow","D2"],
],
[
[[ 105.66-2, -39.87, 0 ],8,"Blue","E1"],
[[ 110.13, -53.73, 0 ],8,"Blue","E2"],
],
[
[[ 110.13, -53.73, 0 ],8,"Purple","F1"],
[[ 108.34, -64.92, 0 ],15,"Purple","F2"],
[[ 80.61, -64.02, 0 ],10,"Purple","F3"],
],

[
[[ 73.02, -64.66, 0 ],2,"Pink","G1"],
[[ 42.58, -26.12, 0 ],2,"Pink","G2"],
[[ 108.44, -52.05, 0 ],2,"Pink","G3"],
[[ 98.83, -24.90, 0 ],2,"Pink","G4"],
[[ 42.97, -70.89, 0 ],2,"Pink","G5"],
],

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

[[48.32-5,-9.96-2,-2],[10.5,1],"Red","1"],
[[104.5,-18.5,-2],[10.5,1],"Red","2"],
[[117.9,-72.7,-2],[10.5,1],"Red","3"],
[[64.18,-65.28,-2],[10.5,1],"Red","4"],
[[55.43+1,-89.51-1,-2],[10.5,1],"Red","5"],
[[3.71,-114.2,-2],[10.5,1],"Red","6"],
[[-14.92-2,-33.4-1,-2],[10.5,1],"Red","7"],
[[-2.45+1,-48.8,-2],[10.5,1],"Red","8"],
//[[-2.6,-78.35 ,-2],[10.5,1],"Green","9"],
//[[35.65,-56.10,-2],[10.5,1],"Green","10"],
//[[88.58,-46.08,-2],[10.5,1],"Green","11"],

];

base_pcb_layout_IDC_Hole=[
/* IDC interface opening and dig deep
   IDC 接口 開口與挖深主板 
    [[location],[rotate],[cube],"Color"],
    =[[ x, y, z ],[r_x, r_y, r_x],[c_x, c_y, c_z],"Color code"],
*/
[[-14.5-0.5-2.2,-71-0.5,-2.01],[0,0,-90+11],[18,27.5,6],"red"],
];

base_pcb_layout_IDC=[
/* IDC interface location / IDC 放置位置
    [[translate],[rotate],[cube],"Color"],
    =[[ x, y, z ],[r_x, r_y, r_x],"Show Color"],
*/
[[-14.5-2.2 ,-71,-2],[0,0,-90+11],"Orange"],
];

base_pcb_layout_Raised_Text=[
/* Write raised text content on the PCB board / 在PCB板上寫上凸起文字內容
    [[location],[rotate],linear_extrude_size,[text_value,text_font,text_size]]
    =[[x, y, z],[r_x, r_y, r_z],LE_size,[text,font,size],"Show Color"]
*/
[[80, -73, -1],[0,0,-11],1.5,["Designed by Andy Chiu","Bauhaus 93",2],"Blue"],
];

base_pcb_layout_Indented_Text=[
/* Write recessed text content on the PCB board / 在PCB板上寫上內凹文字內容   
    [[location],[rotate],linear_extrude_size,[text_value,text_font,text_size]]
    =[[x, y, z],[r_x, r_y, r_z],LE_size,[text,font,size],"Show Color"]
*/
[[87-2, -15+1, -0.5],[0,0,-11],0.6,["W36 V2","Bauhaus 93",3],"Blue"],
[[87-2, -15-4.3+1.5, -0.5],[0,0,-11],0.6,["Curve","Bauhaus 93",3],"Blue"],
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


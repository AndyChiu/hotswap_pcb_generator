include <parameters.scad>
include <stabilizer_spacing.scad>

/* kle_filename: default_layout.scad */


/* [Layout Values] */
/* Layout Format (each key):
    [
        [                                       // Location Data
            [x_location, y_location],
            [key_size_width, key_size_height],
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
                        keycap type
                   ]
                   
     [switch angle and height data] = srp,rx,ry,h,w,bx,by,bod,offset_x,offset_y
     
     srp(switch rotation position 軸翻轉位置): LU,L,LD,U,N,D,RU,R,RD
                                    LU=Left-Up, RD=Right-Down,N=none,..etc.
     rx(X-axis angle): default 0
     ry(Y-axis angle): default 0
     h(Increase height): default 0
     w{wall thickness}: default 1
     bx((X-axis Base size): default 2
     by((y-axis Base size): default 2

     bod(Base Offset direction 基底偏移方向): C,U,D,L,R,LU,LD,RU,RD
                                 C=Center, LU=Left-Up, RD=Right-Down,..etc.
     offset_x(3D-shaped): default 0
     offset_y(3D-shaped): default 0
     
     keycap type: Please refer to parameters_keycaps.scad
*/
base_switch_layout = [

    [[[0,0.125],[1,1],[0,0,0]],[0,1,0,2],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[0,1.125],[1,1],[0,0,0]],[1,1,0,1],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[0,2.125],[1,1],[0,0,0]],[1,1,0,1],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[0,3.125],[1,1],[0,0,0]],[1,0,0,0],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[1,0],[1,1],[0,0,0]],[0,1,0,0],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[1,1],[1,1],[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[1,2],[1,1],[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[1,3],[1,1],[0,0,0]],[1,0,2,2],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[2,0.125],[1,1],[0,0,0]],[0,1,2,2],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[2,1.125],[1,1],[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[2,2.125],[1,1],[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[2,3.125],[1,1],[0,0,0]],[1,0,0,0],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[3,0],[1,1],[0,0,0]],[0,1,0,0],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[3,1],[1,1],[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[3,2],[1,1],[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[3,3],[1,1],[0,0,0]],[1,0,2,2],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[4,0.125],[1,1],[0,0,0]],[0,1,2,0],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[4,1.125],[1,1],[0,0,0]],[1,1,1,1],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[4,2.125],[1,1],[0,0,0]],[1,1,1,0],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[4,3.125],[1,1],[0,0,0]],[1,0,0,0],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[5,0.25],[1,1],[0,0,0]],[0,1,2,0],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[5,1.25],[1,1],[0,0,0]],[1,1,2,0],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[5,2.25],[1,1],[0,0,0]],[1,1+15*mm,2,0],[false,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1U]],
    [[[4.875,4.625],[1.5,1],[60,4.875,4.625]],[30*mm,1,0.25*unit*mm,17.11*mm],[true,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1_5U]],
    [[[4.875,5.625],[1.5,1],[60,4.875,4.625]],[1,0,0.25*unit*mm,17.11*mm],[true,switch_type,["N",0,0,0,1,2,2,"C",0,0],"",kc_LP_1_5U]],

];

// MCU Position(s)
base_mcu_layout = [
    [[[6,0.5],[mcu_h_unit_size,mcu_v_unit_size],[0,0,0]],[1,10,h_border_width,1]],
];

// TRRS Position(s)
base_trrs_layout = [
    [[[6.5,2.5],[1,1],[-90,7,3]],[0,h_unit/2+h_border_width,0,5.97]],
];

// Stabilizer layout
//     (extra_data = [key_size, left_offset, right_offset, switch_offset=0])
//     (see stabilizer_spacing.scad for presets)
base_stab_layout = [];

// Via layout
//     (extra_data = [via_width, via_length])
base_via_layout = [
    [[[5.5,3],[1,1]]],
];

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
base_evqwgd001_layout = [];

//Microswitch (Reset button)
base_microswitch_layout = [];

// Whether to flip the layout
invert_layout_flag = false;

// Whether the layout is staggered-row or staggered-column
layout_type = "column";  // [column, row]


/* 
   ======================================================
   == PCB keyboardization design /PCB 鍵盤化設計 ========
   ======================================================
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

base_pcb_layout_Cable_Hole=[
/* The interconnecting holes of the raised shaft seat of the PCB board can be used to process the circuit through the bottom through-hole
   挖PCB板的凸起軸座的互通孔道，可用於將線路由底部穿孔的方式處理
    [[location],[rotate],[cube],"Color"],
    [[translate],[rotate],"'color",[cylinder_h,cylinder_r],"text"],
    =[[ x, y, z ],[r_x, r_y, r_x],"Color code",[c_h, c_r],"text],
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

*/

//Switch size 軸體尺寸
//ref: parameters_switchs.scad
VKeySwitch_Size=[KeySwitch[0],KeySwitch[1]];

//Keycaps size 鍵帽尺寸
//ref: parameters_keycaps.scad
VKeycap_Size=kcs_choc_v1;

//Keycaps color and alpha 鍵帽顏色與透明度
VKeycap_Color="DarkKhaki";
VKeycap_Alpha =0.8;

//OLED 相關設定

oled_config = [
/*
    OLED mount configuration settings
    OLED座組態設定
    可以設定多組用於多螢幕情境
*/
 [ // config 0

    //OLED base height
    //基座整體高度
    //oled_base_height=
    10-pcb_thickness,
    
    //OLED Standoff 支撐柱
    //支架高度
    //oled_Standoff_height=
    10-pcb_thickness+2.7,
    
    //OLED Standoff Size (SS) [width1,depth1,height1,width2,depth2]
    //OLED支柱尺寸1(SS方形設定) [第一層長,第一層寬,第一層高度,第二層長,第二層寬]
    //OLED_Standoff_Size_SS=
    [4,4,4,10,10],
    
    //OLED Standoff Size (CS) [width1,width2,height,width3]
    //OLED支柱尺寸2(CS圓柱形設定) [第一層頂部直徑,第一層底部直徑,第一層高度,第二層底部直徑]
    //OLED_Standoff_Size_CS=
    [4,5,3,10],

    //OLED Standoff Base Offset [x,y,z]
    //OLED 支架底部偏移值 [x,y,z]
    //支架如果因傾斜角度拉大而高度變高，z值也要跟著調整
    //OLED_Standoff_Base_Offset_
    // (LU, RU,
    // ,LD, RD)=
    [-6,6,15], [ 6,6,15],
    [ 0,0,10], [ 0,0,10],

    //Pilot_Hole_Size
    //螺絲孔尺寸
    //OLED_Pilot_Hole_Size=[Diameter,Depth]=
    [1.7, 3],
    
    //OLED Standoff type
    //支撐類型 "none","CS","SS"
    //base_pcb_layout_OLED_Standoff_Type=
    "CS",
 ],

];

// OLED Position(s)
//extra_data = [OLED Type,[OLED_Cfg],[RX,RY,RZ],"Color"]
base_OLED_layout = [

];


//Keycap List
//鍵帽清單
include <parameters_keycaps.scad>

//Switch List
//軸體清單
include <parameters_switchs.scad>


/* PCB Parameters */
// Diameter of row/column wire channels
wire_diameter = 1;//0.91;
// Upward angle of switch pin in contact with diode anode (gives more reliable
// connections but slightly deforms pin)
diode_pin_angle = 5;  // [0:15]
// Amount the diode folds over
diode_foldover = 4;
// Overall thickness of PCB
pcb_thickness = 4;  // [4:0.1:10]

/* Switch Parameters */
// Switch type
// [mx, choc, chocV2, chocMini, ks27, ks33v3, mx_low, romer_g, redragon_low, alps]
// [choc_holder, chocV2_1u, mx_holder, mx_s_holder, mx_s_holder2, ks27_holder, ks33v3_holder, redragon_low_holder, alps_holder]
switch_type = "ks27_holder";

//Andy Add:

KeySwitch=
    switch_type == "choc" || switch_type == "choc_holder"
        ? ks_choc
    : switch_type == "chocV2" || switch_type == "chocV2_1u"
        ? ks_chocV2
    : switch_type == "chocMini"
        ? ks_chocMini
    : switch_type == "ks27" || switch_type == "ks27_holder"
        ? ks_ks27
    : switch_type == "ks33v3" || switch_type == "ks33v3_holder"
        ? ks_ks33v3
    : switch_type == "mx_low"
        ? ks_mx_low
    : switch_type == "redragon_low" || switch_type == "redragon_low_holder"
        ? ks_redragon_low
    : switch_type == "romer_g"
        ? ks_romer_g
    : switch_type == "alps" || switch_type == "alps_holder"
        ? ks_alps
        //Other allocations to MX
    : ks_mx;
    
    
// Switch orientation (based on LED location)
switch_orientation = "north";  // [north, south]
// Whether to use experimental diode leg contact
use_folded_contact = false;

// Andy Add:
// disable if usa use_folded_contact
// disable if wire_diameter > 1 (Only for UTP cable)
utp_wire = true;
led_hole = true;
diode_less = false;
choc_v1_compatible_v2  = true;
choc_v2_compatible_v1  = false;
both_deep_channels = true;
choc_row_hole = false;
choc_col_hole = false;


/* Stabilizer Parameters */
stabilizer_type = "pcb";  // [pcb, plate]


/* Case Parameters */
// Type of case to generate
case_type = "sandwich";  // [sandwich, plate_case, backplate_case]
// Thickness of case walls
case_wall_thickness = 2;
// Case wall draft angle
case_wall_draft_angle = 15;
// Width of the case chamfer (convex cases only)
case_chamfer_width = 1;
// Angle of the case chamfer (convex cases only)
case_chamfer_angle = 45;
// Height of the vertical portion at the bottom of the case 
// (not including backplate flange)
case_base_height = 2;
// Fit tolerance between interlocking case parts
case_fit_tolerance = 0.2;
// Tenting angle around x-axis
tent_angle_x = 0;
// Tenting angle around y-axis (i.e. typing angle)
tent_angle_y = 0;
// Point around which keyboard is tented
tent_point = [0,0];
//tent_point = [0,0];


/* Plate Parameters */
// Distance the plate sticks out past the PCB
plate_margin = 5;
// Radius of outer fillets
plate_outer_fillet = 2.5;
// Radius of inner fillets
plate_inner_fillet = 50;
// Setting this lower can help fix geometry issues when using custom plate shapes
// (i.e. two components that don't meet at exactly the same point can cause offset issues)
plate_precision = 1/100;


/* Backplate Parameters */
// Thickness of the backplate
backplate_thickness = 2;
// Thickness of flange around backplate if using an integrated-plate case
backplate_case_flange = 1;
// Spacing between the bottom of the PCB and the top of the backplate
pcb_backplate_spacing = 4;


/* MCU Parameters */
// [ProMicro, ProMicro_C, Elite_C,RP2040_Pico, RP2040_Zero]
//include <parameters_mcu_ProMicro.scad>
//include <parameters_mcu_ProMicro_C.scad>
//include <parameters_mcu_Elite_C.scad>
//include <parameters_mcu_RP2040_Pico.scad>
include <parameters_mcu_RP2040_Zero.scad>

mcu_type = "socketed3";  // [bare, socketed, socketed2, socketed3]

/* TRRS Socket Parameters */
// [RP2040_Pico, RP2040_Zero]
include <parameters_trrs_pj320a.scad>
//include <parameters_trrs_pj324m.scad>

/* Via Parameters */
via_width = 5;
via_length = 15;
via_shape = [via_width, via_length];


/* Standoff Parameters */
// Component the standoff is integrated with
standoff_integration_default = "plate";  // [plate, backplate, pcb, separate, none]
// Component the standoff is screwed to
standoff_attachment_default = "pcb";  // [plate, backplate, pcb, plate_backplate, none]
// Intermediate shape variable to pass around
standoff_config_default = [
    standoff_integration_default,
    standoff_attachment_default
];
// Diameter of integrated standoffs
standoff_diameter = 4.5;
// Diameter of standoff clearance hole
standoff_clearance_hole_diameter = 2.5;
// Diameter of standoff pilot hole
standoff_pilot_hole_diameter = 1.6;
// Diameter of standoff screw head counterbores
standoff_counterbore_diameter = 4.5;


/* Misc Parameters */
// Increase this if your standoffs are a bit too long due to printing tolerances
fit_tolerance = 0;
// Resolution of holes (affects render times)
$fn=12;


/* Advanced Parameters (related to switch size) */
// Switch spacing distance (19.05mm for MX keycaps,18mm for choc, 16mm for choc minimum spacing distance.)
unit = 19.05;
// Horizontal unit size (18mm for choc keycaps)
h_unit = 19.05;
// Vertical unit size (17mm for choc keycaps)
v_unit = 19.05;

//Andy add:
//unit size for stabilizer
unit_stb = 19.05;
h_unit_stb = 19.05;
v_unit_stb = 19.05;

unit_choc = 18;
h_unit_choc = 18;
v_unit_choc = 17;

choc_socket_size=ks_fraly[2][0];
fraly_socket_size=ks_fraly[2][0];

unit_ks27 = 18;
h_unit_ks27 = 18;
v_unit_ks27 = 17;

unit_redragon_low = 18;
h_unit_redragon_low = 18;
v_unit_redragon_low = 17;

ks27_socket_size=ks_ks27[2][0];

alps_socket_size=ks_alps[2][0];
alps_socket_size_w=16.4;
alps_socket_size_d=13.6-0.6;

redragon_low_socket_size=ks_redragon_low[2][0];
redragon_low_socket_size_w=14.5;
redragon_low_socket_size_d=13.8;

// Spacing of grid for MX pins
grid = 1.27;
// Size of socket body
socket_size =KeySwitch[2][0];

// Depth of the socket holes
socket_depth = 3.5;
// Thickness of the plate
plate_thickness =KeySwitch[2][1];

// Size of the plate cutout
plate_cutout_size =KeySwitch[2][2];

// Spacing between the top of the PCB and top of the plate
pcb_plate_spacing =KeySwitch[2][3];

// Align mcu to a unit
mcu_unit_resolution = .5;  // Grid size to snap to (as fractional unit)
mcu_h_unit_size = ceil(mcu_socket_width/mcu_unit_resolution/h_unit) * mcu_unit_resolution;
mcu_v_unit_size = ceil(mcu_socket_length/mcu_unit_resolution/v_unit) * mcu_unit_resolution;

// Total assembly thickness (for reference)
total_thickness =
    pcb_plate_spacing + pcb_thickness + pcb_backplate_spacing + backplate_thickness;

// Width of a border unit around the socket (for joining adjacent sockets)
border_width = (unit - socket_size)/2;
h_border_width = (h_unit - socket_size)/2;
v_border_width = (v_unit - socket_size)/2;

// Conversion factor from border width to mm (for use in layouts)
mm = 1/border_width;
h_mm = 1/h_border_width;
v_mm = 1/v_border_width;

// Andy Add:

total_travel=KeySwitch[2][4];

//Switch socket base
//軸座上的軸體扣夾
switch_socket_base_holder = false;

//扣夾是否支撐
switch_socket_base_holder_support_frame = false;

//TRRS
trrs_wire_channels_length = 16;
    
//Microswitch (reset button)
microswitch_hold_bar = false;
//    
//右側位移
iRSOffSet=0.2;
iRSOffSet2=iRSOffSet*h_unit_stb;


/* 
   ====================================================   
   == PCB keyboardization design /PCB 鍵盤化設計 ========
   ====================================================   
*/   


//Mark out PCB layout design points set, no hull the objects.
//將外圍設定的點標註出來,不產hull畫面: true, false, "DontShow"
base_pcb_layout_outer_DesignMode = false;
DesignMode_deep=0;

//What color should be displayed when the outer hull is surrounded
//外圍hull包圍起來時，要產生什麼顏色: "ColorName"(顏色名稱),"None"(不產生顏色),"Group"(群組第一個點的顏色)
base_pcb_layout_outer_hull_color = "None";

//Mark out the grooves of the circular self-adhesive rubber pad
//將圓形自黏膠墊凹槽標註出來
base_pcb_layout_Rubber_Pads_DesignMode = true;

//No cutout the switch socket hole, which can increase the view speed
//不挖軸坐上的洞，可以增加速檢視速度
base_pcb_layout_DesignMode = true;

//Draw an outer frame
//是否繪製外框: "Basic"(基本), "RoundedCorners"(圓角), false (不繪製)
base_pcb_layout_outer_EdgeFrame = "RoundedCorners";

//apply the setting of the Switch angle and height(3D-shaped)
//是否套用軸體角度與高度的設定(立體化)
base_pcb_layout_ApyAdjSwitchAngleAndHeight = true;

//Non-Border on 3D-shaped mode?
//立體化後是否不繪製軸的Borders？
base_pcb_layout_IfAdjSwitchAngleAndHeight_NoBorders =false;

//Raised Switch Base Style
//凸起的軸座樣式 "Basic"(基本), "RoundedCorners"(圓角)
base_pcb_layout_RaisedSwitchBaseStyle= "RoundedCorners";

//No increase in internal cavity
//不擴大突起軸座的內部空腔,值: true , false, "1U"
base_pcb_layout_NoIncreaseInInternalCavity=true;

//PCB board circuit hole
//PCB板開線路孔洞 ,值: true , false
base_pcb_layout_Use_Cable_Hole= true;

/* Preview mode */

//Show virtual KeySwitch in preview?
//預覽時是否顯示虛擬軸體?
base_pcb_layout_ShowVKeySwitch = true;

//Show virtual Keycaps in preview?
//預覽時是否顯示虛擬鍵帽?
base_pcb_layout_ShowVKeycap = true;

//Show keycap Legend text in preview?
//預覽時是否顯示軸座對應的按鍵文字?
base_pcb_layout_ShowKeycapLegend = true;

//keycap Legend text location height
//按鍵文字放置高度
base_pcb_layout_ShowKeycapLegend_H = 0;

//Show OLED PCB in preview?
//預覽時是否秀出OLED PCB版?
base_pcb_layout_Preview_Show_OLED = true;

//Show EC11 Knob in preview?
//預覽時是否秀出EC11編碼器旋鈕?
base_pcb_layout_Preview_Show_EC11_Knob = true;

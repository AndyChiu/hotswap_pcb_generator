//板子類型: 幾U、鍵帽尺寸、基座類型、左右手
//BasePlate_3U_11.3MM_LType_Right
//===========================

//左右手
//LR="L";
LR="R";

//M字與L字用基座
//差別在有階梯狀構造
ML="L";
//ML="L";

//===========================

//11.3mm 
//3U區 長
3U_W =
    ML == "L"
        ? 51*sc
    : ML == "M"
        ? 51*sc
    : assert(false, "LR is invalid");

//3U區 寬
3U_D=15.5;

//3U區 高
3U_H=8.2;

//===========================
//1U 鍵帽大小
//11.3mm 
unit = 16;
unit1 = 15;
unit2=unit+4.8;
unit3=unit/2+0;

//===右鏡射參數(不須修改)===============
iSW =
    LR == "L"
        ? 1
    : LR == "R"
        ? -1
    : assert(false, "LR is invalid");

//===拇指位置偏移=============
//11.3mm + L型
th_offset= iSW*-4.2;
th_offset2=iSW* -2;
oft1=1;
oft2=-1;

//===MCU====================
//mcu_pos_x_Offset=155.1;
//mcu_pos_y_Offset=-62;
//mcu_pos_r_Offset=-14.11;
mcu_pos_x_Offset=155.1-30;
mcu_pos_y_Offset=-62+14;
mcu_pos_r_Offset=-14.11;

//===IDC====================
idc_pos_x_Offset=(154-15)-4.4; //134.6
idc_pos_y_Offset=(-105.5+15)-16.5; //-87.1
idc_pos_r_Offset=-14.11+90;



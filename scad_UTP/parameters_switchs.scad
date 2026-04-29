/*
    The dimensions of the virtual key switch and keycaps are used to check whether they interfere with each other key.
    虛擬軸體與鍵帽的尺寸，用來檢查是否會相互干擾
    
    REF: https://github.com/keyboardio/keyswitch_documentation
    
    =============================
    Switch size 軸體尺寸/ Values ​​related to the Switch 與軸體有關數值

    socket_size: Size of socket body
    plate_thickness
    plate_cutout_size: Size of the plate cutout
    pcb_plate_spacing: Spacing between the top of the PCB and top of the plate
    total_travel
    
    [[Housing size],[Stems Mount size],[Other Values]]=
    [[Hx,Hy,Hz],[Sx,Sy,Sz],[
        socket_size,
        plate_thickness,
        plate_cutout_size,
        pcb_plate_spacing,
        total_travel]
        ]

    軸體 VKeySwitch_Size
    =============================
    PS: z值為PCB板到軸體頂端距離
    
    Choc V1 (PG1352) 15x15x(5+3)
    Choc V2 (PG1353) 15x15x(5.3+3.1)
    Choc Mini (PG1232) 14.5x13.5x(3.2+2.65)
    MX 15.6x15.6x(11.6+3.6)
    MX LOW 15x15x(5+3.6)
    Gateron KS-27 15x15x(5.85+2.75)
    Logitech ROMER-G 13.5x13.5x14.5
    Redragon low 13.5x13.5x(5.6+3.1)
    Tai-Hao APC_BSW_055WH 16.6x13.6x11.5+4.5
    
// [mx, choc, chocV2, chocMini, ks27, ks33v3, mx_low, romer_g, redragon_low]
// [choc_holder, chocV2_1u, mx_holder, mx_s_holder, mx_s_holder2, ks27_holder, ks33v3_holder]

*/

ks_mx=      [[15.6 ,15.6,11.6 ],[ 7   ,5.1, 3.6 ],[14, 1.5, 14.0, 5.0, 3.2]];
ks_choc=    [[15   ,15.0, 5   ],[10.2 ,4.5, 3   ],[15, 1.3, 13.8, 2.2, 3.0]];
ks_chocV2=  [[15   ,15.0, 5.3 ],[6.5  ,6.5, 3.1 ],[15, 1.3, 13.8, 2.2, 3.2]];
ks_chocMini=[[14.5 ,13.5, 3.2 ],[9.7  ,4.2, 2.65],[15, 1.3, 13.8, 2.2, 2.4]];
ks_ks27=    [[15   ,15  , 5.85],[9.5  ,6.5, 2.75],[15, 1.3, 13.8, 2.2, 2.5]];
ks_ks33v3=  [[15   ,15  , 5.85],[10   ,4  , 2.75],[15, 1.3, 13.8, 2.2, 3.0]];
ks_mx_low=  [[15   ,15  , 5   ],[6.5  ,6.5, 3.6 ],[15, 1.3, 13.8, 2.2, 3.0]];
ks_romer_g= [[15.4 ,15.4,10.7 ],[11.9 ,9.9, 3.8 ],[14, 1.5, 14.0, 5.0, 3.2]];
ks_redragon_low=[[15,15 ,5.6  ],[7    ,5.1, 3.1 ],[15, 1.3, 13.8, 2.2, 3.5]];
ks_alps=    [[16.6 ,13.8,11.7 ],[7.8  ,4.5, 4.3 ],[15, 1.3, 14.0, 5.0, 4.3]];

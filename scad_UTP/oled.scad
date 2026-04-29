include <parameters.scad>
include <utils.scad>

use <grid_patterns.scad>


module oled_socket(borders=[1,1,1,1], extra_data) {
    difference() {
        oled_socket_base(borders, extra_data);
        oled_socket_cutout(borders, extra_data);
    }
}

module oled_socket_cutout(borders=[1,1,1,1], extra_data)
{
    oled_spec =
            extra_data[0]=="0.96_27.3x27.8" 
            ? include <OLED_0.96_27.3x27.8.Spec.txt> 
          : extra_data[0]=="0.96_26x25.9" 
            ? include <OLED_0.96_26x25.9.Spec.txt>
          : extra_data[0]=="0.91_38x12"
            ? include <OLED_0.91_38x12.Spec.txt>
          : extra_data[0]=="0.49_15x15"
            ? include <OLED_0.49_15x15.Spec.txt>
          : assert(false, "OLED Type not supported");

    OLED_Roate=extra_data[2];

    OLED_Size=oled_spec[0][0];
    OLED_Pins=oled_spec[0][1];
    OLED_Pin_Plastic_H=oled_spec[0][2][0];
    OLED_Pin_Plastic_W=oled_spec[0][2][1];

    OLED_Hole_Distancia=oled_spec[0][3];
    OLED_Hole_Size=oled_spec[0][4];

    oled_config=extra_data[1];
    
    oled_base_height=oled_config[0];

    iLastRow =(0+0.5)*mcu_pin_pitch;
    //        echo ("Last Row:",iLastRow);

    pins_count =
        OLED_Pins == 4
            ? [-0.5:1.5]
        : OLED_Pins == 5
            ? [-2:2]
        : OLED_Pins == 6
            ? [-2.5:2.5]
        : OLED_Pins == 7
            ? [-3:3]
        : OLED_Pins == 8
            ? [-3.5:3.5]
        : assert(false, "OLED pin (pins_count) count not supported");
        
   //Socket
   //OLED_Size[0]/2,OLED_Size[1],0
    translate([0,0,0])
    {   
    difference()
    {
    rotate(OLED_Roate)
    union()
    {
    difference() {

        for (pin = pins_count) {

            translate([(pin)*mcu_pin_pitch,iLastRow,-10-0.01]) 
                cylinder(h=oled_base_height+10+0.02,d=wire_diameter*1.5);
            translate([-(pin)*mcu_pin_pitch,iLastRow,-10-0.01]) 
                cylinder(h=oled_base_height+10+0.02,d=wire_diameter*1.5);
            translate([
                    (pin)*mcu_pin_pitch,wire_diameter/2,
                    oled_base_height-wire_diameter/2
                ]) rotate([90,-180,0])
            cube([wire_diameter,wire_diameter+0.01,5+0.01],true);
            translate([
                    -(pin)*mcu_pin_pitch,wire_diameter/2,
                    oled_base_height-wire_diameter/2
                ]) rotate([90,0,0])
            cube([wire_diameter,wire_diameter+0.01,5+0.01],true);

            translate([
                    (pin)*mcu_pin_pitch,wire_diameter/2,
                    oled_base_height-wire_diameter/2-wire_diameter*2
                ]) rotate([90,-180,0])
            cube([wire_diameter,wire_diameter,5+0.01],true);
            translate([
                    -(pin)*mcu_pin_pitch,wire_diameter/2,
                    oled_base_height-wire_diameter/2-wire_diameter*2
                ]) rotate([90,0,0])
            cube([wire_diameter,wire_diameter,5+0.01],true);

        }

    }
           
    }
    }        
    }    
}



module oled_socket_base(borders=[1,1,1,1], extra_data)
{

    oled_spec =
        extra_data[0]=="0.96_27.3x27.8" 
        ? include <OLED_0.96_27.3x27.8.Spec.txt> 
      : extra_data[0]=="0.96_26x25.9" 
        ? include <OLED_0.96_26x25.9.Spec.txt>
      : extra_data[0]=="0.91_38x12"
        ? include <OLED_0.91_38x12.Spec.txt>
      : extra_data[0]=="0.49_15x15"
        ? include <OLED_0.49_15x15.Spec.txt>
      : assert(false, "OLED Type not supported");

    OLED_Roate=extra_data[2];
    
    OLED_Size=oled_spec[0][0];
    OLED_Pins=oled_spec[0][1];
    OLED_Pin_Plastic_H=oled_spec[0][2][0];
    OLED_Pin_Plastic_W=oled_spec[0][2][1];

    OLED_Hole_Distancia=oled_spec[0][3];
    OLED_Hole_Size=oled_spec[0][4];
    OLED_Translate_Offset=oled_spec[1];
    OLED_Standoff_Offset=oled_spec[2][0];
    base_pcb_layout_OLED_Standoff = oled_spec[2][1];

    base_pcb_layout_OLED_Holder = oled_spec[2][2];

    base_pcb_layout_OLED_Standoff_LU = oled_spec[2][1][0];
    base_pcb_layout_OLED_Standoff_LD= oled_spec[2][1][1];
    base_pcb_layout_OLED_Standoff_RU= oled_spec[2][1][2];
    base_pcb_layout_OLED_Standoff_RD= oled_spec[2][1][3];

    base_pcb_layout_OLED_Standoff_U= oled_spec[2][1][4];
    base_pcb_layout_OLED_Standoff_D= oled_spec[2][1][5];
    base_pcb_layout_OLED_Standoff_L= oled_spec[2][1][6];
    base_pcb_layout_OLED_Standoff_R= oled_spec[2][1][7];

    base_pcb_layout_OLED_Standoff_C= oled_spec[2][1][8];

    base_pcb_layout_OLED_Holder_U = oled_spec[2][2][0];
    base_pcb_layout_OLED_Holder_D = oled_spec[2][2][1];

    //echo ("extra_data[0]:",extra_data[0]);

    oled_config=extra_data[1];
    
    oled_base_height=oled_config[0];
    oled_Standoff_height=oled_config[1];
    OLED_Standoff_Size_SS=oled_config[2];
    OLED_Standoff_Size_CS=oled_config[3];
    OLED_Standoff_Base_Offset_LU=oled_config[4];
    OLED_Standoff_Base_Offset_RU=oled_config[5];
    OLED_Standoff_Base_Offset_LD=oled_config[6];
    OLED_Standoff_Base_Offset_RD=oled_config[7];
    OLED_Pilot_Hole_Size=oled_config[8];
    base_pcb_layout_OLED_Standoff_Type=oled_config[9];
            
//    oled_Standoff_height = oled_base_height+OLED_Pin_Plastic_H;

    //OLED位移位置
    OLED_Translate=[-OLED_Size[0]/2+OLED_Translate_Offset[0],
                     OLED_Translate_Offset[1],
                     oled_Standoff_height+OLED_Translate_Offset[2]];

    iLastRow =(0+0.5)*mcu_pin_pitch;
    //        echo ("Last Row:",iLastRow);

    pins_count =
        OLED_Pins == 4
            ? [-0.5:1.5]
        : OLED_Pins == 5
            ? [-2:2]
        : OLED_Pins == 6
            ? [-2.5:2.5]
        : OLED_Pins == 7
            ? [-3:3]
        : OLED_Pins == 8
            ? [-3.5:3.5]
        : assert(false, "OLED pin (pins_count) count not supported");
        
        
    //Socket
    //OLED_Size[0]/2
    //OLED_Size[0]+0.4)+(2),1.5
    OLED_Offset_x = base_pcb_layout_OLED_Holder_U==true || base_pcb_layout_OLED_Holder_D == true ?  1.5 : 0;
 
    OLED_Offset_y = base_pcb_layout_OLED_Holder_U==true  ?  -2.4 : 0;
    
    //OLED_Size[0]/2+OLED_Offset_x,OLED_Offset_y,0
    translate([0,0,0])
    {
    difference()
    {
    rotate(OLED_Roate)
    union()
    {
    difference() {
        union() {
            // Base
            translate([-(2.54*(OLED_Pins+1))/2,-2,-10]) 
                cube([2.54*(OLED_Pins+1),5,oled_base_height+10]);

            // Holder
            if (base_pcb_layout_OLED_Holder_U)  { 
            
                translate([-(OLED_Size[0]+0.4+1)/2, 
                            OLED_Size[1]-4+0.7, 
                            -20] +  OLED_Translate_Offset) 
                    cube([(OLED_Size[0]+0.4+1),5,oled_base_height+20+OLED_Pin_Plastic_H]);
                    
                translate([-(OLED_Size[0]+0.4+2)/2, 
                             OLED_Size[1]-0.5+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([(OLED_Size[0]+0.4+2),1.5,oled_base_height+20+6.5],rc_size=1);

                hull()
                {
                translate([0, 
                           OLED_Size[1]-0.5+0.7+0.5, 
                           oled_base_height+OLED_Size[2]/2+4.5+0.1] + OLED_Translate_Offset) 
                    rotate([0,90,0])
                    cylinder(h=(OLED_Size[0]+2),d=1,center=true,$fn=100);
                translate([0, 
                           OLED_Size[1]-0.5+0.7, 
                           oled_base_height+OLED_Size[2]/2+4.5+0.1] + OLED_Translate_Offset) 
                    rotate([0,90,0])
                    cylinder(h=(OLED_Size[0]+2),d=1,center=true,$fn=100);

                    }
                    
                translate([-OLED_Size[0]/2-1.5, 
                             OLED_Size[1]-4+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([1.5-0.2,5,oled_base_height+20+6.5],rc_size=1);

                translate([OLED_Size[0]/2+0.2, 
                             OLED_Size[1]-4+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([1.5-0.2,5,oled_base_height+20+6.5],rc_size=1);
            }



            // Border
    //        translate([0,mcu_socket_length/2-2,pcb_thickness/2-1])
    //            border(
    //                [mcu_h_unit_size*h_unit,mcu_v_unit_size*v_unit], 
    //                borders,  
    //                pcb_thickness-2
    //            );
        }


//move to oled_socket_cutout

//        for (pin = pins_count) {
//
//            translate([(pin)*mcu_pin_pitch,iLastRow,-10-0.01]) 
//                cylinder(h=oled_base_height+10+0.02,d=wire_diameter*1.5);
//            translate([-(pin)*mcu_pin_pitch,iLastRow,-10-0.01]) 
//                cylinder(h=oled_base_height+10+0.02,d=wire_diameter*1.5);
//            translate([
//                    (pin)*mcu_pin_pitch,wire_diameter/2,
//                    oled_base_height-wire_diameter/2
//                ]) rotate([90,-180,0])
//            cube([wire_diameter,wire_diameter+0.01,5+0.01],true);
//            translate([
//                    -(pin)*mcu_pin_pitch,wire_diameter/2,
//                    oled_base_height-wire_diameter/2
//                ]) rotate([90,0,0])
//            cube([wire_diameter,wire_diameter+0.01,5+0.01],true);
//
//            translate([
//                    (pin)*mcu_pin_pitch,wire_diameter/2,
//                    oled_base_height-wire_diameter/2-wire_diameter*2
//                ]) rotate([90,-180,0])
//            cube([wire_diameter,wire_diameter,5+0.01],true);
//            translate([
//                    -(pin)*mcu_pin_pitch,wire_diameter/2,
//                    oled_base_height-wire_diameter/2-wire_diameter*2
//                ]) rotate([90,0,0])
//            cube([wire_diameter,wire_diameter,5+0.01],true);
//
//        }

    }

                if (base_pcb_layout_OLED_Holder_D)  {
            
                    
                translate([-(OLED_Size[0]+0.4+(2))/2, 
                             -2-0.5+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([(OLED_Size[0]+0.4)+(2),1.5,oled_base_height+20+6.5],rc_size=1);
                hull()
                {
                translate([0, 
                           -2-0.5+0.7+1.5-0.5, 
                           oled_base_height+OLED_Size[2]/2+4.5+0.1] + OLED_Translate_Offset) 
                    rotate([0,90,0])
                    cylinder(h=(OLED_Size[0]+2),d=1,center=true,$fn=100);
                translate([0, 
                           -2-0.5+0.7+1.5, 
                           oled_base_height+OLED_Size[2]/2+4.5+0.1] + OLED_Translate_Offset) 
                    rotate([0,90,0])
                    cylinder(h=(OLED_Size[0]+2),d=1,center=true,$fn=100);
                }    
                translate([-OLED_Size[0]/2-1.5, 
                             -2-0.5+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([1.5-0.2,5,oled_base_height+20+6.5],rc_size=1);

                translate([OLED_Size[0]/2+0.2, 
                             -2-0.5+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([1.5-0.2,5,oled_base_height+20+6.5],rc_size=1);
            }

    //預覽顯示OLED位置模擬
    if ($preview==true && base_pcb_layout_Preview_Show_OLED==true) {
        %translate(OLED_Translate)
        OLED_PCB(oled_spec,pins_count,iLastRow);
    }    
    
    
    if (base_pcb_layout_OLED_Standoff_Type=="CS") {
    //Cylindrical Standoff
    //圓柱支架

        //LU
        if (base_pcb_layout_OLED_Standoff_LU)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LU);
        }
        //LD
        if (base_pcb_layout_OLED_Standoff_LD)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LD);
        }
        //RU
        if (base_pcb_layout_OLED_Standoff_RU)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RU);
        }
        //RD
        if (base_pcb_layout_OLED_Standoff_RD)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RD);
        }


        //U
        if (base_pcb_layout_OLED_Standoff_U)  {
        translate([-(OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_U);
        }
        //D
        if (base_pcb_layout_OLED_Standoff_D)  {
        translate([-(OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_D);
        }

        //L
        if (base_pcb_layout_OLED_Standoff_L)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_L);
        }
        //R
        if (base_pcb_layout_OLED_Standoff_R)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_R);
        }

        //C
        if (base_pcb_layout_OLED_Standoff_C)  {
        translate([(OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_C);
        }        

        
    } else if (base_pcb_layout_OLED_Standoff_Type=="SS") {
    //Square Standoff
    //方形支架
        //LU
        if (base_pcb_layout_OLED_Standoff_LU)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LU);
        }
        //LD
        if (base_pcb_layout_OLED_Standoff_LD)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LD);
        }
        //RU
        if (base_pcb_layout_OLED_Standoff_RU)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RU);
        }
        //RD
        if (base_pcb_layout_OLED_Standoff_RD)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RD);
        }
        //U
        if (base_pcb_layout_OLED_Standoff_U)  {
        translate([-(OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_U);
        }
        //D
        if (base_pcb_layout_OLED_Standoff_D)  {
        translate([-(OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_D);
        }
        //L
        if (base_pcb_layout_OLED_Standoff_L)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_L);
        }
        //R
        if (base_pcb_layout_OLED_Standoff_R)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_R);        
        }
        //C
        if (base_pcb_layout_OLED_Standoff_C)  {
        translate([(-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_C);        
        }

        }
    

    }

    translate([0,0,-50])
    cube([100,100,100],center=true);
    
    }        

    translate([0,OLED_Size[1]/2,border_z_offset ])
    border(
        [OLED_Size[0],OLED_Size[1]], 
        borders, 
        pcb_thickness-2, 
        h_border_width, 
        v_border_width
        );    
    
    }    

}


module OLED_Socket_OLD(OLED_Roate=[0,0,0],OLED_H=0)
{
    

    //OLED位移位置
    OLED_Translate=[-OLED_Size[0]/2+OLED_Translate_Offset[0],
                     OLED_Translate_Offset[1],
                     oled_Standoff_height+OLED_Translate_Offset[2]];

    iLastRow =(0+0.5)*mcu_pin_pitch;
    //        echo ("Last Row:",iLastRow);

    pins_count =
        OLED_Pins == 4
            ? [-0.5:1.5]
        : OLED_Pins == 5
            ? [-2:2]
        : OLED_Pins == 6
            ? [-2.5:2.5]
        : OLED_Pins == 7
            ? [-3:3]
        : OLED_Pins == 8
            ? [-3.5:3.5]
        : assert(false, "OLED pin (pins_count) count not supported");
            
    //Socket
    difference()
    {
    rotate(OLED_Roate)
    union()
    {
    difference() {
        union() {
            // Base
            translate([-(2.54*(OLED_Pins+1))/2,-2,-10]) 
                cube([2.54*(OLED_Pins+1),5,oled_base_height+10]);

            // Holder
            if (base_pcb_layout_OLED_Holder_U)  { 
            
                translate([-(OLED_Size[0]+0.4+1)/2, 
                            OLED_Size[1]-4+0.7, 
                            -20] +  OLED_Translate_Offset) 
                    cube([(OLED_Size[0]+0.4+1),5,oled_base_height+20+OLED_Pin_Plastic_H]);
                    
                translate([-(OLED_Size[0]+0.4+2)/2, 
                             OLED_Size[1]-0.5+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([(OLED_Size[0]+0.4+2),1.5,oled_base_height+20+6.5],rc_size=1);

                hull()
                {
                translate([0, 
                           OLED_Size[1]-0.5+0.7+0.5, 
                           oled_base_height+OLED_Size[2]/2+4.5+0.1] + OLED_Translate_Offset) 
                    rotate([0,90,0])
                    cylinder(h=(OLED_Size[0]+2),d=1,center=true,$fn=100);
                translate([0, 
                           OLED_Size[1]-0.5+0.7, 
                           oled_base_height+OLED_Size[2]/2+4.5+0.1] + OLED_Translate_Offset) 
                    rotate([0,90,0])
                    cylinder(h=(OLED_Size[0]+2),d=1,center=true,$fn=100);

                    }
                    
                translate([-OLED_Size[0]/2-1.5, 
                             OLED_Size[1]-4+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([1.5-0.2,5,oled_base_height+20+6.5],rc_size=1);

                translate([OLED_Size[0]/2+0.2, 
                             OLED_Size[1]-4+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([1.5-0.2,5,oled_base_height+20+6.5],rc_size=1);
            }



            // Border
    //        translate([0,mcu_socket_length/2-2,pcb_thickness/2-1])
    //            border(
    //                [mcu_h_unit_size*h_unit,mcu_v_unit_size*v_unit], 
    //                borders,  
    //                pcb_thickness-2
    //            );
        }


    
        for (pin = pins_count) {

            translate([(pin)*mcu_pin_pitch,iLastRow,-10-0.01]) 
                cylinder(h=oled_base_height+10+0.02,d=wire_diameter*1.5);
            translate([-(pin)*mcu_pin_pitch,iLastRow,-10-0.01]) 
                cylinder(h=oled_base_height+10+0.02,d=wire_diameter*1.5);
            translate([
                    (pin)*mcu_pin_pitch,wire_diameter/2,
                    oled_base_height-wire_diameter/2
                ]) rotate([90,-180,0])
            cube([wire_diameter,wire_diameter+0.01,5+0.01],true);
            translate([
                    -(pin)*mcu_pin_pitch,wire_diameter/2,
                    oled_base_height-wire_diameter/2
                ]) rotate([90,0,0])
            cube([wire_diameter,wire_diameter+0.01,5+0.01],true);

            translate([
                    (pin)*mcu_pin_pitch,wire_diameter/2,
                    oled_base_height-wire_diameter/2-wire_diameter*2
                ]) rotate([90,-180,0])
            cube([wire_diameter,wire_diameter,5+0.01],true);
            translate([
                    -(pin)*mcu_pin_pitch,wire_diameter/2,
                    oled_base_height-wire_diameter/2-wire_diameter*2
                ]) rotate([90,0,0])
            cube([wire_diameter,wire_diameter,5+0.01],true);

        }

    }

                if (base_pcb_layout_OLED_Holder_D)  {
            
                    
                translate([-(OLED_Size[0]+0.4+(2))/2, 
                             -2-0.5+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([(OLED_Size[0]+0.4)+(2),1.5,oled_base_height+20+6.5],rc_size=1);
                hull()
                {
                translate([0, 
                           -2-0.5+0.7+1.5-0.5, 
                           oled_base_height+OLED_Size[2]/2+4.5+0.1] + OLED_Translate_Offset) 
                    rotate([0,90,0])
                    cylinder(h=(OLED_Size[0]+2),d=1,center=true,$fn=100);
                translate([0, 
                           -2-0.5+0.7+1.5, 
                           oled_base_height+OLED_Size[2]/2+4.5+0.1] + OLED_Translate_Offset) 
                    rotate([0,90,0])
                    cylinder(h=(OLED_Size[0]+2),d=1,center=true,$fn=100);
                }    
                translate([-OLED_Size[0]/2-1.5, 
                             -2-0.5+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([1.5-0.2,5,oled_base_height+20+6.5],rc_size=1);

                translate([OLED_Size[0]/2+0.2, 
                             -2-0.5+0.7, 
                             -20] + OLED_Translate_Offset) 
                    cubeRC([1.5-0.2,5,oled_base_height+20+6.5],rc_size=1);
            }

            
            
    //預覽顯示OLED位置模擬
    if ($preview==true && base_pcb_layout_Preview_Show_OLED==true) {
        %translate(OLED_Translate)
        OLED_PCB(pins_count,iLastRow);
    }    
    
    
    if (base_pcb_layout_OLED_Standoff_Type=="CS") {
    //Cylindrical Standoff
    //圓柱支架

        //LU
        if (base_pcb_layout_OLED_Standoff_LU)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LU);
        }
        //LD
        if (base_pcb_layout_OLED_Standoff_LD)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LD);
        }
        //RU
        if (base_pcb_layout_OLED_Standoff_RU)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RU);
        }
        //RD
        if (base_pcb_layout_OLED_Standoff_RD)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RD);
        }


        //U
        if (base_pcb_layout_OLED_Standoff_U)  {
        translate([-(OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_U);
        }
        //D
        if (base_pcb_layout_OLED_Standoff_D)  {
        translate([-(OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_D);
        }

        //L
        if (base_pcb_layout_OLED_Standoff_L)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_L);
        }
        //R
        if (base_pcb_layout_OLED_Standoff_R)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_R);
        }

        //C
        if (base_pcb_layout_OLED_Standoff_C)  {
        translate([(OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size_CS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_C);
        }        

        
    } else if (base_pcb_layout_OLED_Standoff_Type=="SS") {
    //Square Standoff
    //方形支架
        //LU
        if (base_pcb_layout_OLED_Standoff_LU)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LU);
        }
        //LD
        if (base_pcb_layout_OLED_Standoff_LD)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_LD);
        }
        //RU
        if (base_pcb_layout_OLED_Standoff_RU)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RU);
        }
        //RD
        if (base_pcb_layout_OLED_Standoff_RD)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_RD);
        }
        //U
        if (base_pcb_layout_OLED_Standoff_U)  {
        translate([-(OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_U);
        }
        //D
        if (base_pcb_layout_OLED_Standoff_D)  {
        translate([-(OLED_Standoff_Offset[0]),OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_D);
        }
        //L
        if (base_pcb_layout_OLED_Standoff_L)  {
        translate([-(OLED_Hole_Distancia[0]/2+OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_L);
        }
        //R
        if (base_pcb_layout_OLED_Standoff_R)  {
        translate([(OLED_Hole_Distancia[0]/2-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_R);        
        }
        //C
        if (base_pcb_layout_OLED_Standoff_C)  {
        translate([(-OLED_Standoff_Offset[0]),OLED_Hole_Distancia[1]/2+OLED_Standoff_Offset[1],0])
        OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size_SS,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset_C);        
        }

        }
    

    }

    translate([0,0,-50])
    cube([100,100,100],center=true);
    
    }
}

//模擬OLED PCB佔據的部份
module OLED_PCB(oled_spec,pins_count=[-0.5:1.5],iLastRow =(0+0.5)*mcu_pin_pitch)
{
 
    OLED_Size=oled_spec[0][0];
    OLED_Pins=oled_spec[0][1];
    
    OLED_Pin_Plastic_H=oled_spec[0][2][0]; 
    OLED_Pin_Plastic_W=oled_spec[0][2][1]; 

    OLED_Hole_Distancia=oled_spec[0][3];
    OLED_Hole_Size=oled_spec[0][4];
    OLED_Translate_Offset=oled_spec[1];

    difference()
    {
    union()
    {
        cube(OLED_Size);
        
        //Pin Plastic
        translate([ (OLED_Size[0])/2 ,OLED_Pin_Plastic_W/2,-OLED_Pin_Plastic_H/2]-OLED_Translate_Offset) 
            cube([2.54*(OLED_Pins),OLED_Pin_Plastic_W,OLED_Pin_Plastic_H],center=true);

            
//        color("RED")
        translate([ (OLED_Size[0])/2 ,0,0]-OLED_Translate_Offset) 
        for (pin = pins_count) {

            translate([(pin)*mcu_pin_pitch,iLastRow,-11.5+OLED_Size[2]]) 
                cylinder(h=11.6,d=wire_diameter);
            translate([-(pin)*mcu_pin_pitch,iLastRow,-11.5+OLED_Size[2]]) 
                cylinder(h=11.6,d=wire_diameter);
        }        
        
    }
    //螺絲孔
    union()
    {
        translate([(OLED_Hole_Distancia[0])+OLED_Hole_Size,
                   (OLED_Hole_Distancia[1])+OLED_Hole_Size,
                    OLED_Size[2]/2])                   
            cylinder(h=OLED_Size[2]+1,d=OLED_Hole_Size, center=true,$fn=100);
        
        translate([OLED_Hole_Size,
                   (OLED_Hole_Distancia[1])+OLED_Hole_Size,
                    OLED_Size[2]/2])                   
            cylinder(h=OLED_Size[2]+1,d=OLED_Hole_Size, center=true,$fn=100);
        

        translate([OLED_Hole_Size,
                   OLED_Hole_Size,
                    OLED_Size[2]/2])                   
            cylinder(h=OLED_Size[2]+1,d=OLED_Hole_Size, center=true,$fn=100);


        translate([((OLED_Hole_Distancia[0]))+OLED_Hole_Size,
                   OLED_Hole_Size,
                    OLED_Size[2]/2])                   
            cylinder(h=OLED_Size[2]+1,d=OLED_Hole_Size, center=true,$fn=100);

    
    }
        }
}
 
 
module OLDE_Standoff_CS(oled_Standoff_height,OLED_Standoff_Size,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset)
{
//Cylindrical Standoff
difference()
{
union()
{
translate([0,0,oled_Standoff_height-OLED_Standoff_Size[2]/2])
cylinder(h=OLED_Standoff_Size[2],d1=OLED_Standoff_Size[1],d2=OLED_Standoff_Size[0],center=true,$fn=100);

}

translate([0,0,oled_Standoff_height-OLED_Pilot_Hole_Size[1]/2])
cylinder(h=OLED_Pilot_Hole_Size[1]+0.01,d=OLED_Pilot_Hole_Size[0],center=true,$fn=100);

}

color("RED")
hull()
{
translate([0,0,oled_Standoff_height-OLED_Standoff_Size[2]])
cylinder(h=0.01,d1=OLED_Standoff_Size[1],d2=OLED_Standoff_Size[1],center=true,$fn=100);

//延伸底座
rotate([-OLED_Roate[0],-OLED_Roate[1],-OLED_Roate[2]])
translate([OLED_Standoff_Base_Offset[0],OLED_Standoff_Base_Offset[1],-OLED_Standoff_Base_Offset[2]/2])
cylinder(h=0.01,d1=OLED_Standoff_Size[3],d2=OLED_Standoff_Size[1],center=true,$fn=100);

}
}



module OLDE_Standoff_SS(oled_Standoff_height,OLED_Standoff_Size,OLED_Pilot_Hole_Size,OLED_Roate,OLED_Standoff_Base_Offset)
{
//Square Standoff
difference()
{
union()
{
translate([0,0,oled_Standoff_height-OLED_Standoff_Size[2]/2])
cube([OLED_Standoff_Size[0],OLED_Standoff_Size[1],OLED_Standoff_Size[2]],center=true);

}

translate([0,0,oled_Standoff_height-1])
cylinder(h=OLED_Pilot_Hole_Size[1],d=OLED_Pilot_Hole_Size[0],center=true,$fn=100);

}

color("RED")
hull()
{
translate([0,0,oled_Standoff_height-OLED_Standoff_Size[2]])
cube([OLED_Standoff_Size[0],OLED_Standoff_Size[1],0.01],center=true);

//延伸底座
rotate([-OLED_Roate[0],-OLED_Roate[1],-OLED_Roate[2]])
translate([OLED_Standoff_Base_Offset[0],OLED_Standoff_Base_Offset[1],-OLED_Standoff_Base_Offset[2]/2])
cube([OLED_Standoff_Size[3],OLED_Standoff_Size[4],0.01],center=true);
}
}
    
module OLED_Socket_Hole()
{
        translate([-(2.54*5)/2,-2,0]) 
            cube([2.54*5,5,oled_base_height]);
}

//pcb
//translate([0,45/2-14,0])
//cubeRC([25,25,2],rc_size=2,center=true,cube_base=true,cube_top=false);

//cubeRC([45,40,2],rc_size=2,center=true,cube_base=true,cube_top=false);
//module cubeRC(size,rc_size=2,center=false,cube_base=true,cube_top=false) {

//TEST
//translate([0,30/2-6,0])
//cubeRC([25,30,2],rc_size=2,center=true,cube_base=true,cube_top=false); 

//difference()
//{
//OLED_Socket([30,0,0]);
//translate([4,-10,-20])
//cube([20,50,40]);
//}

//OLED_Socket_Hole();
//OLED_PCB();

//oled_base_height = 10-pcb_thickness;
//oled_Standoff_height = oled_base_height+2.7;


//FOR TEST
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


//oled_socket(borders=[4,4,4,4], extra_data=["0.96_27.3x27.8",oled_config[0],[15, 0, 0],"goldenrod"]);

//translate([30,0,0])
oled_socket(borders=[0,0,0,0], extra_data=["0.49_15x15",oled_config[0],[0, 0, 0],"goldenrod"]);
  
